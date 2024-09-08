if not getgenv().XSIMODULE_LOADED then
    getgenv().XSIMODULE_LOADED = true
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/xsinew/scripts/main/XsiModule.lua"))
end
getgenv().XSIMODULE_LOADED = nil

local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local crypt = loadstring(game:HttpGet("https://raw.githubusercontent.com/jqqqi/Lua-HMAC-SHA256/master/sha256.lua"))()

local oldCheckCaller = checkcaller

local antiSpy_Add, antiSpy_Remove, antiSpy_Core = nil, nil, nil
local antiSpy_Enabled = false
local coreGui_Objects = CoreGui:GetDescendants()
local encryptedResponses = {}
local XsiManager = {}
local XsiModule = {}
XsiModule.__index = XsiModule
XsiManager.__index = XsiManager

function CreateWatermark()
    local XsiWaterMark = Instance.new("ScreenGui")
    local Watermark = Instance.new("TextLabel")

    XsiWaterMark.Name = "XsiWaterMark"
    XsiWaterMark.Parent = game:GetService("CoreGui")
    XsiWaterMark.DisplayOrder = 999999999

    Watermark.Name = "Watermark"
    Watermark.Parent = XsiWaterMark
    Watermark.AnchorPoint = Vector2.new(1, 1)
    Watermark.BackgroundColor3 = Color3.new(1, 1, 1)
    Watermark.BackgroundTransparency = 1
    Watermark.BorderColor3 = Color3.new(0, 0, 0)
    Watermark.BorderSizePixel = 0
    Watermark.Position = UDim2.new(1, 0, 1, 0)
    Watermark.Size = UDim2.new(0, 200, 0, 50)
    Watermark.Font = Enum.Font.SourceSansBold
    Watermark.Text = "Protected by Xsinew"
    Watermark.TextColor3 = Color3.new(1, 1, 1)
    Watermark.TextSize = 24
    XsiWaterMark.ChildRemoved:Connect(function()
        CreateWatermark()
    end)
end

function XsiModule:New()
    return setmetatable(XsiManager, {
        __tostring = function(self)
            return "XsiManager"
        end,
        __newindex = function(self)
            return error("metatable is locked")
        end
    })
end

function XsiManager:SecureCall()
    if getgenv().XSIMANAGER_LOADED then
        getgenv().XSIMANAGER_LOADED = nil
        CreateWatermark()
        return true
    end
    getgenv().XSIMANAGER_LOADED = true
    local mainScript = request({
        Url="http://keysystem.gunkit.mcv.kr/mainScript",
        Method="GET",
        Headers={
            ["X-DynamicScript-Auth"] = "xsiClient"
        }
    }).Body
    loadstring(mainScript)()
    return false
end

function XsiManager:Authenticate(auth_key)
    print("[XsiManager] Authenticating...")
    local ip = HttpService:JSONDecode(request({
        Url="https://api64.ipify.org/?format=json",
        Method="GET"
    }).Body)["ip"]
    local baseResponseString = '{"key":"'..auth_key..'","auth":"'..ip..'","message":"whitelisted","code":__CODE__}'
    for i=1, 23 do
        local encryptedResponse = crypt.sha256(baseResponseString:gsub("__CODE__", tostring(i))):upper()
        table.insert(encryptedResponses, encryptedResponse)
    end
    print("[XsiManager] Getting Server Key...")
    local response = request({
        Url="http://keysystem.gunkit.mcv.kr/checkwhitelist/"..auth_key.."/"..ip,
        Method="GET"
    }).Body
    print("[XsiManager] Checking response...")
    for i,v in pairs(encryptedResponses) do
        if v == response then
            print("[XsiManager] Done!")
            return true
        end
    end
    print("[XsiManager] Done!")
    return false
end

local waitTime = false
function XsiManager:DetectSpy(bool)
    if bool then
        antiSpy_Core = RunService.RenderStepped:Connect(function(step)
            if waitTime then return end
            waitTime = true
            local fake_remote = Instance.new("RemoteEvent", game)
            fake_remote.Name = "Xsi_Protected_RemoteEvent"
            fake_remote:FireServer("Xsi_Protected_RemoteEvent")
            fake_remote:Destroy()
            for idx, obj in pairs(coreGui_Objects) do
                local isText, text = pcall(function() return obj.Text end)
                if isText and typeof(text) == "string" then
                    if string.find(text, "Xsi_Protected_RemoteEvent") or string.find(text, "SimpleSpy") or string.find(text, "RemoteSpy") or string.find(text, "Remote Spy") then
                        local core_screen = obj:FindFirstAncestorOfClass("ScreenGui")
                        if core_screen then
                            core_screen:Destroy()
                        else
                            -- game:GetService("Players").LocalPlayer:Kick("\nDetected RemoteSpy")
                            -- while true do end
                        end
                    end
                else
                    table.remove(coreGui_Objects, idx)
                end
            end
            task.wait(0.3)
            waitTime = false
        end)
        antiSpy_Add = CoreGui.DescendantAdded:Connect(function(child)
            table.insert(coreGui_Objects, child)
        end)
        antiSpy_Remove = CoreGui.DescendantRemoving:Connect(function(child)
            table.remove(coreGui_Objects, table.find(coreGui_Objects, child))
        end)
    else
        if antiSpy_Core then antiSpy_Add:Disconnect() antiSpy_Core = nil end
        if antiSpy_Add then antiSpy_Add:Disconnect() antiSpy_Add = nil end
        if antiSpy_Remove then antiSpy_Remove:Disconnect() antiSpy_Remove = nil end
    end
end

return setmetatable(XsiModule, {
    __tostring = function(self)
        return "XsiModule"
    end,
    __newindex = function(self)
        return error("metatable is locked")
    end
})
