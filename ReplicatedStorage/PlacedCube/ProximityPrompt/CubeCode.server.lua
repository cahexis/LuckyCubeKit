local prompt = script.Parent
local cube = prompt.Parent
local rep = game:GetService("ReplicatedStorage")
local ts = game:GetService("TweenService")
local info1 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false)
local info2 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false)
local tsc1 = ts:Create(prompt.Parent, info1, {Position = Vector3.new(cube.Position.X,cube.Position.y+3,cube.Position.Z)})
local tsc2 = ts:Create(prompt.Parent, info2, {Orientation = Vector3.new(360,0,0)})
local chargesound = cube.BlockChargeUp
local popsound = cube.PopSound
local buildinglist = rep.Buildings
local enemylist = rep.Enemies
local itemslist = rep.Items



local function picker()
	local modechose = {itemslist, enemylist, buildinglist}
	local randommode = modechose[math.random(#modechose)]
	local modechosen = randommode
	
	if modechosen.Name == "Items" then
		local childlist = modechosen:GetChildren()
		local randomselect = childlist[math.random(1, #childlist)]:Clone()
		randomselect.Parent = workspace
		randomselect:MoveTo(Vector3.new(cube.Position.X, cube.Position.Y, cube.Position.Z))
	elseif modechosen.Name == "Buildings" then
		local childlist = modechosen:GetChildren()
		local randomselect = childlist[math.random(1, #childlist)]:Clone()
		randomselect.Parent = workspace
		randomselect:MoveTo(Vector3.new(cube.Position.X, 0, cube.Position.Z))
	elseif modechosen.Name == "Enemies" then
		local childlist = modechosen:GetChildren()
		local randomselect = childlist[math.random(1, #childlist)]:Clone()
		randomselect.Parent = workspace
		randomselect:MoveTo(Vector3.new(cube.Position.X, cube.Position.Y, cube.Position.Z))
	end
end	
prompt.Triggered:Connect(function()
	prompt.Enabled = false
	tsc1:Play()
	tsc2:Play()
	chargesound:Play()
	wait(5)
	popsound:Play()
	picker()
	cube:Destroy()
end)
