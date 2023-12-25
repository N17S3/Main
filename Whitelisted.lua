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
							endrangevalue = 2000000000000000000,
							alignment = "Evil",
							rebirthReq = 20
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
		
