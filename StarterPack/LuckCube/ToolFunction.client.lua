local tool = script.Parent
local rep = game:GetService("ReplicatedStorage")
local step
local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local place = rep.PlaceCube
local char = player.Character

tool.Activated:Connect(function(plr)
	local root = char:WaitForChild("HumanoidRootPart")
	local rootpos = root.CFrame
	place:FireServer(rootpos)
end)
