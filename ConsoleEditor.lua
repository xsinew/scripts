local console_progress = {}
console_progress.__index = console_progress

function console_progress.getassetfromurl(url, name)
    assert(getcustomasset and writefile and delfile, "Not Support Executor (Required getcustomasset)")
    assert(url and name, "Invalid argument")
    local buff = game:HttpGet(url)
    local name = name
    writefile(name,buff)
    local id = getcustomasset(name)
    delfile(name)
    return id
end

function console_progress.new()
    local self = setmetatable({},console_progress)
    self.new = nil
    self.check_content = math.random(1000000,9999999)
    self.message_object = nil
    self.last_modify_message = ""
    self.icon = ""
    self.base_text = ""
    self.color = nil
    self.setMessage = function(self,content)
        self.last_modify_message = content
    end
    self.setIcon = function(self,icon)
        self.icon = icon
    end
    self.setColor = function(self,color)
        self.color = color
    end
    self.detection = coroutine.create(function()
        local dev_console
        repeat
            dev_console = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
            task.wait()
        until dev_console
        dev_console.DevConsoleWindow.DevConsoleUI.DescendantAdded:Connect(function(obj)
            if obj:IsA("TextLabel") and obj.Text:find(self.check_content) then
                self.message_object = obj.Parent
                if not self.color then self.color = obj.TextColor3 end
                self.base_text = obj.Text:split(" -- ")[1] .. " -- "
            end
        end)
        for idx,obj in pairs(dev_console.DevConsoleWindow.DevConsoleUI:GetDescendants()) do
            if obj:IsA("TextLabel") and obj.Text:find(self.check_content) then
                self.message_object = obj.Parent
                if not self.color then self.color = obj.TextColor3 end
                self.base_text = obj.Text:split(" -- ")[1] .. " -- "
            end
        end
    end)
    self.updater = coroutine.create(function()
        while task.wait() do
            if self.message_object then
                task.spawn(function() xpcall(function() self.message_object.image.Image = self.icon end,function() self.message_object = nil end) end)
                task.spawn(function() xpcall(function() self.message_object.msg.Text = self.base_text .. self.last_modify_message end,function() self.message_object = nil end) end)
                task.spawn(function() xpcall(function() self.message_object.msg.TextColor3 = self.color end,function() self.message_object = nil end) end)
            end
        end
    end)
    coroutine.resume(self.detection)
    coroutine.resume(self.updater)
    return self
end

return console_progress
