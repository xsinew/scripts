local Players = game:GetService("Players")
local Replication = game:GetService("ReplicatedStorage"):WaitForChild("ChatReplication")

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message, r)
        Replication:FireAllClients(player.UserId, message)
    end)
end)
