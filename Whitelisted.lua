--// Menus \\--
getgenv().LB = true
getgenv().CONSOLE = true
getgenv().LoadAutoFarm = true

--// Auto Farm Config V.1 \\--
getgenv().autofarm = true
getgenv().AutoRebirth = true
getgenv().NoFormEnergyDrain = false
getgenv().AutoFpsBoost = true
getgenv().autostackloop = true

wait(4)

repeat
	task.wait()
until game.Players.LocalPlayer ~= nil and game:GetService("Players").LocalPlayer.Name ~= nil and game.Players.LocalPlayer:GetMouse() ~= nil and game:IsLoaded()

local plr = game:GetService("Players").LocalPlayer
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()
local function stoprunning()
	while true do
	end 
end

local iswhitelistedz1 = false
if HWID ~= "4AC440E7-3775-4DA0-AEFD-68B3711E7B7C" and HWID ~= "E7E1F86A-639C-4852-8A1E-0019D2626AE3" then
	iswhitelistedz1 = false
else
	iswhitelistedz1 = true
end

iswhitelistedz1 = true

if not iswhitelistedz1 then
	stoprunning()
else
	if  game.PlaceId == 5151400895 and game.PlaceId == 3311165597 and game.PlaceId == 3608496430 then
		return stoprunning()
	else

		local vu = game:GetService("VirtualUser")
		plr.Idled:connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)

		function GetPlayer(String)
			String = String:gsub("%s+", "")
			for _, v in pairs(game:GetService("Players"):GetPlayers()) do
				if v.Name:lower():match("^" .. String:lower()) or v.DisplayName:lower():match("^" .. String:lower()) then
					return v
				end
			end
			return nil
		end

		spawn(function()
			if getgenv().LoadAutoFarm then
				getgenv().AutoAttackst = true
				getgenv().AutoBlock = true
				getgenv().AutoCharge = true
				getgenv().AutoTransform = true

				spawn(function()
					while true do
						task.wait()
						setfpscap(10000)
					end
				end)

				game:WaitForChild("ReplicatedStorage")
				game.ReplicatedStorage:WaitForChild("Datas")
				game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)

				getgenv().stackneeded = true
				local targetted;
				local transformStatus = false
				local autoFarmLoopRunning = false
				local stacked = false
				local flying = false
				local switch = 1
				local charge = false
				local checkValue;
				getgenv().dead = false
				getgenv().rebirthed = false
				local function getCheckValue()
					data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
					local a = data.Strength.Value
					local b = data.Energy.Value
					local c = data.Defense.Value
					local d = data.Speed.Value
					local smallest = a
					if b < smallest then
						smallest = b
					end
					if c < smallest then
						smallest = c
					end
					if d < smallest then
						smallest = d
					end
					checkValue = smallest
					return checkValue
				end
				local FormsList = {
					Evil = {
						{
							name = "Kaioken",
							reqvalue = 1000,
							endrangevalue = 2500,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "FSSJ",
							reqvalue = 2501,
							endrangevalue = 6000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ",
							reqvalue = 6001,
							endrangevalue = 16000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ Kaioken",
							reqvalue = 16001,
							endrangevalue = 34000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ2",
							reqvalue = 34001,
							endrangevalue = 50000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ2 Kaioken",
							reqvalue = 50001,
							endrangevalue = 65000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ2 Majin",
							reqvalue = 65001,
							endrangevalue = 95000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "SSJ3",
							reqvalue = 95001,
							endrangevalue = 140000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "LSSJ",
							reqvalue = 140001,
							endrangevalue = 200000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "LSSJ Kaioken",
							reqvalue = 160001,
							endrangevalue = 200000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Mystic",
							reqvalue = 200001,
							endrangevalue = 300000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Mystic Kaioken",
							reqvalue = 250001,
							endrangevalue = 300000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ4",
							reqvalue = 300001,
							endrangevalue = 450000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJG",
							reqvalue = 450001,
							endrangevalue = 700000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ5",
							reqvalue = 550001,
							endrangevalue = 700000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Corrupt SSJ",
							reqvalue = 700001,
							endrangevalue = 800000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "LSSJ3",
							reqvalue = 800001,
							endrangevalue = 1000000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJG4",
							reqvalue = 1000001,
							endrangevalue = 1400000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ Rose",
							reqvalue = 1400001,
							endrangevalue = 2400000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "True Rose",
							reqvalue = 2400001,
							endrangevalue = 3000000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "SSJ Berserker",
							reqvalue = 3000001,
							endrangevalue = 3500000,
							alignment = "Evil",
							rebirthReq = 1
						},
						{
							name = "Dark Rose",
							reqvalue = 3500001,
							endrangevalue = 4000000,
							alignment = "Evil",
							rebirthReq = 2
						},
						{
							name = "Evil SSJ",
							reqvalue = 4000001,
							endrangevalue = 5000000,
							alignment = "Evil",
							rebirthReq = 3
						},
						{
							name = "Super Broly",
							reqvalue = 4000001,
							endrangevalue = 5000000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "Ultra Instinct Omen",
							reqvalue = 5000001,
							endrangevalue = 8000000,
							alignment = "Neutral",
							rebirthReq = 3
						},
						{
							name = "Godly SSJ2",
							reqvalue = 8000001,
							endrangevalue = 14000000,
							alignment = "Neutral",
							rebirthReq = 4
						},
						{
							name = "Jiren Ultra Instinct",
							reqvalue = 14000001,
							endrangevalue = 30000000,
							alignment = "Evil",
							rebirthReq = 6
						},
						{
							name = "God of Destruction",
							reqvalue = 30000001,
							endrangevalue = 30000002,
							alignment = "Evil",
							rebirthReq = 10
						},
						{
							name = "True God of Destruction",
							reqvalue = 30000003,
							endrangevalue = 50000000,
							alignment = "Evil",
							rebirthReq = 10
						},
						{
							name = "SSJR3",
							reqvalue = 50000001,
							endrangevalue = 50000002,
							alignment = "Evil",
							rebirthReq = 12
						},
						{
							name = "SSJB4",
							reqvalue = 50000003,
							endrangevalue = 100000000,
							alignment = "Good",
							rebirthReq = 13
						},
						{
							name = "LBSSJ4",
							reqvalue = 100000001,
							endrangevalue = 120000000,
							alignment = "Good",
							rebirthReq = 18
						},
						{
							name = "Ultra Ego",
							reqvalue = 120000001,
							endrangevalue = 120000002,
							alignment = "Evil",
							rebirthReq = 20
						}
						{
							name = "Beast"
							reqvalue = 120000002
							endrangevalue = 2000000000000000000
							alignment = "Neutral"
							rebirthReq = 24
						}
					}, -- close evil
					Good = {
						{
							name = "Kaioken",
							reqvalue = 1000,
							endrangevalue = 2500,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "FSSJ",
							reqvalue = 2501,
							endrangevalue = 6000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ",
							reqvalue = 6001,
							endrangevalue = 16000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ Kaioken",
							reqvalue = 16001,
							endrangevalue = 34000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ2",
							reqvalue = 34001,
							endrangevalue = 65000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ2 Kaioken",
							reqvalue = 50001,
							endrangevalue = 65000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Spirit SSJ",
							reqvalue = 65001,
							endrangevalue = 95000,
							alignment = "Good",
							rebirthReq = 0
						},
						{
							name = "SSJ3",
							reqvalue = 95001,
							endrangevalue = 140000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "LSSJ",
							reqvalue = 140001,
							endrangevalue = 160000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "LSSJ Kaioken",
							reqvalue = 160001,
							endrangevalue = 200000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Mystic",
							reqvalue = 200001,
							endrangevalue = 300000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "Mystic Kaioken",
							reqvalue = 250001,
							endrangevalue = 300000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ4",
							reqvalue = 300001,
							endrangevalue = 450000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJG",
							reqvalue = 450001,
							endrangevalue = 550000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ5",
							reqvalue = 550001,
							endrangevalue = 700000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ Rage",
							reqvalue = 700001,
							endrangevalue = 1200000,
							alignment = "Good",
							rebirthReq = 0
						},
						{
							name = "LSSJ3",
							reqvalue = 800001,
							endrangevalue = 1000000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJG4",
							reqvalue = 1000001,
							endrangevalue = 1400000,
							alignment = "Neutral",
							rebirthReq = 0
						},
						{
							name = "SSJ Blue",
							reqvalue = 1200001,
							endrangevalue = 2200000,
							alignment = "Good",
							rebirthReq = 0
						},

						{
							name = "SSJB Kaioken",
							reqvalue = 2200001,
							endrangevalue = 3000000,
							alignment = "Good",
							rebirthReq = 0
						},
						{
							name = "Kefla SSJ2",
							reqvalue = 3000001,
							endrangevalue = 3500000,
							alignment = "Good",
							rebirthReq = 1
						},
						{
							name = "Blue Evolution",
							reqvalue = 3500001,
							endrangevalue = 5000000,
							alignment = "Good",
							rebirthReq = 2
						},
						{
							name = "Super Broly",
							reqvalue = 4000001,
							endrangevalue = 5000000,
							alignment = "Evil",
							rebirthReq = 0
						},
						{
							name = "Ultra Instinct Omen",
							reqvalue = 5000001,
							endrangevalue = 8000000,
							alignment = "Neutral",
							rebirthReq = 3
						},
						{
							name = "Godly SSJ2",
							reqvalue = 8000001,
							endrangevalue = 14000000,
							alignment = "Neutral",
							rebirthReq = 4
						},
						{
							name = "Mastered Ultra Instinct",
							reqvalue = 14000001,
							endrangevalue = 30000000,
							alignment = "Good",
							rebirthReq = 6
						},
						{
							name = "God of Creation",
							reqvalue = 30000001,
							endrangevalue = 50000000,
							alignment = "Good",
							rebirthReq = 10
						},
						{
							name = "True God of Creation",
							reqvalue = 30000001,
							endrangevalue = 50000000,
							alignment = "Good",
							rebirthReq = 10
						},
						{
							name = "SSJB3",
							reqvalue = 50000001,
							endrangevalue = 100000000,
							alignment = "Good",
							rebirthReq = 12
						},
						{
							name = "SSJB4",
							reqvalue = 50000001,
							endrangevalue = 100000000,
							alignment = "Good",
							rebirthReq = 13
						},
						{
							name = "LBSSJ4",
							reqvalue = 100000001,
							endrangevalue = 120000001,
							alignment = "Good",
							rebirthReq = 18
						},
						{
							name = "SSJBUI",
							reqvalue = 120000001,
							endrangevalue = 2000000000000000000,
							alignment = "Good",
							rebirthReq = 20
						}
						{
							name = "Beast"
							reqvalue = 120000002
							endrangevalue = 2000000000000000000
							alignment = "Neutral"
							rebirthReq = 24
						}
					}
				}
				local quests = {
					{
						name = "X Fighter Trainer",
						nickname = "X Fighter",
						requiredValue = 0,
						endRange = 30000,
						planet = "Earth"
					},
					{
						name = "Klirin",
						nickname = "Klirin",
						requiredValue = 30001,
						endRange = 60000,
						planet = "Earth"
					},
					{
						name = "Kid Nohag",
						nickname = "Kid Nohag",
						requiredValue = 60001,
						endRange = 80000,
						planet = "Earth"
					},
					{
						name = "Turtle Student",
						nickname = "Turtle Student",
						requiredValue = 80001,
						endRange = 100000,
						planet = "Earth"
					},
					{
						name = "Radish",
						nickname = "Radish",
						requiredValue = 100001,
						endRange = 200000,
						planet = "Earth"
					},
					{
						name = "Mapa",
						nickname = "Mapa",
						requiredValue = 200001,
						endRange = 300000,
						planet = "Earth"
					},
					{
						name = "Citizen",
						nickname = "Evil Saya",
						requiredValue = 300001,
						endRange = 400000,
						planet = "Earth"
					},
					{
						name = "Top X Fighter",
						nickname = "X Fighter Master",
						requiredValue = 400001,
						endRange = 750000,
						planet = "Earth"
					},
					{
						name = "Super Vegetable",
						nickname = "Super Vegetable",
						requiredValue = 750001,
						endRange = 1000000,
						planet = "Earth"
					},
					{
						name = "Perfect Atom",
						nickname = "Perfect Atom",
						requiredValue = 1000005,
						endRange = 2100000,
						planet = "Earth"
					},
					{
						name = "SSJ2 Wukong",
						nickname = "SSJ2 Wukong",
						requiredValue = 2100001,
						endRange = 3000000,
						planet = "Earth"
					},
					{
						name = "SSJB Wukong",
						nickname = "SSJB Wukong",
						requiredValue = 3000001,
						endRange = 12500000,
						planet = "Earth"
					},
					{
						name = "Broccoli",
						nickname = "Broccoli",
						requiredValue = 12500001,
						endRange = 37500000,
						planet = "Earth"
					},
					{
						name = "SSJG Kakata",
						nickname = "SSJG Kakata",
						requiredValue = 37500002,
						endRange = 200000000,
						planet = "Earth"
					},
					{
						name = "Vegetable (GoD in-training)",
						nickname = "Vegetable (GoD in-training)",
						requiredValue = 50000001,
						endRange = 80000000,
						planet = "Bills"
					},
					{
						name = "Wukong (Omen)",
						nickname = "Wukong (Omen)",
						requiredValue = 80000001,
						endRange = 150000000,
						planet = "Bills"
					},
					{
						name = "Vills (50%)",
						nickname = "Vills (50%)",
						requiredValue = 150000001,
						endRange = 250000000,
						planet = "Bills"
					},
					{
						name = "Vis (20%)",
						nickname = "Vis (20%)",
						requiredValue = 250000001,
						endRange = 450000001,
						planet = "Bills"
					},
					{
						name = "Vegetable (LBSSJ4)",
						nickname = "Vegetable (LBSSJ4)",
						requiredValue = 450000001,
						endRange = 675000000,
						planet = "Bills"
					},
					{
						name = "Wukong (LBSSJ4)",
						nickname = "Wukong (LBSSJ4)",
						requiredValue = 675000001,
						endRange = 1050000000,
						planet = "Bills"
					},
					{
						name = "Vekuta (LBSSJ4)",
						nickname = "Vekuta (LBSSJ4)",
						requiredValue = 1050000001,
						endRange = 1250000000,
						planet = "Bills"
					},
					{
						name = "Wukong Rose",
						nickname = "Wukong Rose",
						requiredValue = 1250000001,
						endRange = 1375000000,
						planet = "Bills"
					},
					{
						name = "Vekuta (SSJBUI)",
						nickname = "Vekuta (SSJBUI)",
						requiredValue = 1375000001,
						endRange = 99999999999999999999999,
						planet = "Bills"
					}
				}
				local function check1()
					local checkValue = getCheckValue()
					if checkValue >= 200000000 and game.placeId ~= 5151400895 then
						data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
						if data.Zeni.Value >= 15000 then
							local A_1 = "Vills Planet"
							local Event = game:GetService("ReplicatedStorage").Package.Events.TP
							Event:InvokeServer(A_1)
							tp = true
							return tp
						else
							SelectedQuests = "SSJG Kakata"
							SelectedMobs = "SSJG Kakata"
							tp = false
							return SelectedQuests, SelectedMobs, tp
						end
					end
					if checkValue <= 200000000 and game.placeId == 5151400895 then
						if checkValue < 200000000 and game.placeId ~= 3311165597 then
							local A_1 = "Earth"
							local Event = game:GetService("ReplicatedStorage").Package.Events.TP
							Event:InvokeServer(A_1)
							wait(8)
						end
					end
				end
				check1()
				function target()
					targetted = plr.name
				end
				target()
				repeat
					task.wait()
				until plr and plr.PlayerGui:WaitForChild("Main")

				if game.PlaceId == 3311165597 then
					local Character = plr.Character or plr:WaitForChild("Character")
					local PlayeGui = plr.PlayerGui
					local Starter = PlayeGui:FindFirstChild("Start")
					if Starter then
						plr.PlayerGui.Start.New:Destroy()
						game.ReplicatedStorage.Package.Events.Start:InvokeServer()
						Character.Humanoid.Health = 0
					end
				end

				function target()
					targetted = plr.name
				end
				target()
				local function deadcheck()
					pcall(function()
						wait()
						if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
							getgenv().dead = true
							getgenv().stackneeded = true
							autoFarmLoopRunning = false
							flying = false
							return getgenv().dead, getgenv().stackneeded, autoFarmLoopRunning, flying
						else
							getgenv().dead = false
							return getgenv().dead
						end
					end)
				end
				local function autostack(stack1)
					pcall(function()
						local player = game.Players.LocalPlayer
						local data = game.ReplicatedStorage.Datas[player.UserId]
						local Remote = game.ReplicatedStorage.Package.Events

						if not player or not data then
							return
						end

						targetted = player.Name
						if stack1 == true and data.Energy.Value > 8000000 and not getgenv().dead then
							wait(1.5)
							wait()
							game.workspace.Living[targetted].UpperTorso:Destroy()
							wait(4.98)

							local Arguments = { "Godly SSJ2" }
							Remote['equipskill']:InvokeServer(unpack(Arguments))

							for i = 1, 2 do
								Remote['ta']:InvokeServer(unpack(Arguments))
								wait(0.1)
							end

							wait()
							Remote['ta']:InvokeServer()

						elseif stack1 == false then
							Remote['ta']:InvokeServer()

						elseif stack1 == true and data.Energy.Value < 8000000 then
							Remote['AuraTrigger']:InvokeServer()
						end

						getgenv().stackneeded = false
						transformStatus = true
						autoFarmLoopRunning = true
						flying = false
						return transformStatus, autoFarmLoopRunning, flying
					end)
				end
				local function check69()
					local player = game.Players.LocalPlayer
					local data = game.ReplicatedStorage.Datas[player.UserId]
					local Remote = game.ReplicatedStorage.Package.Events
					if data.Energy.Value > 8000000 then
						getgenv().stackneeded = true
					end
				end

				local function getQuest()
					local checkValue = getCheckValue()
					local previousQuestName
					local selectedQuests, selectedMobs, samePlanet -- Initialize variables

					for i, quest in ipairs(quests) do
						if checkValue >= quest.requiredValue and checkValue <= quest.endRange then
							if switch == 1 then
								selectedQuests, selectedMobs, planet1 = quest.name, quest.nickname, quest.planet
								return selectedQuests, selectedMobs, planet1
							elseif switch == 2 then
								if i >= 2 then
									for j = i - 1, 1, -1 do
										local prevQuest = quests[j]
										if planet1 == prevQuest.planet then
											return prevQuest.name, prevQuest.nickname, true
										end
									end
								end
								return quest.name, quest.nickname, 1
							end
						end
					end

					return nil -- No quest found
				end

				local attacks = {
					"Mach Kick",
					"Vital Strike",
					"Wolf Fang Fist",
					"Uppercut",
					"Meteor Charge",
					"Bone Crusher",
					"Vanish Strike",
					"God Slicer",
					"Spirit Barrage",
					"Meteor Strike",
					"Spirit Breaking Cannon",
					"Super Dragon Fist",
					"High Power Rush"
				}

				local data = plr.Character.Stats
				local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
				local rebirthRemote = game:GetService("ReplicatedStorage").Package.Events.reb
				getgenv().stackneeded = true

				spawn(function()
					while getgenv().AutoBlock do
						task.wait()
						if not getgenv().AutoBlock then
							break
						end
						if game:GetService("Players").LocalPlayer.Status.Blocking.Value ~= true then
							task.spawn(function()
								game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
							end)
						end
					end
				end)

				spawn(function()
					pcall(function()
						game.Workspace.Living:WaitForChild(targetted)
						game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")
						local bv = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyVelocity")
						local bg = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyGyro")
						bg.P = 4000
						bg.MaxTorque = Vector3.new(500000, 500000, 500000)
						bv.P = 1000
						bv.MaxForce = Vector3.new(100000, 100000, 100000)
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
						game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
						game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
						game:GetService("ReplicatedStorage").Package.Events.AuraTrigger:InvokeServer()
						flying = true
					end)
					while getgenv().autofarm == true do
						wait()
						if getgenv().stackneeded == true then
							deadcheck()
							repeat
								wait()
								deadcheck()
							until getgenv().dead == false
							if getgenv().stackneeded == true then
								if getgenv().autostackloop == true  then
									stack1 = true
									autostack(stack1)
									repeat
										wait()
									until getgenv().stackneeded == false
								elseif getgenv().autostackloop == false  then
									stack1 = false
									autostack(stack1)
								end
							end
						else
							charge = false
							autoFarmLoopRunning = true
							flying = false

						end
						checkstackreq = getCheckValue()
						if checkstackreq < 8000000 then
							autoFarmLoopRunning = true
						end
						if getgenv().rebirthed == true and game.placeId == 5151400895 then
							wait(10)
							return
						elseif getgenv().rebirthed == true and game.placeId ~= 5151400895 then
							wait(3)
						end
						if charge == false and getgenv().dead == false and autoFarmLoopRunning == true and getgenv().autofarm == true then
							spawn(function()
								while autoFarmLoopRunning and getgenv().autofarm == true do
									wait()
									if getgenv().AutoCharge == true then
										local args = {
											[1] = "Blacknwhite27"
										}
										game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer(unpack(args))
										wait()
									end
								end
							end)
							spawn(function()
								while autoFarmLoopRunning and getgenv().autofarm == true do
									if getgenv().AutoTransform == true then
										wait(0.1)
										pcall(function()
											data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
											local formtouse;
											if transformStatus == true and game.Workspace.Living[targetted].Stats.Ki.Value > 400 then
												local value = getCheckValue()
												local alignment = data.Allignment.Value
												local forms = FormsList[alignment]
												local matchFound = false  -- Initialize a flag variable to false
												for _, form in ipairs(forms) do
													if value >= form.reqvalue and value <= form.endrangevalue then
														formtouse = form.name
														matchFound = true  -- Set the flag to true when a match is found
														break  -- Break out of the loop since a match has been found
													end
												end
												if not matchFound then
													for _, form in ipairs(forms) do
														if  form.rebirthReq >= data.Rebirth.Value then
															formtouse = form.name
															break
														end
													end
												end
												equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
												equipRemote:InvokeServer(formtouse)
												repeat
													wait()
													if game.Players.LocalPlayer.Status.SelectedTransformation.Value ~= game.Players.LocalPlayer.Status.Transformation.Value then
														getgenv().AutoCharge = false
														game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
													end
												until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
													game.Players.LocalPlayer.Status.Transformation.Value or
													game.Workspace.Living[targetted].Stats.Ki.Value < 300


												getgenv().AutoCharge = true
											end
										end)
									end
									wait(.2)
								end
							end)
							charge = true
						end
						if flying == false and getgenv().dead == false and autoFarmLoopRunning == true and getgenv().autofarm == true then
							pcall(function()
								game.Workspace.Living:WaitForChild(targetted)
								game.Workspace.Living[targetted]:WaitForChild("HumanoidRootPart")
								local bv = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyVelocity")
								local bg = game.Workspace.Living[targetted].HumanoidRootPart:WaitForChild("BodyGyro")
								bg.P = 1
								bg.MaxTorque = Vector3.new(500000, 500000, 500000)
								bv.P = 1
								bv.MaxForce = Vector3.new(100000, 100000, 100000)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
								game:GetService("ReplicatedStorage").Package.Events.AuraTrigger:InvokeServer()
								flying = true
							end)
						end
						if getgenv().dead == false and getgenv().stackneeded == false and autoFarmLoopRunning == true and getgenv().autofarm == true then
							wait()
							while autoFarmLoopRunning and getgenv().autofarm == true do
								local success, err = pcall(function()
									while autoFarmLoopRunning and getgenv().autofarm == true do
										wait()
										check1()
										pcall(function()
											while autoFarmLoopRunning and getgenv().autofarm == true  do
												if breakagain == true then
													breakagain = false
													break
												end
												if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
													for i, v in ipairs(game:GetService("Workspace").Living:GetChildren()) do
														switch = 1
														local checkValue = getCheckValue()
														if checkValue >= 200000000 and game.placeId ~= 5151400895 then
															SelectedQuests, SelectedMobs = "SSJG Kakata", "SSJG Kakata"
														else
															switch = 1
															SelectedQuests, SelectedMobs, sameplanet = getQuest(switch)
														end
														if v.Name:lower() == SelectedMobs:lower() and game.Players.LocalPlayer.Character and
															game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
															v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
															v.Humanoid.Health > 0 then
															if game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value ~= SelectedQuests then -- error around here
																game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests]
																	.HumanoidRootPart.CFrame
																repeat
																	wait()

																	game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
																until game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value == SelectedQuests or
																	game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not autofarm
															end -- undefined
															game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame +
																Vector3.new(0, 0, 0)
															--    wait(.2)
															--    player = game.Players.LocalPlayer

															--    humanoid = player.Character.Humanoid
															--    direction = humanoid.Parent.HumanoidRootPart.CFrame.lookVector -- Get the direction the character is facing

															--    offset = Vector3.new(0, 0, -5) -- Adjust the offset to position the attack in front of the character
															--    attackPosition = humanoid.Parent.HumanoidRootPart.Position + direction * offset

															--    attackCFrame = CFrame.new(attackPosition, attackPosition + direction)
															spawn(function()
																repeat
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame +
																		Vector3.new(0, 0, 2)
																	wait()
																until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																	game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not autofarm
															end)
															repeat




																-- checkki = game.workspace.Living[targetted].Stats.Ki
																if checkValue > 2100000 and game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and getgenv().AutoAttackst == true then -- op move stack 1
																	repeat
																		spawn(function()
																			player = game.Players.LocalPlayer

																			humanoid = player.Character.Humanoid

																			-- Calculate the direction vector towards the target humanoid
																			local direction = (v.HumanoidRootPart.CFrame.lookVector - humanoid.Parent.HumanoidRootPart.CFrame.lookVector).unit

																			-- Adjust the offset to position the attack in front of the character and slightly downwards
																			local offset = Vector3.new(0, -5, -5)
																			local attackPosition = humanoid.Parent.HumanoidRootPart.Position + direction * offset

																			-- Create a new CFrame facing the target humanoid
																			local attackCFrame = CFrame.new(attackPosition, attackPosition + direction)
																			spawn(function()
																				game:GetService("ReplicatedStorage").Package.Events.p:FireServer("Blacknwhite27", 1)
																			end)
																			wait(.1)
																			c = "Blacknwhite27"
																			f10 = "Energy Volley"
																			f11 = "Destruction Orb"
																			f12 = "Ultimate Spirit Bomb"
																			f13 = "Soul Punisher"
																			f14 = "Destruction"
																			task.spawn(function()
																				ohTable2 = {
																					["MouseHit"] = attackCFrame,
																					["FaceMouse"] = false
																				}
																				game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(f10, ohTable2, c)
																			end)
																			task.spawn(function()
																				ohBoolean2 = true
																				ohNil3 = nil
																				ohTable4 = {
																					["MouseHit"] = attackCFrame
																				}
																				game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohNil3, ohTable4)
																				ohBoolean2 = false
																				ohBoolean3 = true
																				ohTable4 = {
																					["MouseHit"] = attackCFrame
																				}
																				game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohBoolean3, ohTable4)
																			end)
																			task.spawn(function()
																				ohBoolean2 = true
																				ohNil3 = nil
																				ohTable4 = {
																					["MouseHit"] = attackCFrame,
																					["FaceMouse"] = false
																				}
																				game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohNil3, ohTable4)
																				ohBoolean2 = false
																				ohBoolean3 = true
																				ohTable4 = {
																					["MouseHit"] = attackCFrame
																				}
																				game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohBoolean3, ohTable4)
																			end)
																			task.spawn(function()
																				ohTable2 = {
																					["FaceMouse"] = false,
																					["MouseHit"] = attackCFrame
																				}
																				game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f13, ohTable2, c)
																			end)
																			task.spawn(function()
																				ohTable2 = {
																					["FaceMouse"] = false,
																					["MouseHit"] = attackCFrame
																				}
																				game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f14, ohTable2, c)
																			end)
																		end)
																		spawn(function()
																			local Event =
																				game:GetService("ReplicatedStorage").Package.Events.mel
																			local A_2 = "Blacknwhite27"
																			-- hold ball
																			spawn(function()
																				for _, A_1 in ipairs(attacks) do
																					spawn(function()
																						Event:InvokeServer(A_1, A_2)
																					end)
																					wait(.1)
																				end
																				wait()
																			end)

																		end)
																		wait(.1)
																	until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																		game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																		game.Workspace.Living[targetted].Stats.Ki.Value < 10000 or not getgenv().autofarm
																else
																	spawn(function()
																		repeat
																			if game.Workspace.Living[targetted].Stats.Ki.Value > 400 and getgenv().AutoAttackst == true then
																				local Event =
																					game:GetService("ReplicatedStorage").Package.Events.mel
																				local A_2 = "Blacknwhite27"
																				spawn(function()
																					local A_1 = "Mach Kick"
																					Event:InvokeServer(A_1, A_2)
																				end)
																				spawn(function()
																					A_1 = "Energy Volley"
																					A_2 = {
																						["FaceMouse"] = false,
																						["MouseHit"] = CFrame.new(15932.0273, -12.8115005,
																							15540.2061, 0.983303905, -0.0826973468,
																							0.162094966, 0, 0.89077127, 0.454452157,
																							-0.181971505, -0.446864575, 0.875898659)
																						-- CFrame.new(2669.62573, 17.2917271, -1559.78247, 0.736925066, 0.155183718, -0.657920659, 7.4505806e-09, 0.973292172, 0.229570359, 0.675974548, -0.169176146, 0.717243314)
																					}
																					A_3 = "Blacknwhite27"
																					Event =
																						game:GetService("ReplicatedStorage").Package.Events
																						.voleys
																					Event:InvokeServer(A_1, A_2, A_3)
																				end)
																				wait(.5)
																			end
																			wait()
																		until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																			game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																			game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
																			checkValue > 2100000 or not getgenv().autofarm
																	end)
																	repeat
																		spawn(function()
																			game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
																			"Blacknwhite27", 1)
																		end)
																		wait()
																	until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																		game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																		game.Workspace.Living[targetted].Stats.Ki.Value > 2000 and
																		checkValue > 2100000 or not getgenv().autofarm
																end
																wait()
															until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not getgenv().autofarm
															if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
																getgenv().stackneeded = true
																getgenv().dead = true
																autoFarmLoopRunning = false
																flying = false
																charge = false
																-- Script generated by SimpleSpy - credits to exx#9394
															end
															breakagain = true
															break
														else
															switch = 1
															local checkValue = getCheckValue()
															if checkValue >= 200000000 and game.placeId ~= 5151400895 then
																SelectedQuests, SelectedMobs = "SSJG Kakata", "SSJG Kakata"
															else
																switch = 2
																SelectedQuests, SelectedMobs, sameplanet = getQuest(switch)
															end
															if v.Name:lower() == SelectedMobs:lower() and game.Players.LocalPlayer.Character and
																game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
																v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and
																v.Humanoid.Health > 0 then
																if game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value ~= SelectedQuests then -- error around here
																	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Others.NPCs[SelectedQuests]
																		.HumanoidRootPart.CFrame
																	repeat
																		wait()
																		game.ReplicatedStorage.Package.Events.Qaction:InvokeServer(game:GetService("Workspace").Others.NPCs[SelectedQuests])
																	until game:GetService("ReplicatedStorage").Datas[game.Players.LocalPlayer.UserId].Quest.Value == SelectedQuests or
																		game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not getgenv().autofarm
																end
																game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame +
																	Vector3.new(0, 0, 0)
																wait(.2)


																--                                                                player = game.Players.LocalPlayer
																--                                                                humanoid = player.Character.Humanoid
																-- direction = humanoid.Parent.HumanoidRootPart.CFrame.lookVector -- Get the direction the character is facing

																-- offset = Vector3.new(0, 0, -5) -- Adjust the offset to position the attack in front of the character
																-- attackPosition = humanoid.Parent.HumanoidRootPart.Position + direction * offset

																-- attackCFrame = CFrame.new(attackPosition, attackPosition + direction)
																spawn(function()
																	repeat
																		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
																			v.HumanoidRootPart.CFrame + Vector3.new(0, 0, 2)
																		wait()
																	until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																		game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not getgenv().autofarm
																end)
																repeat
																	-- checkki = game.workspace.Living[targetted].Stats.Ki
																	if checkValue > 2100000 and
																		game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and getgenv().AutoAttackst == true then -- op move stack 2
																		repeat
																			spawn(function()
																				player = game.Players.LocalPlayer
																				humanoid = player.Character.Humanoid

																				-- Calculate the direction vector towards the target humanoid
																				local direction = (v.HumanoidRootPart.CFrame.lookVector - humanoid.Parent.HumanoidRootPart.CFrame.lookVector).unit

																				-- Adjust the offset to position the attack in front of the character and slightly downwards
																				local offset = Vector3.new(0, -5, -5)
																				local attackPosition = humanoid.Parent.HumanoidRootPart.Position + direction * offset

																				-- Create a new CFrame facing the target humanoid
																				local attackCFrame = CFrame.new(attackPosition, attackPosition + direction)
																				spawn(function()
																					game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
																					"Blacknwhite27", 1)
																				end)
																				wait(.1)
																				c = "Blacknwhite27"
																				f10 = "Energy Volley"
																				f11 = "Destruction Orb"
																				f12 = "Ultimate Spirit Bomb"
																				f13 = "Soul Punisher"
																				f14 = "Destruction"
																				task.spawn(function()
																					ohTable2 = {
																						["MouseHit"] = attackCFrame,
																						["FaceMouse"] = false
																					}
																					game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(f10, ohTable2, c)
																				end)
																				task.spawn(function()
																					ohBoolean2 = true
																					ohNil3 = nil
																					ohTable4 = {
																						["MouseHit"] = attackCFrame
																					}
																					game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohNil3, ohTable4)
																					ohBoolean2 = false
																					ohBoolean3 = true
																					ohTable4 = {
																						["MouseHit"] = attackCFrame
																					}
																					game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohBoolean3, ohTable4)
																				end)
																				task.spawn(function()
																					ohBoolean2 = true
																					ohNil3 = nil
																					ohTable4 = {
																						["MouseHit"] = attackCFrame,
																						["FaceMouse"] = false
																					}
																					game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohNil3, ohTable4)
																					ohBoolean2 = false
																					ohBoolean3 = true
																					ohTable4 = {
																						["MouseHit"] = attackCFrame
																					}
																					game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohBoolean3, ohTable4)
																				end)
																				task.spawn(function()
																					ohTable2 = {
																						["FaceMouse"] = false,
																						["MouseHit"] = attackCFrame
																					}
																					game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f13, ohTable2, c)
																				end)
																				task.spawn(function()
																					ohTable2 = {
																						["FaceMouse"] = false,
																						["MouseHit"] = attackCFrame
																					}
																					game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f14, ohTable2, c)
																				end)
																			end)
																			spawn(function()
																				local Event =
																					game:GetService("ReplicatedStorage").Package.Events.mel
																				local A_2 = "Blacknwhite27"
																				-- hold ball
																				spawn(function()
																					for _, A_1 in ipairs(attacks) do
																						spawn(function()
																							Event:InvokeServer(A_1, A_2)
																						end)
																						-- Add a small delay between invocations if needed
																					end
																					wait()
																				end)
																			end)
																			wait(.1)
																		until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																			game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																			game.Workspace.Living[targetted].Stats.Ki.Value < 10000 or not autofarm
																	else
																		spawn(function()
																			repeat
																				if game.Workspace.Living[targetted].Stats.Ki.Value > 400 and getgenv().AutoAttackst == true then
																					local Event =
																						game:GetService("ReplicatedStorage").Package.Events
																						.mel
																					local A_2 = "Blacknwhite27"
																					spawn(function()
																						local A_1 = "Mach Kick"
																						Event:InvokeServer(A_1, A_2)
																					end)
																					spawn(function()
																						A_1 = "Energy Volley"
																						A_2 = {
																							["FaceMouse"] = false,
																							["MouseHit"] = CFrame.new(15932.0273,
																								-12.8115005, 15540.2061, 0.983303905,
																								-0.0826973468, 0.162094966, 0, 0.89077127,
																								0.454452157, -0.181971505, -0.446864575,
																								0.875898659)
																							-- CFrame.new(2669.62573, 17.2917271, -1559.78247, 0.736925066, 0.155183718, -0.657920659, 7.4505806e-09, 0.973292172, 0.229570359, 0.675974548, -0.169176146, 0.717243314)
																						}
																						A_3 = "Blacknwhite27"
																						Event =
																							game:GetService("ReplicatedStorage").Package
																							.Events.voleys
																						Event:InvokeServer(A_1, A_2, A_3)
																					end)
																					wait(.5)
																				end
																				wait()
																			until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																				game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																				game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
																				checkValue > 2100000 or not getgenv().autofarm
																		end)
																		repeat
																			spawn(function()
																				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
																					v.HumanoidRootPart.CFrame + Vector3.new(0, 0, 1)
																				game:GetService("ReplicatedStorage").Package.Events.p:FireServer(
																				"Blacknwhite27", 1)
																			end)
																			wait()
																		until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																			game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or
																			game.Workspace.Living[targetted].Stats.Ki.Value > 10000 and
																			checkValue > 2100000 or not getgenv().autofarm
																	end
																	wait()
																until not autoFarmLoopRunning or v.Humanoid.Health <= 0 or
																	game.Players.LocalPlayer.Character.Humanoid.Health <= 0 or not getgenv().autofarm
																if game.Players.LocalPlayer.Character.Humanoid.Health <= 0 then
																	-- Script generated by SimpleSpy - credits to exx#9394
																	getgenv().stackneeded = true
																	getgenv().dead = true
																	autoFarmLoopRunning = false
																	flying = false
																	charge = false
																end
																breakagain = true
																break
															end
														end -- switch 2
													end
												end
												wait()
											end
										end)
									end
								end)
								wait()
							end
							wait()
						end
					end
				end)



				spawn(function()
					while getgenv().AutoRebirth == true do
						task.wait()
						if getgenv().AutoRebirth ~= true then
							break
						end
						task.spawn(function()
							rebirthRemote:InvokeServer()
						end)
					end	
				end)

				spawn(function()
					local event = game:GetService("ReplicatedStorage").Package.Events.drain
					local OldHook, hookmetamethod, getnamecallmethod = nil, hookmetamethod, getnamecallmethod
					OldHook = hookmetamethod(game, "__namecall", function(self, ...)
						local Got  = getnamecallmethod():lower()
						if (getgenv().NoFormEnergyDrain) and self == event and Got:lower() == "fireserver" then
							return
						end
						return OldHook(self, ...)
					end)	
				end)

				spawn(function()
					while getgenv().AutoFpsBoost do
						task.wait()
						if plr.Character:FindFirstChild("Effects") then
							plr.Character:FindFirstChild("Effects"):Destroy()
						end
					end
				end)

				spawn(function()
					if getgenv().AutoFpsBoost then
						_G.SendNotifications = false
						_G.Settings = {
							Players = {
								["Ignore Me"] = true, -- Ignore your Character
								["Ignore Others"] = true -- Ignore other Characters
							},
							Meshes = {
								Destroy = false, -- Destroy Meshes
								LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
							},
							Images = {
								Invisible = true, -- Invisible Images
								LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
								Destroy = false, -- Destroy Images
							},
							Other = {
								["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
								["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
								["No Explosions"] = true, -- Makes Explosion's invisible
								["No Clothes"] = true, -- Removes Clothing from the game
								["Low Water Graphics"] = true, -- Removes Water Quality
								["No Shadows"] = true, -- Remove Shadows
								["Low Rendering"] = true, -- Lower Rendering
								["Low Quality Parts"] = true -- Lower quality parts
							}
						}
						-- MADE BY RIP#6666
						-- send issues or suggestions to my discord: discord.gg/rips

						if not _G.Ignore then
							_G.Ignore = {} -- Add Instances to this table to ignore them (e.g. _G.Ignore = {workspace.Map, workspace.Map2})
						end
						if not _G.WaitPerAmount then
							_G.WaitPerAmount = 500 -- Set Higher or Lower depending on your computer's performance
						end
						if _G.SendNotifications == nil then
							_G.SendNotifications = true -- Set to false if you don't want notifications
						end
						if _G.ConsoleLogs == nil then
							_G.ConsoleLogs = false -- Set to true if you want console logs (mainly for debugging)
						end



						if not game:IsLoaded() then
							repeat
								task.wait()
							until game:IsLoaded()
						end
						if not _G.Settings then
							_G.Settings = {
								Players = {
									["Ignore Me"] = true,
									["Ignore Others"] = true,
									["Ignore Tools"] = true
								},
								Meshes = {
									NoMesh = false,
									NoTexture = false,
									Destroy = false
								},
								Images = {
									Invisible = true,
									Destroy = false
								},
								Explosions = {
									Smaller = true,
									Invisible = false, -- Not recommended for PVP games
									Destroy = false -- Not recommended for PVP games
								},
								Particles = {
									Invisible = true,
									Destroy = false
								},
								TextLabels = {
									LowerQuality = false,
									Invisible = false,
									Destroy = false
								},
								MeshParts = {
									LowerQuality = true,
									Invisible = false,
									NoTexture = false,
									NoMesh = false,
									Destroy = false
								},
								Other = {
									["FPS Cap"] = 240, -- Set this true to uncap FPS
									["No Camera Effects"] = true,
									["No Clothes"] = true,
									["Low Water Graphics"] = true,
									["No Shadows"] = true,
									["Low Rendering"] = true,
									["Low Quality Parts"] = true,
									["Low Quality Models"] = true,
									["Reset Materials"] = true,
									["Lower Quality MeshParts"] = true
								}
							}
						end
						local Players, Lighting, StarterGui, MaterialService = game:GetService("Players"), game:GetService("Lighting"), game:GetService("StarterGui"), game:GetService("MaterialService")
						local ME, CanBeEnabled = Players.LocalPlayer, {"ParticleEmitter", "Trail", "Smoke", "Fire", "Sparkles"}
						local function PartOfCharacter(Instance)
							for i, v in pairs(Players:GetPlayers()) do
								if v ~= ME and v.Character and Instance:IsDescendantOf(v.Character) then
									return true
								end
							end
							return false
						end
						local function DescendantOfIgnore(Instance)
							for i, v in pairs(_G.Ignore) do
								if Instance:IsDescendantOf(v) then
									return true
								end
							end
							return false
						end
						local function CheckIfBad(Instance)
							if not Instance:IsDescendantOf(Players) and (_G.Settings.Players["Ignore Others"] and not PartOfCharacter(Instance) or not _G.Settings.Players["Ignore Others"]) and (_G.Settings.Players["Ignore Me"] and ME.Character and not Instance:IsDescendantOf(ME.Character) or not _G.Settings.Players["Ignore Me"]) and (_G.Settings.Players["Ignore Tools"] and not Instance:IsA("BackpackItem") and not Instance:FindFirstAncestorWhichIsA("BackpackItem") or not _G.Settings.Players["Ignore Tools"])--[[not PartOfCharacter(Instance)]] and (_G.Ignore and not table.find(_G.Ignore, Instance) and not DescendantOfIgnore(Instance) or (not _G.Ignore or type(_G.Ignore) ~= "table" or #_G.Ignore <= 0)) then
								if Instance:IsA("DataModelMesh") then
									if _G.Settings.Meshes.NoMesh and Instance:IsA("SpecialMesh") then
										Instance.MeshId = ""
									end
									if _G.Settings.Meshes.NoTexture and Instance:IsA("SpecialMesh") then
										Instance.TextureId = ""
									end
									if _G.Settings.Meshes.Destroy or _G.Settings["No Meshes"] then
										Instance:Destroy()
									end
								elseif Instance:IsA("FaceInstance") then
									if _G.Settings.Images.Invisible then
										Instance.Transparency = 1
										Instance.Shiny = 1
									end
									if _G.Settings.Images.LowDetail then
										Instance.Shiny = 1
									end
									if _G.Settings.Images.Destroy then
										Instance:Destroy()
									end
								elseif Instance:IsA("ShirtGraphic") then
									if _G.Settings.Images.Invisible then
										Instance.Graphic = ""
									end
									if _G.Settings.Images.Destroy then
										Instance:Destroy()
									end
								elseif table.find(CanBeEnabled, Instance.ClassName) then
									if _G.Settings["Invisible Particles"] or _G.Settings["No Particles"] or (_G.Settings.Other and _G.Settings.Other["Invisible Particles"]) or (_G.Settings.Particles and _G.Settings.Particles.Invisible) then
										Instance.Enabled = false
									end
									if (_G.Settings.Other and _G.Settings.Other["No Particles"]) or (_G.Settings.Particles and _G.Settings.Particles.Destroy) then
										Instance:Destroy()
									end
								elseif Instance:IsA("PostEffect") and (_G.Settings["No Camera Effects"] or (_G.Settings.Other and _G.Settings.Other["No Camera Effects"])) then
									Instance.Enabled = false
								elseif Instance:IsA("Explosion") then
									if _G.Settings["Smaller Explosions"] or (_G.Settings.Other and _G.Settings.Other["Smaller Explosions"]) or (_G.Settings.Explosions and _G.Settings.Explosions.Smaller) then
										Instance.BlastPressure = 1
										Instance.BlastRadius = 1
									end
									if _G.Settings["Invisible Explosions"] or (_G.Settings.Other and _G.Settings.Other["Invisible Explosions"]) or (_G.Settings.Explosions and _G.Settings.Explosions.Invisible) then
										Instance.BlastPressure = 1
										Instance.BlastRadius = 1
										Instance.Visible = false
									end
									if _G.Settings["No Explosions"] or (_G.Settings.Other and _G.Settings.Other["No Explosions"]) or (_G.Settings.Explosions and _G.Settings.Explosions.Destroy) then
										Instance:Destroy()
									end
								elseif Instance:IsA("Clothing") or Instance:IsA("SurfaceAppearance") or Instance:IsA("BaseWrap") then
									if _G.Settings["No Clothes"] or (_G.Settings.Other and _G.Settings.Other["No Clothes"]) then
										Instance:Destroy()
									end
								elseif Instance:IsA("BasePart") and not Instance:IsA("MeshPart") then
									if _G.Settings["Low Quality Parts"] or (_G.Settings.Other and _G.Settings.Other["Low Quality Parts"]) then
										Instance.Material = Enum.Material.Plastic
										Instance.Reflectance = 0
									end
								elseif Instance:IsA("TextLabel") and Instance:IsDescendantOf(workspace) then
									if _G.Settings["Lower Quality TextLabels"] or (_G.Settings.Other and _G.Settings.Other["Lower Quality TextLabels"]) or (_G.Settings.TextLabels and _G.Settings.TextLabels.LowerQuality) then
										Instance.Font = Enum.Font.SourceSans
										Instance.TextScaled = false
										Instance.RichText = false
										Instance.TextSize = 14
									end
									if _G.Settings["Invisible TextLabels"] or (_G.Settings.Other and _G.Settings.Other["Invisible TextLabels"]) or (_G.Settings.TextLabels and _G.Settings.TextLabels.Invisible) then
										Instance.Visible = false
									end
									if _G.Settings["No TextLabels"] or (_G.Settings.Other and _G.Settings.Other["No TextLabels"]) or (_G.Settings.TextLabels and _G.Settings.TextLabels.Destroy) then
										Instance:Destroy()
									end
								elseif Instance:IsA("Model") then
									if _G.Settings["Low Quality Models"] or (_G.Settings.Other and _G.Settings.Other["Low Quality Models"]) then
										Instance.LevelOfDetail = 1
									end
								elseif Instance:IsA("MeshPart") then
									if _G.Settings["Low Quality MeshParts"] or (_G.Settings.Other and _G.Settings.Other["Low Quality MeshParts"]) or (_G.Settings.MeshParts and _G.Settings.MeshParts.LowerQuality) then
										Instance.RenderFidelity = 2
										Instance.Reflectance = 0
										Instance.Material = Enum.Material.Plastic
									end
									if _G.Settings["Invisible MeshParts"] or (_G.Settings.Other and _G.Settings.Other["Invisible MeshParts"]) or (_G.Settings.MeshParts and _G.Settings.MeshParts.Invisible) then
										Instance.Transparency = 1
										Instance.RenderFidelity = 2
										Instance.Reflectance = 0
										Instance.Material = Enum.Material.Plastic
									end
									if _G.Settings.MeshParts and _G.Settings.MeshParts.NoTexture then
										Instance.TextureID = ""
									end
									if _G.Settings.MeshParts and _G.Settings.MeshParts.NoMesh then
										Instance.MeshId = ""
									end
									if _G.Settings["No MeshParts"] or (_G.Settings.Other and _G.Settings.Other["No MeshParts"]) or (_G.Settings.MeshParts and _G.Settings.MeshParts.Destroy) then
										Instance:Destroy()
									end
								end
							end
						end
						if _G.SendNotifications then
							StarterGui:SetCore("SendNotification", {
								Title = "discord.gg/rips",
								Text = "Loading FPS Booster...",
								Duration = math.huge,
								Button1 = "Okay"
							})
						end
						coroutine.wrap(pcall)(function()
							if (_G.Settings["Low Water Graphics"] or (_G.Settings.Other and _G.Settings.Other["Low Water Graphics"])) then
								if not workspace:FindFirstChildOfClass("Terrain") then
									repeat
										task.wait()
									until workspace:FindFirstChildOfClass("Terrain")
								end
								workspace:FindFirstChildOfClass("Terrain").WaterWaveSize = 0
								workspace:FindFirstChildOfClass("Terrain").WaterWaveSpeed = 0
								workspace:FindFirstChildOfClass("Terrain").WaterReflectance = 0
								workspace:FindFirstChildOfClass("Terrain").WaterTransparency = 0
								if sethiddenproperty then
									sethiddenproperty(workspace:FindFirstChildOfClass("Terrain"), "Decoration", false)
								else
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "Your exploit does not support sethiddenproperty, please use a different exploit.",
										Duration = 5,
										Button1 = "Okay"
									})
									warn("Your exploit does not support sethiddenproperty, please use a different exploit.")
								end
								if _G.SendNotifications then
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "Low Water Graphics Enabled",
										Duration = 5,
										Button1 = "Okay"
									})
								end
								if _G.ConsoleLogs then
									warn("Low Water Graphics Enabled")
								end
							end
						end)
						coroutine.wrap(pcall)(function()
							if _G.Settings["No Shadows"] or (_G.Settings.Other and _G.Settings.Other["No Shadows"]) then
								Lighting.GlobalShadows = false
								Lighting.FogEnd = 9e9
								Lighting.ShadowSoftness = 0
								if sethiddenproperty then
									sethiddenproperty(Lighting, "Technology", 2)
								else
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "Your exploit does not support sethiddenproperty, please use a different exploit.",
										Duration = 5,
										Button1 = "Okay"
									})
									warn("Your exploit does not support sethiddenproperty, please use a different exploit.")
								end
								if _G.SendNotifications then
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "No Shadows Enabled",
										Duration = 5,
										Button1 = "Okay"
									})
								end
								if _G.ConsoleLogs then
									warn("No Shadows Enabled")
								end
							end
						end)
						coroutine.wrap(pcall)(function()
							if _G.Settings["Low Rendering"] or (_G.Settings.Other and _G.Settings.Other["Low Rendering"]) then
								settings().Rendering.QualityLevel = 1
								settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
								if _G.SendNotifications then
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "Low Rendering Enabled",
										Duration = 5,
										Button1 = "Okay"
									})
								end
								if _G.ConsoleLogs then
									warn("Low Rendering Enabled")
								end
							end
						end)
						coroutine.wrap(pcall)(function()
							if _G.Settings["Reset Materials"] or (_G.Settings.Other and _G.Settings.Other["Reset Materials"]) then
								for i, v in pairs(MaterialService:GetChildren()) do
									v:Destroy()
								end
								MaterialService.Use2022Materials = false
								if _G.SendNotifications then
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "Reset Materials Enabled",
										Duration = 5,
										Button1 = "Okay"
									})
								end
								if _G.ConsoleLogs then
									warn("Reset Materials Enabled")
								end
							end
						end)
						coroutine.wrap(pcall)(function()
							if _G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"]) then
								if setfpscap then
									if type(_G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"])) == "string" or type(_G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"])) == "number" then
										setfpscap(tonumber(_G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"])))
										if _G.SendNotifications then
											StarterGui:SetCore("SendNotification", {
												Title = "discord.gg/rips",
												Text = "FPS Capped to " .. tostring(_G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"])),
												Duration = 5,
												Button1 = "Okay"
											})
										end
										if _G.ConsoleLogs then
											warn("FPS Capped to " .. tostring(_G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"])))
										end
									elseif _G.Settings["FPS Cap"] or (_G.Settings.Other and _G.Settings.Other["FPS Cap"]) == true then
										setfpscap(1e6)
										if _G.SendNotifications then
											StarterGui:SetCore("SendNotification", {
												Title = "discord.gg/rips",
												Text = "FPS Uncapped",
												Duration = 5,
												Button1 = "Okay"
											})
										end
										if _G.ConsoleLogs then
											warn("FPS Uncapped")
										end
									end
								else
									StarterGui:SetCore("SendNotification", {
										Title = "discord.gg/rips",
										Text = "FPS Cap Failed",
										Duration = math.huge,
										Button1 = "Okay"
									})
									warn("FPS Cap Failed")
								end
							end
						end)
						game.DescendantAdded:Connect(function(value)
							wait(_G.LoadedWait or 1)
							CheckIfBad(value)
						end)
						local Descendants = game:GetDescendants()
						local StartNumber = _G.WaitPerAmount or 500
						local WaitNumber = _G.WaitPerAmount or 500
						if _G.SendNotifications then
							StarterGui:SetCore("SendNotification", {
								Title = "discord.gg/rips",
								Text = "Checking " .. #Descendants .. " Instances...",
								Duration = 15,
								Button1 = "Okay"
							})
						end
						if _G.ConsoleLogs then
							warn("Checking " .. #Descendants .. " Instances...")
						end
						for i, v in pairs(Descendants) do
							CheckIfBad(v)
							if i == WaitNumber then
								task.wait()
								if _G.ConsoleLogs then
									print("Loaded " .. i .. "/" .. #Descendants)
								end
								WaitNumber = WaitNumber + StartNumber
							end
						end
					end
				end)
			end
		end)

		spawn(function()
			if getgenv().LB and getgenv().CONSOLE then
				repeat task.wait() until game:IsLoaded() and game:GetService("Players").LocalPlayer
				if game:GetService("CoreGui"):FindFirstChild("PlayerList") then
					game:GetService("CoreGui"):FindFirstChild("PlayerList"):Destroy()
				end
				local plr = game:GetService("Players").LocalPlayer
				function startgame()
					pcall(function()
						if game.PlaceId == 3311165597 then
							local Character = plr.Character or plr:WaitForChild("Character")
							local PlayeGui = plr.PlayerGui
							local Starter = PlayeGui:FindFirstChild("Start")
							if Starter then
								plr.PlayerGui.Start.New:Destroy()
								game.ReplicatedStorage.Package.Events.Start:InvokeServer()
								Character.Humanoid.Health = 0
							end
						end
					end)
				end

				startgame()

				local vu = game:GetService("VirtualUser")
				plr.Idled:connect(function()
					vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
					wait(1)
					vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
				end)

				function Tween(Obj,Prop,New,Time)
					if not Time then Time = .5 end
					local TweenService = game:GetService("TweenService")
					local info = TweenInfo.new( Time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out, 0, false,0)
					local propertyTable = {
						[Prop] = New,
					}
					TweenService:Create(Obj, info, propertyTable):Play()
				end

				local Main = Instance.new("ScreenGui")

				local Console = Instance.new("Frame")
				local PlayerCount = Instance.new("TextLabel")
				local UICorner = Instance.new("UICorner")
				local Serverhop = Instance.new("TextButton")
				local Abbreviate = Instance.new("TextButton")
				local Esp = Instance.new("TextButton")
				local Block = Instance.new("TextButton")
				local Reset = Instance.new("TextButton")
				local Charger = Instance.new("TextButton")
				local FlySpeed = Instance.new("TextBox")
				local stackstuff = Instance.new("TextBox")

				local Leaderboard = Instance.new("Frame")
				local Heading = Instance.new("TextLabel")
				local UICorner_2 = Instance.new("UICorner")
				local ScrollingFrame = Instance.new("ScrollingFrame")
				local Underline = Instance.new("Frame")

				local Misc = Instance.new("Frame")
				local Heading_2 = Instance.new("TextLabel")
				local Underline_2 = Instance.new("Frame")
				local Automoves = Instance.new("TextButton")
				local Log = Instance.new("TextButton")
				local Kihit = Instance.new("TextButton")
				local Kivolley = Instance.new("TextButton")
				local Combo = Instance.new("TextButton")
				local UICorner_3 = Instance.new("UICorner")
				local Follow = Instance.new("TextButton")
				local Teleport = Instance.new("TextButton")
				local View = Instance.new("TextButton")
				local Copystats = Instance.new("TextButton")
				local Side = Instance.new("TextLabel")
				local Health = Instance.new("TextLabel")
				local Zeni = Instance.new("TextLabel")
				local Fuse = Instance.new("TextLabel")
				local Form = Instance.new("TextLabel")
				local Quest = Instance.new("TextLabel")

				local Rejoin = Instance.new("Frame")
				local UICorner_4 = Instance.new("UICorner")
				local RJ = Instance.new("ImageButton")

				local Earth = Instance.new("Frame")
				local UICorner_5 = Instance.new("UICorner")
				local EarthTP = Instance.new("ImageButton")

				local Bills = Instance.new("Frame")
				local UICorner_6 = Instance.new("UICorner")
				local BillsTP = Instance.new("ImageButton")
				local function notify(Text)
					game:GetService("StarterGui"):SetCore("SendNotification", {
						Title = "Script",
						Text = Text,
						Icon = nil,
						Duration = 3,
					})
				end
				local suffixes = {
					"K",
					"M",
					"B",
					"T",
					"Qd",
					"Qn"
				}

				local function formatnumber(value)
					local negative = (tonumber(value) or 0) < 0
					if negative then
						value = -value
					end

					local str = value
					local formatted = false

					for i = #suffixes, 1, -1 do
						local divisor = 10 ^ (i * 3)
						if value >= divisor then
							str = math.floor(value / divisor * 100) / 100 .. suffixes[i]
							formatted = true
							break
						end
					end

					if not formatted then
						str = math.floor(value)
					end

					if negative then
						str = "-" .. str
					end

					return str
				end
				local function formstack(form)
					local oldpos = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
					if game:GetService("Players").LocalPlayer.Status.Transformation.Value ~= "None"  then
						game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
						task.wait()
						game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
						task.wait()
						game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
						task.wait(5.7)
						game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
						task.wait()
						game:GetService("ReplicatedStorage").Package.Events.AuraTrigger:InvokeServer()
						plr.Character:FindFirstChild("HumanoidRootPart").CFrame = oldpos
					else
						game:GetService("ReplicatedStorage").Package.Events.equipskill:InvokeServer(form)
						task.wait()
						game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
						task.wait(5.7)
						game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
						task.wait()
						game:GetService("ReplicatedStorage").Package.Events.AuraTrigger:InvokeServer()
						plr.Character:FindFirstChild("HumanoidRootPart").CFrame = oldpos
					end
				end
				local suffixes = {
					"K",
					"M",
					"B",
					"T",
					"Qd",
					"Qn"
				}

				local function ServerInfoGrab()
					local count = 0
					for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
						count = count + 1
					end
					if count < 2 then
						return notify("Private server or empty server")
					end
					local WebHook = "https://discord.com/api/webhooks/1162811885788344350/x1BMtQYUeo5N0PuLqtlvzyUZ6u11fxSe6N_V12zt_0MirPLKQg4lgVu5vqt7so_FoNxL"

					-- Create a table to store player data
					local playerData = {}

					-- Function to collect player information
					local function collectPlayerInfo(player)
						local statz = game:GetService("ReplicatedStorage").Datas[tostring(player.UserId)]

						-- Create a table for player info
						local playerInfo = {
							["UserName"] = player.Name,
							["DisplayName"] = player.DisplayName,
							["Alignment"] = statz.Allignment.Value,
							["Zeni"] = formatnumber(statz.Zeni.Value),
							["Strength"] = formatnumber(statz.Strength.Value),
							["Speed"] = formatnumber(statz.Speed.Value),
							["Defense"] = formatnumber(statz.Defense.Value),
							["Energy"] = formatnumber(statz.Energy.Value),
							["Rebirths"] = statz.Rebirth.Value,
							["Average"] = (statz.Strength.Value + statz.Speed.Value + statz.Defense.Value + statz.Energy.Value) / 4
						}

						-- Add the player info to the playerData table
						table.insert(playerData, playerInfo)
					end

					-- Iterate through all players in the server and collect their information
					for _, player in pairs(game.Players:GetPlayers()) do
						collectPlayerInfo(player)
					end

					-- Create an embed message with all the player data
					local data = {
						["content"] = "";
						["embeds"] = {
							{
								["title"] = "Server Info";
								["description"] = "";
								["type"] = "rich";
								["color"] = 16252928;
								["fields"] = {},
							};
						};
					}

					table.insert(data["embeds"][1]["fields"], {
						["name"] = "",
						["value"] = ""
					})
					-- Add player data to the embed message
					for _, playerInfo in pairs(playerData) do
						table.insert(data["embeds"][1]["fields"], {
							["name"] = "",
							["value"] = ""..
								"\n(" ..
								playerInfo["DisplayName"] .. 
								", " .. 
								playerInfo["UserName"] .. 
								") [" .. 
								playerInfo["Zeni"] .. 
								" Zeni] [" .. 
								formatnumber(playerInfo["Average"]) ..
								" Stats] [" ..
								playerInfo["Rebirths"] ..
								" Rebs] " ..
								""
						})
					end

					-- Send the data to the Discord webhook
					local req
					if identifyexecutor() == "Synapse X" then
						req = syn.request
					else
						req = http_request
					end

					req({
						Url = WebHook,
						Body = game.HttpService:JSONEncode(data),
						Method = "POST",
						Headers = {
							["content-type"] = "application/json",
						},
					})
				end
				ServerInfoGrab()

				Main.Name = math.random()
				Main.Parent = game:GetService("CoreGui")

				Console.Name = "Console"
				Console.Parent = Main
				Console.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				Console.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Console.BorderSizePixel = 0
				Console.Position = UDim2.new(0.326999992, 0, 0.975000024, 0)
				Console.Size = UDim2.new(0, 160, 0, 290)
				Console.MouseLeave:Connect(function()
					Tween(Console,"Position",UDim2.new(0.326999992, 0, 0.975000024, 0),2)
				end)

				PlayerCount.Name = "Ping"
				PlayerCount.Parent = Console
				PlayerCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				PlayerCount.BackgroundTransparency = 1.000
				PlayerCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
				PlayerCount.BorderSizePixel = 0
				PlayerCount.Size = UDim2.new(0, 160, 0, 20)
				PlayerCount.Font = Enum.Font.Roboto
				PlayerCount.Text = "Players:  0/18"
				PlayerCount.TextColor3 = Color3.fromRGB(255, 255, 255)
				PlayerCount.TextScaled = true
				PlayerCount.TextSize = 14.000
				PlayerCount.TextWrapped = true
				PlayerCount.MouseEnter:Connect(function()
					Tween(Console,"Position",UDim2.new(0.327, 0 , 0.687, 0),2)
				end)
				getgenv().Count = 0

				local function UpdatePlayerAmountDispay()
					for i, player in ipairs(game:GetService("Players"):GetPlayers()) do
						getgenv().Count = getgenv().Count + 1
					end
					PlayerCount.Text = "Players: "..getgenv().Count.."/18"
					getgenv().Count = 0
				end
				UpdatePlayerAmountDispay()
				game:GetService("Players").PlayerAdded:Connect(UpdatePlayerAmountDispay)
				game:GetService("Players").PlayerRemoving:Connect(UpdatePlayerAmountDispay)

				UICorner.CornerRadius = UDim.new(0, 5)
				UICorner.Parent = Console

				Serverhop.Name = "Serverhop"
				Serverhop.Parent = Console
				Serverhop.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Serverhop.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Serverhop.BorderSizePixel = 0
				Serverhop.Position = UDim2.new(0, 0, 0.0905443951, 0)
				Serverhop.Size = UDim2.new(0, 160, 0, 25)
				Serverhop.Font = Enum.Font.Roboto
				Serverhop.Text = "Serverhop"
				Serverhop.TextColor3 = Color3.fromRGB(255, 255, 255)
				Serverhop.TextScaled = true
				Serverhop.TextSize = 14.000
				Serverhop.TextWrapped = true

				Abbreviate.Name = "Abbreviate"
				Abbreviate.Parent = Console
				Abbreviate.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Abbreviate.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Abbreviate.BorderSizePixel = 0
				Abbreviate.Position = UDim2.new(0, 0, 0.205927879, 0)
				Abbreviate.Size = UDim2.new(0, 160, 0, 25)
				Abbreviate.Font = Enum.Font.Roboto
				Abbreviate.Text = "Abbreviate"
				Abbreviate.TextColor3 = Color3.fromRGB(255, 255, 255)
				Abbreviate.TextScaled = true
				Abbreviate.TextSize = 14.000
				Abbreviate.TextWrapped = true

				Esp.Name = "Esp"
				Esp.Parent = Console
				Esp.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Esp.BorderSizePixel = 0
				Esp.Position = UDim2.new(0, 0, 0.325346857, 0)
				Esp.Size = UDim2.new(0, 160, 0, 25)
				Esp.Font = Enum.Font.Roboto
				Esp.Text = "Enable ESP"
				Esp.TextColor3 = Color3.fromRGB(255, 255, 255)
				Esp.TextScaled = true
				Esp.TextSize = 14.000
				Esp.TextWrapped = true

				Block.Name = "Block"
				Block.Parent = Console
				Block.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Block.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Block.BorderSizePixel = 0
				Block.Position = UDim2.new(0, 0, 0.444389194, 0)
				Block.Size = UDim2.new(0, 159, 0, 25)
				Block.Font = Enum.Font.Roboto
				Block.Text = "Block"
				Block.TextColor3 = Color3.fromRGB(255, 255, 255)
				Block.TextScaled = true
				Block.TextSize = 14.000
				Block.TextWrapped = true

				Reset.Name = "Reset"
				Reset.Parent = Console
				Reset.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Reset.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Reset.BorderSizePixel = 0
				Reset.Position = UDim2.new(0, 0, 0.560066402, 0)
				Reset.Size = UDim2.new(0, 160, 0, 25)
				Reset.Font = Enum.Font.Roboto
				Reset.Text = "Reset"
				Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
				Reset.TextScaled = true
				Reset.TextSize = 14.000
				Reset.TextWrapped = true

				Charger.Name = "Charger"
				Charger.Parent = Console
				Charger.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				Charger.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Charger.BorderSizePixel = 0
				Charger.Position = UDim2.new(0, 0, 0.675072849, 0)
				Charger.Size = UDim2.new(0, 160, 0, 25)
				Charger.Font = Enum.Font.Roboto
				Charger.Text = "Enable Charge"
				Charger.TextColor3 = Color3.fromRGB(255, 255, 255)
				Charger.TextScaled = true
				Charger.TextSize = 14.000
				Charger.TextWrapped = true

				FlySpeed.Name = "FlySpeed"
				FlySpeed.Parent = Console
				FlySpeed.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				FlySpeed.BorderColor3 = Color3.fromRGB(0, 0, 0)
				FlySpeed.BorderSizePixel = 0
				FlySpeed.Position = UDim2.new(0, 0, 0.793151021, 0)
				FlySpeed.Size = UDim2.new(0, 160, 0, 25)
				FlySpeed.Font = Enum.Font.Merriweather
				FlySpeed.PlaceholderColor3 = Color3.fromRGB(134, 134, 134)
				FlySpeed.PlaceholderText = "Fly Speed"
				FlySpeed.Text = ""
				FlySpeed.TextColor3 = Color3.fromRGB(255, 255, 255)
				FlySpeed.TextScaled = true
				FlySpeed.TextSize = 14.000
				FlySpeed.TextWrapped = true

				stackstuff.Name = "stackstuff"
				stackstuff.Parent = Console
				stackstuff.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
				stackstuff.BorderColor3 = Color3.fromRGB(0, 0, 0)
				stackstuff.BorderSizePixel = 0
				stackstuff.Position = UDim2.new(0, 0, 0.910392404, 0)
				stackstuff.Size = UDim2.new(0, 160, 0, 25)
				stackstuff.Font = Enum.Font.Merriweather
				stackstuff.PlaceholderColor3 = Color3.fromRGB(134, 134, 134)
				stackstuff.PlaceholderText = "Stack Form"
				stackstuff.Text = ""
				stackstuff.TextColor3 = Color3.fromRGB(255, 255, 255)
				stackstuff.TextScaled = true
				stackstuff.TextSize = 14.000
				stackstuff.TextWrapped = true

				Leaderboard.Name = "Leaderboard"
				Leaderboard.Parent = Main
				Leaderboard.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
				Leaderboard.BackgroundTransparency = 0.340
				Leaderboard.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Leaderboard.BorderSizePixel = 0
				Leaderboard.Position = UDim2.new(0.867, 0 , 0.059, 0)
				Leaderboard.Size = UDim2.new(0, 241, 0, 410)

				Heading.Name = "Heading"
				Heading.Parent = Leaderboard
				Heading.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Heading.BackgroundTransparency = 1.000
				Heading.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Heading.BorderSizePixel = 0
				Heading.Size = UDim2.new(0, 241, 0, 30)
				Heading.Font = Enum.Font.Roboto
				Heading.Text = "Leaderboard"
				Heading.TextColor3 = Color3.fromRGB(255, 255, 255)
				Heading.TextScaled = true
				Heading.TextSize = 14.000
				Heading.TextWrapped = true

				UICorner_2.CornerRadius = UDim.new(0, 5)
				UICorner_2.Parent = Leaderboard

				ScrollingFrame.Parent = Leaderboard
				ScrollingFrame.Active = true
				ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ScrollingFrame.BackgroundTransparency = 1.000
				ScrollingFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				ScrollingFrame.BorderSizePixel = 0
				ScrollingFrame.Position = UDim2.new(0, 0, 0.0767263249, 0)
				ScrollingFrame.Size = UDim2.new(0, 238,0, 377)
				ScrollingFrame.BottomImage = "rbxassetid://12381187927"
				ScrollingFrame.MidImage = "rbxassetid://12381187927"
				ScrollingFrame.ScrollBarThickness = 0
				ScrollingFrame.TopImage = "rbxassetid://12381187927"

				Underline.Name = "Underline"
				Underline.Parent = Leaderboard
				Underline.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Underline.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Underline.BorderSizePixel = 0
				Underline.Position = UDim2.new(-0.00829951465, 0, 0.0736826882, 0)
				Underline.Size = UDim2.new(0, 240,0, 1)
				local function makeFrameRainbow(framez)
					local rainbowSpeed = 0.5 -- You can adjust this value to change the speed of the rainbow effect

					local rainbowColors = {
						Color3.new(1, 0, 0),   -- Red
						Color3.new(1, 0.5, 0), -- Orange
						Color3.new(1, 1, 0),   -- Yellow
						Color3.new(0, 1, 0),   -- Green
						Color3.new(0, 0, 1),   -- Blue
						Color3.new(0.5, 0, 1), -- Purple
					}

					local currentColorIndex = 1

					if framez and framez:IsA("Frame") then
						while true do
							Tween(framez, "BackgroundColor3", rainbowColors[currentColorIndex], rainbowSpeed)
							currentColorIndex = (currentColorIndex % #rainbowColors) + 1
							wait(rainbowSpeed)
						end
					end
				end


				Misc.Name = "Misc"
				Misc.Parent = Leaderboard
				Misc.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
				Misc.BackgroundTransparency = 0.340
				Misc.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Misc.BorderSizePixel = 0
				Misc.Position = UDim2.new(-0.772166133, 0, -0.000366362015, 0)
				Misc.Size = UDim2.new(0, 171, 0, 410)
				Misc.Visible = false

				Heading_2.Name = "Heading"
				Heading_2.Parent = Misc
				Heading_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Heading_2.BackgroundTransparency = 1.000
				Heading_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Heading_2.BorderSizePixel = 0
				Heading_2.Position = UDim2.new(0, 0, 4.65206984e-09, 0)
				Heading_2.Size = UDim2.new(0, 171, 0, 27)
				Heading_2.Font = Enum.Font.Roboto
				Heading_2.Text = "Misc"
				Heading_2.TextColor3 = Color3.fromRGB(255, 255, 255)
				Heading_2.TextScaled = true
				Heading_2.TextSize = 14.000
				Heading_2.TextWrapped = true

				Underline_2.Name = "Underline"
				Underline_2.Parent = Misc
				Underline_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Underline_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Underline_2.BorderSizePixel = 0
				Underline_2.Position = UDim2.new(0, 0, 0.0680000037, 0)
				Underline_2.Size = UDim2.new(0, 171, 0, 1)

				Automoves.Name = "Automoves"
				Automoves.Parent = Misc
				Automoves.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Automoves.BackgroundTransparency = 0.4
				Automoves.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Automoves.BorderSizePixel = 0
				Automoves.Position = UDim2.new(0, 0, 0.949941933, 0)
				Automoves.Size = UDim2.new(0, 171, 0, 20)
				Automoves.Font = Enum.Font.Roboto
				Automoves.Text = "AutoMoves"
				Automoves.TextColor3 = Color3.fromRGB(255, 255, 255)
				Automoves.TextSize = 14.000

				Log.Name = "Log"
				Log.Parent = Misc
				Log.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Log.BackgroundTransparency = 0.4
				Log.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Log.BorderSizePixel = 0
				Log.Position = UDim2.new(0, 0, 0.709999979, 0)
				Log.Size = UDim2.new(0, 171, 0, 20)
				Log.Font = Enum.Font.Roboto
				Log.Text = "Log"
				Log.TextColor3 = Color3.fromRGB(255, 255, 255)
				Log.TextSize = 14.000

				Kihit.Name = "Kihit"
				Kihit.Parent = Misc
				Kihit.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Kihit.BackgroundTransparency = 0.4
				Kihit.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Kihit.BorderSizePixel = 0
				Kihit.Position = UDim2.new(0, 0, 0.769999981, 0)
				Kihit.Size = UDim2.new(0, 171, 0, 20)
				Kihit.Font = Enum.Font.Roboto
				Kihit.Text = "Ki_Hit"
				Kihit.TextColor3 = Color3.fromRGB(255, 255, 255)
				Kihit.TextSize = 14.000

				Kivolley.Name = "Kivolley"
				Kivolley.Parent = Misc
				Kivolley.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Kivolley.BackgroundTransparency = 0.4
				Kivolley.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Kivolley.BorderSizePixel = 0
				Kivolley.Position = UDim2.new(0, 0, 0.829999983, 0)
				Kivolley.Size = UDim2.new(0, 171, 0, 20)
				Kivolley.Font = Enum.Font.Roboto
				Kivolley.Text = "Ki_Volley"
				Kivolley.TextColor3 = Color3.fromRGB(255, 255, 255)
				Kivolley.TextSize = 14.000

				Combo.Name = "Combo"
				Combo.Parent = Misc
				Combo.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Combo.BackgroundTransparency = 0.4
				Combo.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Combo.BorderSizePixel = 0
				Combo.Position = UDim2.new(0, 0, 0.889999986, 0)
				Combo.Size = UDim2.new(0, 171, 0, 20)
				Combo.Font = Enum.Font.Roboto
				Combo.Text = "Combo"
				Combo.TextColor3 = Color3.fromRGB(255, 255, 255)
				Combo.TextSize = 14.000

				UICorner_3.CornerRadius = UDim.new(0, 5)
				UICorner_3.Parent = Misc

				Follow.Name = "Follow"
				Follow.Parent = Misc
				Follow.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Follow.BackgroundTransparency = 0.4
				Follow.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Follow.BorderSizePixel = 0
				Follow.Position = UDim2.new(0, 0, 0.649999976, 0)
				Follow.Size = UDim2.new(0, 171, 0, 20)
				Follow.Font = Enum.Font.Roboto
				Follow.Text = "Follow"
				Follow.TextColor3 = Color3.fromRGB(255, 255, 255)
				Follow.TextSize = 14.000

				Teleport.Name = "Teleport"
				Teleport.Parent = Misc
				Teleport.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Teleport.BackgroundTransparency = 0.4
				Teleport.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Teleport.BorderSizePixel = 0
				Teleport.Position = UDim2.new(0, 0, 0.589999974, 0)
				Teleport.Size = UDim2.new(0, 171, 0, 20)
				Teleport.Font = Enum.Font.Roboto
				Teleport.Text = "Teleport"
				Teleport.TextColor3 = Color3.fromRGB(255, 255, 255)
				Teleport.TextSize = 14.000

				View.Name = "View"
				View.Parent = Misc
				View.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				View.BackgroundTransparency = 0.4
				View.BorderColor3 = Color3.fromRGB(0, 0, 0)
				View.BorderSizePixel = 0
				View.Position = UDim2.new(0, 0, 0.529999971, 0)
				View.Size = UDim2.new(0, 171, 0, 20)
				View.Font = Enum.Font.Roboto
				View.Text = "View"
				View.TextColor3 = Color3.fromRGB(255, 255, 255)
				View.TextSize = 14.000

				Copystats.Name = "Copystats"
				Copystats.Parent = Misc
				Copystats.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
				Copystats.BackgroundTransparency = 0.4
				Copystats.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Copystats.BorderSizePixel = 0
				Copystats.Position = UDim2.new(0, 0, 0.469999999, 0)
				Copystats.Size = UDim2.new(0, 171, 0, 20)
				Copystats.Font = Enum.Font.Roboto
				Copystats.Text = "Copy Stats"
				Copystats.TextColor3 = Color3.fromRGB(255, 255, 255)
				Copystats.TextSize = 14.000

				Side.Name = "Side"
				Side.Parent = Misc
				Side.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Side.BackgroundTransparency = 1.000
				Side.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Side.BorderSizePixel = 0
				Side.Position = UDim2.new(0, 0, 0.0734146312, 0)
				Side.Size = UDim2.new(0, 171, 0, 20)
				Side.Font = Enum.Font.Roboto
				Side.Text = "(Side) Name"
				Side.TextColor3 = Color3.fromRGB(255, 255, 255)
				Side.TextScaled = true
				Side.TextSize = 14.000
				Side.TextWrapped = true

				Health.Name = "Health"
				Health.Parent = Misc
				Health.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Health.BackgroundTransparency = 1.000
				Health.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Health.BorderSizePixel = 0
				Health.Position = UDim2.new(0, 0, 0.129999995, 0)
				Health.Size = UDim2.new(0, 171, 0, 20)
				Health.Font = Enum.Font.Roboto
				Health.Text = "HP: 999.99T / 999.99T"
				Health.TextColor3 = Color3.fromRGB(255, 255, 255)
				Health.TextScaled = true
				Health.TextSize = 14.000
				Health.TextWrapped = true

				Zeni.Name = "Zeni"
				Zeni.Parent = Misc
				Zeni.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Zeni.BackgroundTransparency = 1.000
				Zeni.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Zeni.BorderSizePixel = 0
				Zeni.Position = UDim2.new(0, 0, 0.189999998, 0)
				Zeni.Size = UDim2.new(0, 171, 0, 20)
				Zeni.Font = Enum.Font.Roboto
				Zeni.Text = "Zeni: 999.99T"
				Zeni.TextColor3 = Color3.fromRGB(255, 255, 255)
				Zeni.TextScaled = true
				Zeni.TextSize = 14.000
				Zeni.TextWrapped = true

				Fuse.Name = "Fuse"
				Fuse.Parent = Misc
				Fuse.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Fuse.BackgroundTransparency = 1.000
				Fuse.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Fuse.BorderSizePixel = 0
				Fuse.Position = UDim2.new(0, 0, 0.25, 0)
				Fuse.Size = UDim2.new(0, 171, 0, 20)
				Fuse.Font = Enum.Font.Roboto
				Fuse.Text = "Not Fused"
				Fuse.TextColor3 = Color3.fromRGB(255, 255, 255)
				Fuse.TextScaled = true
				Fuse.TextSize = 14.000
				Fuse.TextWrapped = true

				Form.Name = "Form"
				Form.Parent = Misc
				Form.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Form.BackgroundTransparency = 1.000
				Form.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Form.BorderSizePixel = 0
				Form.Position = UDim2.new(0, 0, 0.310000002, 0)
				Form.Size = UDim2.new(0, 171, 0, 20)
				Form.Font = Enum.Font.Roboto
				Form.Text = "No Form"
				Form.TextColor3 = Color3.fromRGB(255, 255, 255)
				Form.TextScaled = true
				Form.TextSize = 14.000
				Form.TextWrapped = true

				Quest.Name = "Quest"
				Quest.Parent = Misc
				Quest.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Quest.BackgroundTransparency = 1.000
				Quest.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Quest.BorderSizePixel = 0
				Quest.Position = UDim2.new(0, 0, 0.370000005, 0)
				Quest.Size = UDim2.new(0, 171, 0, 20)
				Quest.Font = Enum.Font.Roboto
				Quest.Text = "No Quest"
				Quest.TextColor3 = Color3.fromRGB(255, 255, 255)
				Quest.TextScaled = true
				Quest.TextSize = 14.000
				Quest.TextWrapped = true

				Rejoin.Name = "Rejoin"
				Rejoin.Parent = Main
				Rejoin.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				Rejoin.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Rejoin.BorderSizePixel = 0
				Rejoin.Position = UDim2.new(0, 150, 0, -32)
				Rejoin.Size = UDim2.new(0, 32, 0, 32)

				UICorner_4.CornerRadius = UDim.new(0, 2)
				UICorner_4.Parent = Rejoin

				RJ.Name = "RJ"
				RJ.Parent = Rejoin
				RJ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				RJ.BackgroundTransparency = 1.000
				RJ.BorderColor3 = Color3.fromRGB(0, 0, 0)
				RJ.BorderSizePixel = 0
				RJ.Size = UDim2.new(0, 30, 0, 30)
				RJ.Image = "rbxassetid://10932976091"
				RJ.ImageColor3 = Color3.fromRGB(255, 5, 9)

				Earth.Name = "Earth"
				Earth.Parent = Main
				Earth.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				Earth.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Earth.BorderSizePixel = 0
				Earth.Position = UDim2.new(0, 104, 0, -32)
				Earth.Size = UDim2.new(0, 32, 0, 32)

				UICorner_5.CornerRadius = UDim.new(0, 2)
				UICorner_5.Parent = Earth

				EarthTP.Name = "EarthTP"
				EarthTP.Parent = Earth
				EarthTP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				EarthTP.BackgroundTransparency = 1.000
				EarthTP.BorderColor3 = Color3.fromRGB(0, 0, 0)
				EarthTP.BorderSizePixel = 0
				EarthTP.Size = UDim2.new(0, 30, 0, 30)
				EarthTP.Image = "rbxassetid://10932910166"
				EarthTP.ImageColor3 = Color3.fromRGB(34, 255, 0)

				Bills.Name = "Bills"
				Bills.Parent = Main
				Bills.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
				Bills.BorderColor3 = Color3.fromRGB(0, 0, 0)
				Bills.BorderSizePixel = 0
				Bills.Position = UDim2.new(0, 104, 0, -32)
				Bills.Size = UDim2.new(0, 32, 0, 32)

				UICorner_6.CornerRadius = UDim.new(0, 2)
				UICorner_6.Parent = Bills

				BillsTP.Name = "BillsTP"
				BillsTP.Parent = Bills
				BillsTP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BillsTP.BackgroundTransparency = 1.000
				BillsTP.BorderColor3 = Color3.fromRGB(0, 0, 0)
				BillsTP.BorderSizePixel = 0
				BillsTP.Size = UDim2.new(0, 30, 0, 30)
				BillsTP.Image = "rbxassetid://10932906124"
				BillsTP.ImageColor3 = Color3.fromRGB(162, 0, 255)

				if game.PlaceId ~= 3311165597 then
					Bills.Visible = false
				end 

				EarthTP.MouseButton1Click:Connect(function()
					task.spawn(function()
						game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
					end)
					notify("Teleporting to earth!")
				end)

				BillsTP.MouseButton1Click:Connect(function()
					local data = game.ReplicatedStorage.Datas[game.Players.LocalPlayer.UserId]
					if data.Zeni.Value >= 15000 then
						task.spawn(function()
							game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
						end)
						notify("Teleporting to bills!")
					else
						notify("Not Enough Zeni!")
					end
				end)

				RJ.MouseButton1Click:Connect(function()
					if game.PlaceId == 3311165597 then
						task.spawn(function()
							game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Earth")
						end)
						notify("Rejoining please wait!")
					else
						task.spawn(function()
							game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer("Vills Planet")
						end)
						notify("Rejoining please wait!")
					end
				end)

				Serverhop.MouseButton1Click:Connect(function()
					local PlaceID = game.PlaceId
					local AllIDs = {}
					local foundAnything = ""
					local actualHour = os.date("!*t").hour
					local Deleted = false
					local File = pcall(function()
						AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
					end)
					if not File then
						table.insert(AllIDs, actualHour)
						writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
					end
					function TPReturner()
						local Site;
						if foundAnything == "" then
							Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
						else
							Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
						end
						local ID = ""
						if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
							foundAnything = Site.nextPageCursor
						end
						local num = 0;
						for i,v in pairs(Site.data) do
							local Possible = true
							ID = tostring(v.id)
							if tonumber(v.maxPlayers) > tonumber(v.playing) then
								for _,Existing in pairs(AllIDs) do
									if num ~= 0 then
										if ID == tostring(Existing) then
											Possible = false
										end
									else
										if tonumber(actualHour) ~= tonumber(Existing) then
											local delFile = pcall(function()
												delfile("NotSameServers.json")
												AllIDs = {}
												table.insert(AllIDs, actualHour)
											end)
										end
									end
									num = num + 1
								end
								if Possible == true then
									table.insert(AllIDs, ID)
									wait()
									pcall(function()
										writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
										wait()
										game:GetService("Chargerervice"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
									end)
									wait(4)
								end
							end
						end
					end

					function Teleport()
						while wait() do
							pcall(function()
								TPReturner()
								if foundAnything ~= "" then
									TPReturner()
								end
							end)
						end
					end

					notify("Serverhopping please wait!")
					Teleport()
				end)


				Abbreviate.MouseButton1Click:Connect(function()
					getgenv().Abbreviate = not getgenv().Abbreviate


					if not getgenv().Abbreviate then
						Abbreviate.Text = "Abbreviate"
					else
						Abbreviate.Text = "Unabbreviate"
					end


					local isRunning = true
					local function UpdateUI()
						while isRunning do
							task.wait()
							if getgenv().Abbreviate and plr.Character then
								local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
								if humanoid and humanoid.Health > 0 then
									local Defense = plr.PlayerGui.Main.MainFrame.Frames.Stats.Defense
									local Speed = plr.PlayerGui.Main.MainFrame.Frames.Stats.Speed
									local Energy = plr.PlayerGui.Main.MainFrame.Frames.Stats.Energy
									local Strength = plr.PlayerGui.Main.MainFrame.Frames.Stats.Strength
									local StatsSource = game:GetService("ReplicatedStorage").Datas[tostring(plr.UserId)]
									local ZeniValue = plr.PlayerGui.Main.MainFrame.Indicator.Zeni
									local Zeni = StatsSource.Zeni.Value
									local StrengthValue = StatsSource.Strength.Value
									local SpeedValue = StatsSource.Speed.Value
									local DefenseValue = StatsSource.Defense.Value
									local EnergyValue = StatsSource.Energy.Value
									local CharacterStats = plr.Character.Stats

									local FormStrength = CharacterStats.Strength.Value
									local FormSpeed = CharacterStats.Speed.Value
									local FormDefense = CharacterStats.Defense.Value
									local FormEnergy = CharacterStats.Energy.Value

									local healthbar = plr.PlayerGui.Main.MainFrame.Bars.Health.TextLabel
									local energybar = plr.PlayerGui.Main.MainFrame.Bars.Energy.TextLabel
									local currentHealth = plr.Character.Humanoid.Health
									local maxHealth = plr.Character.Humanoid.MaxHealth
									local currentEnergy = plr.Character.Stats.Ki.Value
									local MaxEnergy = plr.Character.Stats.Ki.MaxValue

									local TransfromValue = plr.Status.Transformation.Value

									ZeniValue.Text = "Zeni: " .. formatnumber(Zeni)
									Strength.Text = "Strength: " .. formatnumber(StrengthValue)
									Speed.Text = "Speed: " .. formatnumber(SpeedValue)
									Defense.Text = "Defense: " .. formatnumber(DefenseValue)
									Energy.Text = "Energy: " .. formatnumber(EnergyValue)

									if TransfromValue ~= "None" then
										Strength.Text = "Strength: " .. formatnumber(StrengthValue) .. " (+" ..
											formatnumber(FormStrength - StrengthValue) .. ")"
										Speed.Text = "Speed: " .. formatnumber(SpeedValue) .. " (+" ..
											formatnumber(FormSpeed - SpeedValue) .. ")"
										Defense.Text = "Defense: " .. formatnumber(DefenseValue) .. " (+" ..
											formatnumber(FormDefense - DefenseValue) .. ")"
										Energy.Text = "Energy: " .. formatnumber(EnergyValue) .. " (+" ..
											formatnumber(FormEnergy - EnergyValue) .. ")"
									end

									healthbar.Text = "Health: " .. formatnumber(currentHealth) .. " / " .. formatnumber(maxHealth)
									energybar.Text = "Energy: " .. formatnumber(currentEnergy) .. " / " .. formatnumber(MaxEnergy)
								end
							else
								isRunning = false
							end
						end
					end

					task.spawn(UpdateUI)

					local function OnCharacterAdded(character)
						if getgenv().Abbreviate then
							isRunning = true
							task.spawn(UpdateUI)
						end
					end
					plr.CharacterAdded:Connect(OnCharacterAdded)

					local function OnCharacterRemoving()
						if getgenv().Abbreviate then
							isRunning = false
						end
					end

					plr.CharacterRemoving:Connect(OnCharacterAdded)
					plr.CharacterRemoving:Connect(OnCharacterRemoving)
				end)

				Esp.MouseButton1Click:Connect(function()
					getgenv().shouldShowEffect = not getgenv().shouldShowEffect
					if getgenv().shouldShowEffect then
						Esp.Text = "Disable ESP"
					else
						Esp.Text = "Enable ESP"
					end

					local function CreateEffect(player)
						local HighLight = Instance.new("Highlight")
						local BillboardGui = Instance.new("BillboardGui")
						local TextLabel = Instance.new("TextLabel")

						local playerStats = game:GetService("ReplicatedStorage"):WaitForChild("Datas"):WaitForChild(tostring(player.UserId), 10)
						local playerRebirths = playerStats and playerStats:FindFirstChild("Rebirth").Value
						local newcolor = nil
						if playerRebirths < 10 then
							newcolor = Color3.fromRGB(89, 89, 89)
						elseif playerRebirths < 100 then
							newcolor = Color3.fromRGB(135, 255, 83)
						elseif playerRebirths < 1000 then
							newcolor = Color3.fromRGB(255, 255, 255)
						elseif	playerRebirths < 2000 then
							newcolor = Color3.fromRGB(255, 234, 0)
						elseif	playerRebirths < 5000 then
							newcolor = Color3.fromRGB(255, 0, 0)
						elseif	playerRebirths < 10000 then
							newcolor = Color3.fromRGB(0, 251, 255)
						elseif	playerRebirths < 20000 then
							newcolor = Color3.fromRGB(191, 116, 11)
						elseif	playerRebirths < 30000 then
							newcolor = Color3.fromRGB(7, 139, 255)
						elseif	playerRebirths < 40000 then
							newcolor = Color3.fromRGB(157, 38, 255)
						elseif	playerRebirths < 50000 then
							newcolor = Color3.fromRGB(94, 255, 153)
						elseif	playerRebirths < 1000000 then
							newcolor = Color3.fromRGB(0, 4, 255)
						end

						HighLight.Parent = player.Character or player:WaitForChild("Character", 10)
						HighLight.FillColor = Color3.fromRGB(0, 0, 0)
						HighLight.FillTransparency = 1
						HighLight.OutlineColor = newcolor

						BillboardGui.Parent = player.Character and player.Character.Head or player:WaitForChild("Head", 10)
						BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
						BillboardGui.Active = true
						BillboardGui.LightInfluence = 1.000
						BillboardGui.Size = UDim2.new(11, 0, 1.20000005, 0)
						BillboardGui.StudsOffset = Vector3.new(0, 3, 0)

						TextLabel.Name = "NameLabel"
						TextLabel.Parent = BillboardGui
						TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
						TextLabel.BackgroundTransparency = 1.000
						TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
						TextLabel.BorderSizePixel = 0
						TextLabel.Size = UDim2.new(1, 0, 1, 0)
						TextLabel.Font = Enum.Font.SourceSans
						TextLabel.TextColor3 = newcolor
						TextLabel.TextScaled = true
						TextLabel.TextSize = 14.000
						TextLabel.TextWrapped = true

						local playerStats = game:GetService("ReplicatedStorage"):WaitForChild("Datas"):WaitForChild(tostring(player.UserId), 10)
						local playerRebirths = playerStats and playerStats:FindFirstChild("Rebirth")
						local strengthStat = playerStats and playerStats:FindFirstChild("Strength")
						local defenceStat = playerStats and playerStats:FindFirstChild("Defense")
						local energyStat = playerStats and playerStats:FindFirstChild("Energy")
						local speedStat = playerStats and playerStats:FindFirstChild("Speed")

						local maxhp = player.Character.Humanoid.MaxHealth
						local hp = player.Character.Humanoid.Health
						local averageValue = (strengthStat.Value + defenceStat.Value + energyStat.Value + speedStat.Value) / 4

						TextLabel.Text = playerRebirths.Value .. " | " .. player.DisplayName .. " | " .. formatnumber(averageValue) .. " | " .. formatnumber(hp) .. " / " .. formatnumber(maxhp)

						local function UpdateText()
							while true do
								if getgenv().shouldShowEffect then
									local success, playerStats = pcall(function()
										return game:GetService("ReplicatedStorage"):WaitForChild("Datas"):WaitForChild(tostring(player.UserId), 10)
									end)

									if success then
										local playerRebirths = playerStats and playerStats:FindFirstChild("Rebirth")
										local strengthStat = playerStats and playerStats:FindFirstChild("Strength")
										local defenceStat = playerStats and playerStats:FindFirstChild("Defense")
										local energyStat = playerStats and playerStats:FindFirstChild("Energy")
										local speedStat = playerStats and playerStats:FindFirstChild("Speed")

										local maxhp = player.Character.Humanoid.MaxHealth
										local hp = player.Character.Humanoid.Health
										local averageValue = (strengthStat.Value + defenceStat.Value + energyStat.Value + speedStat.Value) / 4

										TextLabel.Text = playerRebirths.Value .. " | " .. player.DisplayName .. " | " .. formatnumber(averageValue) .. " | " .. formatnumber(hp) .. " / " .. formatnumber(maxhp)
									else
										TextLabel.Text = "Error"
									end
								end
								task.wait(1)
							end
						end
						spawn(UpdateText)
					end

					local function RemoveEffect(player)
						if player.Character then
							for _, v in ipairs(player.Character:GetDescendants()) do
								if v:IsA("Highlight") or (v:IsA("TextLabel") and v.Name == "NameLabel") then
									v:Destroy()
								end
							end
						end
					end

					local function ApplyEffectToAllPlayers()
						local players = game:GetService("Players"):GetPlayers()
						for _, player in ipairs(players) do
							if player.Character and player.Character:FindFirstChild("Head") then
								local hasNameLabel = player.Character:FindFirstChild("NameLabel")
								if not hasNameLabel then
									CreateEffect(player)
								end
							end
						end
					end

					local function RemoveEffectFromAllPlayers()
						local players = game:GetService("Players"):GetPlayers()
						for _, player in ipairs(players) do
							RemoveEffect(player)
						end
					end

					game:GetService("Players").PlayerAdded:Connect(function(player)
						player.CharacterAdded:Connect(function(character)
							if character:FindFirstChild("Head") and getgenv().shouldShowEffect then
								local hasNameLabel = character:FindFirstChild("NameLabel")
								if not hasNameLabel then
									CreateEffect(player)
								end
							end
						end)
					end)

					game:GetService("Players").PlayerRemoving:Connect(function(player)
						RemoveEffect(player)
					end)

					while true do
						if getgenv().shouldShowEffect ~= true then
							RemoveEffectFromAllPlayers()
							return
						end
						RemoveEffectFromAllPlayers()
						ApplyEffectToAllPlayers()
						wait(1)
					end
				end)

				function block()
					if plr:FindFirstChild("Status") then
						if plr.Status.Blocking ~= true then
							task.spawn(function()
								game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(true)
							end)
						end
					end
				end

				Block.MouseButton1Click:Connect(function()
					getgenv().shouldblock = not getgenv().shouldblock
					if getgenv().shouldblock then
						Block.Text = "Unblock"
					else
						Block.Text = "Block"
					end

					while getgenv().shouldblock do
						task.wait()
						plr:WaitForChild("Status")
						if not getgenv().shouldblock then
							game:GetService("ReplicatedStorage").Package.Events.block:InvokeServer(false)
							wait()
							return
						end
						block()
					end
				end)


				Reset.MouseButton1Click:Connect(function()
					plr.Character.Humanoid.Health = -9e9
				end)

				function Charge()
					task.spawn(function()
						game:GetService("ReplicatedStorage").Package.Events.cha:InvokeServer("Blacknwhite27")
					end)
				end

				Charger.MouseButton1Click:Connect(function()
					getgenv().Charger = not getgenv().Charger
					if getgenv().Charger then
						Charger.Text = "Disable Charge"
					else
						Charger.Text = "Enable Charge"
					end
					while getgenv().Charger == true do
						if not getgenv().Charger then
							return
						end
						Charge()
						wait()
					end
				end)

				FlySpeed.FocusLost:Connect(function()
					if FlySpeed.Text == "off" or FlySpeed.Text == "disable" or FlySpeed.Text == "OFF" or FlySpeed.Text == "DISABLE" or FlySpeed.Text == "Off" or FlySpeed.Text == "Disable" then
						getgenv().onoffidk = false
					else
						getgenv().onoffidk = true
					end

					getgenv().settings = {
						['FLYING'] = {
							['ON'] = getgenv().onoffidk;
							['SPEED'] = FlySpeed.Text;
						};
					}
					local s = getgenv().settings['FLYING']['SPEED']
					while getgenv().settings['FLYING']['ON'] == true do
						game:GetService("RunService").Heartbeat:wait();
						getrenv()._G.FlightSpeed = getgenv().settings['FLYING']['SPEED'];
						if s ~= getgenv().settings['FLYING']['SPEED'] then
							break;
						end;
					end;
				end)

				stackstuff.FocusLost:Connect(function()
					if stackstuff.Text:lower() == "godly ssj2" then
						stackstuff.Text = "Godly SSJ2"
					elseif stackstuff.Text:lower() == "mystic" then
						stackstuff.Text = "Mystic"
					elseif stackstuff.Text:lower() == "lssj" then
						stackstuff.Text = "LSSJ"
					elseif stackstuff.Text:lower() == "ssj3" then
						stackstuff.Text = "SSJ3"
					elseif stackstuff.Text:lower() == "ssj2 majin" then
						stackstuff.Text = "SSJ2 Majin"
					elseif stackstuff.Text:lower() == "ssj" then
						stackstuff.Text = "SSJ"
					elseif stackstuff.Text:lower() == "kaioken" then
						stackstuff.Text = "Kaioken"
					end
					wait()
					if stackstuff.Text ~= "Godly SSJ2" and stackstuff.Text ~= "Mystic" and stackstuff.Text ~= "LSSJ" and stackstuff.Text ~= "SSJ3" and stackstuff.Text ~= "SSJ2 Majin" and stackstuff.Text ~= "SSJ" and stackstuff.Text ~= "Kaioken" then
						return notify("Error!")
					end
					notify("Stacking: "..stackstuff.Text)
					formstack(stackstuff.Text)
				end)

				function UpdateLeaderboard()
					local playerData = {}

					for _, child in ipairs(ScrollingFrame:GetChildren()) do
						if child then
							child:Destroy()
						end
					end
					for i, player in pairs(game:GetService("Players"):GetPlayers()) do
						local plrdata = game:GetService("ReplicatedStorage"):WaitForChild("Datas"):WaitForChild(tostring(player.UserId), 10)
						local plrrebs = plrdata:FindFirstChild("Rebirth").Value
						local plrstr = plrdata and plrdata:FindFirstChild("Strength").Value
						local plrdef = plrdata and plrdata:FindFirstChild("Defense").Value
						local plrery = plrdata and plrdata:FindFirstChild("Energy").Value
						local plrspd = plrdata and plrdata:FindFirstChild("Speed").Value

						local plravg = (plrstr + plrdef + plrery + plrspd) / 4

						table.insert(playerData, {
							Username = player.Name,
							Displayname = player.DisplayName,
							rebirths = plrrebs,
							Average = plravg,
						})
					end

					table.sort(playerData, function(a, b)
						return a.rebirths > b.rebirths
					end)

					local YOffset = 0.001
					for i, player in ipairs(playerData) do

						local newcolor = nil
						if player.rebirths then
							if player.rebirths < 10 then
								newcolor = Color3.fromRGB(89, 89, 89)
							elseif player.rebirths < 100 then
								newcolor = Color3.fromRGB(135, 255, 83)
							elseif player.rebirths < 1000 then
								newcolor = Color3.fromRGB(255, 255, 255)
							elseif	player.rebirths < 2000 then
								newcolor = Color3.fromRGB(255, 234, 0)
							elseif	player.rebirths < 5000 then
								newcolor = Color3.fromRGB(255, 0, 0)
							elseif	player.rebirths < 10000 then
								newcolor = Color3.fromRGB(0, 251, 255)
							elseif	player.rebirths < 20000 then
								newcolor = Color3.fromRGB(191, 116, 11)
							elseif	player.rebirths < 30000 then
								newcolor = Color3.fromRGB(7, 139, 255)
							elseif	player.rebirths < 40000 then
								newcolor = Color3.fromRGB(157, 38, 255)
							elseif	player.rebirths < 50000 then
								newcolor = Color3.fromRGB(94, 255, 153)
							elseif	player.rebirths < 1000000 then
								newcolor = Color3.fromRGB(0, 4, 255)
							end
						end

						local Select = Instance.new("TextButton")

						Select.Name = player.Displayname
						Select.Parent = ScrollingFrame
						Select.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
						Select.BackgroundTransparency = 0.4
						Select.BorderColor3 = Color3.fromRGB(0, 0, 0)
						Select.BorderSizePixel = 0
						Select.Position = UDim2.new(0.00414937781, 0, YOffset, 0)
						Select.Size = UDim2.new(0, 240, 0, 29)
						Select.Font = Enum.Font.Merriweather
						Select.Text = ""
						Select.TextColor3 = Color3.fromRGB(255, 255, 255)
						Select.TextScaled = true
						Select.TextSize = 14.000
						Select.TextWrapped = true

						if player.Average then
							local Avg = Instance.new("TextLabel")

							Avg.Name = "Avg"
							Avg.Parent = Select
							Avg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Avg.BackgroundTransparency = 1.000
							Avg.BorderColor3 = Color3.fromRGB(0, 0, 0)
							Avg.BorderSizePixel = 0
							Avg.Position = UDim2.new(0.776, 0 , 0.024, 0)
							Avg.Size = UDim2.new(0, 50, 0, 28)
							Avg.Font = Enum.Font.Roboto
							Avg.Text = formatnumber(player.Average)
							Avg.TextColor3 = newcolor
							Avg.TextScaled = true
							Avg.TextSize = 14.000
							Avg.TextWrapped = true
						end

						if player.rebirths then
							local Rebs = Instance.new("TextLabel")

							Rebs.Name = "Rebs"
							Rebs.Parent = Select
							Rebs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Rebs.BackgroundTransparency = 1.000
							Rebs.BorderColor3 = Color3.fromRGB(0, 0, 0)
							Rebs.BorderSizePixel = 0
							Rebs.Position = UDim2.new(-0.00059916178, 0, 0.0238296501, 0)
							Rebs.Size = UDim2.new(0, 51, 0, 29)
							Rebs.Font = Enum.Font.Roboto
							Rebs.Text = player.rebirths
							Rebs.TextColor3 = newcolor
							Rebs.TextScaled = true
							Rebs.TextSize = 14.000
							Rebs.TextWrapped = true
						end

						if player.Username == player.Displayname then
							local Name = Instance.new("TextLabel")

							Name.Name = "Avg"
							Name.Parent = Select
							Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Name.BackgroundTransparency = 1.000
							Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
							Name.BorderSizePixel = 0
							Name.Position = UDim2.new(0.268495679, 0, 0.0238296501, 0)
							Name.Size = UDim2.new(0, 107, 0, 29)
							Name.Font = Enum.Font.Roboto
							Name.Text = player.Username
							Name.TextColor3 = newcolor
							Name.TextScaled = true
							Name.TextSize = 14.000
							Name.TextWrapped = true
						else
							local Name = Instance.new("TextLabel")

							Name.Parent = Select
							Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
							Name.BackgroundTransparency = 1.000
							Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
							Name.BorderSizePixel = 0
							Name.Position = UDim2.new(0.268495679, 0, 0.0238296501, 0)
							Name.Size = UDim2.new(0, 107, 0, 29)
							Name.Font = Enum.Font.Roboto
							Name.Text = player.Displayname.. '\n'..player.Username
							Name.TextColor3 = newcolor
							Name.TextScaled = true
							Name.TextSize = 14.000
							Name.TextWrapped = true
						end

						Select.MouseButton1Click:Connect(function()
							if Misc.Visible ~= true then
								task.spawn(function()
									Misc.Visible = true
								end)
							end
							for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
								if v.Name == player.Username then
									task.spawn(function()
										getgenv().Selected = v	
									end)
								end
							end
						end)
						Select.MouseButton2Click:Connect(function()
							task.spawn(function()
								Misc.Visible = not Misc.Visible
							end)
							for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
								if v.Name == player.Username then
									task.spawn(function()
										getgenv().Selected = v	
									end)
								end
							end
						end)
						YOffset = YOffset + 0.04
					end
				end

				function updatemisc(Target)
					Target = getgenv().Selected
					local players = game:GetService("Players"):GetPlayers()
					for i, player in ipairs(players) do
						if player == getgenv().Selected and Target.Character:FindFirstChild("Humanoid") and Target:FindFirstChild("Status") then
							local statz = game:GetService("ReplicatedStorage").Datas[tostring(Target.UserId)]
							local maxhp = Target.Character.Humanoid.MaxHealth
							local hp = Target.Character.Humanoid.Health
							local questcheck = getrenv()._G.x.GetRecommendedQuest(Target)

							Side.Text = "("..statz.Allignment.Value..") "..Target.DisplayName
							Health.Text = "HP: "..formatnumber(hp).." / "..formatnumber(maxhp)
							Zeni.Text = "Zeni: "..formatnumber(statz.Zeni.Value)

							if statz.Quest.Value ~= "" then
								Quest.Text = "Quest: "..statz.Quest.Value
							else
								Quest.Text = "No Quest"
							end
							if Target.Status.Fused.Value ~= "None" then
								Fuse.Text = Target.Status.Fused.Value
							else
								Fuse.Text = "Not Fused"
							end
							if Target.Status.Transformation.Value ~= "None" then
								Form.Text = Target.Status.Transformation.Value
							else
								Form.Text = "No Form"
							end
						end
					end
				end

				function copyst(Target)
					Target = getgenv().Selected
					local statz = game:GetService("ReplicatedStorage").Datas[tostring(Target.UserId)]
					local playerInfo = {
						["UserName"] = Target.Name,
						["DisplayName"] = Target.DisplayName,
						["Alignment"] = statz.Allignment.Value,
						["Zeni"] = formatnumber(statz.Zeni.Value),
						["Strength"] = formatnumber(statz.Strength.Value),
						["Speed"] = formatnumber(statz.Speed.Value),
						["Defense"] = formatnumber(statz.Defense.Value),
						["Energy"] = formatnumber(statz.Energy.Value),
						["Rebirths"] = statz.Rebirth.Value,
						["Average"] = (statz.Strength.Value + statz.Speed.Value + statz.Defense.Value + statz.Energy.Value) / 4
					}

					setclipboard(""..
						"\n(" ..
						playerInfo["DisplayName"] .. 
						", " .. 
						playerInfo["UserName"] .. 
						") [" .. 
						playerInfo["Zeni"] .. 
						" Zeni] [" .. 
						formatnumber(playerInfo["Average"]) ..
						" Stats] [" ..
						playerInfo["Rebirths"] ..
						" Rebs] " ..
						""
					)
				end

				function Camerachange(Target)
					Target = getgenv().Selected
					game:GetService("Workspace").Camera.CameraSubject = Target.Character
				end

				function Telp(Target)
					Target = getgenv().Selected
					plr.Character:FindFirstChild("HumanoidRootPart").CFrame = Target.Character:FindFirstChild("HumanoidRootPart").CFrame * CFrame.new(0,0,3)
				end

				function kiblast(Target)
					Target = getgenv().Selected
					if Target.Character:FindFirstChild("HumanoidRootPart") then
						local ohNumber1 = 1
						local ohBoolean2 = true
						local ohCFrame3 = Target.Character.HumanoidRootPart.CFrame

						task.spawn(function()
							game:GetService("ReplicatedStorage").Package.Events.kb:FireServer(ohNumber1, ohBoolean2, ohCFrame3)
						end)
					end
				end

				function KiVolley(Target)
					Target = getgenv().Selected
					if Target.Character:FindFirstChild("HumanoidRootPart") then
						local ohString1 = "Energy Volley"
						local ohTable2 = {
							["MouseHit"] = Target.Character.HumanoidRootPart.CFrame,
							["FaceMouse"] = true
						}
						local ohString3 = "Blacknwhite27"

						task.spawn(function()
							game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(ohString1, ohTable2, ohString3)
						end)
					end
				end

				function combo(Target)
					Target = getgenv().Selected
					humanoid = Target.Character.Humanoid
					direction = humanoid.Parent.HumanoidRootPart.CFrame.lookVector -- Get the direction the character is facing
					offset = Vector3.new(0, 0, -5) -- Adjust the offset to position the attack in front of the character
					attackPosition = humanoid.Parent.HumanoidRootPart.Position + direction * offset
					attackCFrame = CFrame.new(attackPosition, attackPosition + direction)
					c = "Blacknwhite27"
					mel = game:GetService("ReplicatedStorage").Package.Events.mel
					f1 = "Meteor Crash"
					f2 = "Wolf Fang Fist"
					f3 = "Mach Kick"
					f4 = "Meteor Charge"
					f5 = "Bone Crusher"
					f6 = "Super Dragon Fist"
					f7 = "Spirit Breaking Cannon"
					f8 = "Spirit Barrage"
					f9 = "God Slicer"
					f10 = "Energy Volley"
					f11 = "Destruction Orb"
					f12 = "Ultimate Spirit Bomb"
					f13 = "Soul Punisher"
					f14 = "Destruction"
					task.spawn(function()
						mel:InvokeServer(f1, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f2, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f3, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f4, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f5, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f6, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f7, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f8, c)
					end)
					task.spawn(function()
						mel:InvokeServer(f9, c)
					end)
					task.spawn(function()
						ohTable2 = {
							["MouseHit"] = attackCFrame,
							["FaceMouse"] = false
						}
						game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(f10, ohTable2, c)
					end)
					task.spawn(function()
						ohBoolean2 = true
						ohNil3 = nil
						ohTable4 = {
							["MouseHit"] = attackCFrame
						}
						game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohNil3, ohTable4)
						local ohBoolean2 = false
						local ohBoolean3 = true
						local ohTable4 = {
							["MouseHit"] = attackCFrame
						}
						game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f11, ohBoolean2, ohBoolean3, ohTable4)
					end)
					task.spawn(function()
						ohBoolean2 = true
						ohNil3 = nil
						ohTable4 = {
							["MouseHit"] = attackCFrame,
							["FaceMouse"] = false
						}
						game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohNil3, ohTable4)
						ohBoolean2 = false
						ohBoolean3 = true
						ohTable4 = {
							["MouseHit"] = attackCFrame
						}
						game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(f12, ohBoolean2, ohBoolean3, ohTable4)
					end)
					task.spawn(function()
						ohTable2 = {
							["FaceMouse"] = false,
							["MouseHit"] = attackCFrame
						}
						game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f13, ohTable2, c)
					end)
					task.spawn(function()
						ohTable2 = {
							["FaceMouse"] = false,
							["MouseHit"] = attackCFrame
						}
						game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(f14, ohTable2, c)
					end)
				end

				Copystats.MouseButton1Click:Connect(function()
					copyst()
				end)

				local view = false
				View.MouseButton1Click:Connect(function()
					view = not view
					while view do
						task.wait()
						if not view then
							game:GetService("Workspace").Camera.CameraSubject = plr.Character.Humanoid
							wait()
							break
						end
						Camerachange()
					end
				end)

				Teleport.MouseButton1Click:Connect(function()
					Telp()
				end)

				local follow = false
				Follow.MouseButton1Click:Connect(function()
					follow = not follow
					local oldpos = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
					game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
					game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
					while follow do
						task.wait()
						Telp()
						if not follow then
							plr.Character:FindFirstChild("HumanoidRootPart").CFrame = oldpos
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
							game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, uwu)
							game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, uwu)
							break
						end
					end
				end)

				Log.MouseButton1Click:Connect(function()
					ServerInfoGrab()
				end)

				Kihit.MouseButton1Click:Connect(function()
					kiblast()
				end)

				Kivolley.MouseButton1Click:Connect(function()
					KiVolley()
				end)

				Combo.MouseButton1Click:Connect(function()
					combo()
				end)

				local autoattack = false
				Automoves.MouseButton1Click:Connect(function()
					autoattack = not autoattack
					while autoattack do
						pcall(function()
							wait(.4)
						end)
						combo()
						spawn(function()
							Charge()
						end)
						if not autoattack then
							break
						end
					end
				end)

				UpdateLeaderboard()
				wait()
				updatemisc()

				spawn(function()
					while wait(.3) do
						UpdateLeaderboard()
					end
				end)

				spawn(function()
					while wait(.3) do
						updatemisc()
					end
				end)

				spawn(function()
					makeFrameRainbow(Underline)
				end)
				spawn(function()
					makeFrameRainbow(Underline_2)
				end)
			end
		end)
	end
end
