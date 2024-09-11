local TCS = game:GetService("TextChatService")
local Players = game:GetService("Players")
local Replication = game:GetService("ReplicatedStorage"):WaitForChild("ChatReplication")
local LatestMessage = {}

Replication.OnClientEvent:Connect(function(uid,msg)
    LatestMessage[uid] = msg
end)

TCS.OnIncomingMessage = function(message)
    if message.TextSource then
        local properties = Instance.new("TextChatMessageProperties")
        if message.TextSource then
            properties.Text = ""
            local player = Players:GetPlayerByUserId(message.TextSource.UserId)
            if player then
                if player:GetAttribute("Muted") then
                    message.TextSource.CanSend = false
                    message.Text = ""
                else
                    properties.Text = LatestMessage[message.TextSource.UserId] or ""
                    if LatestMessage[message.TextSource.UserId] then
                        LatestMessage[message.TextSource.UserId] = nil
                    end
                end
            end
        end
        return properties
    end
end
