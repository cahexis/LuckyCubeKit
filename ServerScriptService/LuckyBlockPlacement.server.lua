local rep = game:GetService("ReplicatedStorage")
local buildings = rep.Buildings
local placecube = rep.PlaceCube
local cube = rep.PlacedCube
local debounce = false
placecube.OnServerEvent:Connect(function(player, rootpos) -- handles placement of the block, so its infront of the player.
	local backpack = player:WaitForChild("Backpack")
	local character = player.Character
	if character:FindFirstChildWhichIsA("Tool") then
		character:FindFirstChildWhichIsA("Tool"):Destroy()
	end
	if debounce == false then
		debounce = true
		local dupecube = cube:Clone()
		dupecube.CFrame = rootpos*CFrame.new(0,-1,-5)
		dupecube.Parent = workspace
	end
	debounce = false
end)
