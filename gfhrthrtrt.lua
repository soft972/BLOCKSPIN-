-- Gui to Lua V5.1 (Shadow Edition)
-- GUI : ScreenGui

local Players   = game:GetService('Players')
local player    = Players.LocalPlayer
local PlayerGui = player:WaitForChild('PlayerGui')

local _old = PlayerGui:FindFirstChild([[ScreenGui]])
if _old then _old:Destroy() end

local _i = {}

-- Instances:

_i[1] = Instance.new("ScreenGui")
_i[1].DisplayOrder = 0
_i[1].Enabled = true
_i[1].IgnoreGuiInset = false
_i[1].ResetOnSpawn = true
_i[1].Name = [[ScreenGui]]

_i[2] = Instance.new("Frame")
_i[2].AnchorPoint = Vector2.new(0,0)
_i[2].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[2].BackgroundTransparency = 0
_i[2].BorderColor3 = Color3.fromRGB(0,0,0)
_i[2].BorderSizePixel = 0
_i[2].ClipsDescendants = false
_i[2].LayoutOrder = 0
_i[2].Position = UDim2.new(0.3657,0,0.338327,0)
_i[2].Rotation = 0
_i[2].Selectable = false
_i[2].Size = UDim2.new(0.26797,0,0.323346,0)
_i[2].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[2].Visible = true
_i[2].ZIndex = 1
_i[2].Name = [[Frame]]
_i[2].Parent = _i[1]

_i[3] = Instance.new("UIGradient")
_i[3].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(127,127,127)),ColorSequenceKeypoint.new(1,Color3.fromRGB(65,65,65))})
_i[3].Enabled = true
_i[3].Offset = Vector2.new(0,0)
_i[3].Rotation = -90
_i[3].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[3].Name = [[UIGradient]]
_i[3].Parent = _i[2]

_i[4] = Instance.new("UIStroke")
_i[4].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[4].Color = Color3.fromRGB(0,0,0)
_i[4].Enabled = true
_i[4].LineJoinMode = Enum.LineJoinMode.Round
_i[4].Thickness = 7.300000190734863
_i[4].Transparency = 0
_i[4].Name = [[UIStroke]]
_i[4].Parent = _i[2]

_i[5] = Instance.new("TextLabel")
_i[5].AnchorPoint = Vector2.new(0,0)
_i[5].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[5].BackgroundTransparency = 1
_i[5].BorderColor3 = Color3.fromRGB(0,0,0)
_i[5].BorderSizePixel = 0
_i[5].ClipsDescendants = false
_i[5].LayoutOrder = 0
_i[5].Position = UDim2.new(0.143529,0,0.200772,0)
_i[5].Rotation = 0
_i[5].Selectable = false
_i[5].Size = UDim2.new(0.712941,0,0.598456,0)
_i[5].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[5].Visible = true
_i[5].ZIndex = 1
_i[5].Font = Enum.Font.SourceSansBold
_i[5].LineHeight = 1
_i[5].MaxVisibleGraphemes = -1
_i[5].RichText = true
_i[5].Text = [[0]]
_i[5].TextColor3 = Color3.fromRGB(255,255,255)
_i[5].TextScaled = true
_i[5].TextSize = 14
_i[5].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[5].TextStrokeTransparency = 1
_i[5].TextTransparency = 0
_i[5].TextTruncate = Enum.TextTruncate.None
_i[5].TextWrapped = true
_i[5].TextXAlignment = Enum.TextXAlignment.Center
_i[5].TextYAlignment = Enum.TextYAlignment.Center
_i[5].Name = [[TextLabel]]
_i[5].Parent = _i[2]

_i[6] = Instance.new("UIStroke")
_i[6].ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
_i[6].Color = Color3.fromRGB(0,0,0)
_i[6].Enabled = true
_i[6].LineJoinMode = Enum.LineJoinMode.Round
_i[6].Thickness = 10
_i[6].Transparency = 0
_i[6].Name = [[UIStroke]]
_i[6].Parent = _i[5]

_i[7] = Instance.new("UIGradient")
_i[7].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.new(0.775747,Color3.fromRGB(152,0,0)),ColorSequenceKeypoint.new(1,Color3.fromRGB(152,0,0))})
_i[7].Enabled = true
_i[7].Offset = Vector2.new(0,0)
_i[7].Rotation = 90
_i[7].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,0,0)})
_i[7].Name = [[UIGradient]]
_i[7].Parent = _i[5]

_i[8] = Instance.new("TextButton")
_i[8].AnchorPoint = Vector2.new(0,0)
_i[8].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[8].BackgroundTransparency = 0
_i[8].BorderColor3 = Color3.fromRGB(0,0,0)
_i[8].BorderSizePixel = 0
_i[8].ClipsDescendants = false
_i[8].LayoutOrder = 0
_i[8].Position = UDim2.new(0,0,-0.208494,0)
_i[8].Rotation = 0
_i[8].Selectable = true
_i[8].Size = UDim2.new(1,0,0.142857,0)
_i[8].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[8].Visible = true
_i[8].ZIndex = 1
_i[8].AutoButtonColor = true
_i[8].Font = Enum.Font.SourceSans
_i[8].LineHeight = 1
_i[8].Modal = false
_i[8].RichText = false
_i[8].Selected = false
_i[8].Text = [[]]
_i[8].TextColor3 = Color3.fromRGB(0,0,0)
_i[8].TextScaled = false
_i[8].TextSize = 14
_i[8].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[8].TextStrokeTransparency = 1
_i[8].TextTransparency = 0
_i[8].TextWrapped = false
_i[8].TextXAlignment = Enum.TextXAlignment.Center
_i[8].TextYAlignment = Enum.TextYAlignment.Center
_i[8].Name = [[TextButton]]
_i[8].Parent = _i[2]

_i[9] = Instance.new("UICorner")
_i[9].CornerRadius = UDim.new(0,8)
_i[9].BottomLeftRadius = UDim.new(0,8)
_i[9].BottomRightRadius = UDim.new(0,8)
_i[9].TopLeftRadius = UDim.new(0,8)
_i[9].TopRightRadius = UDim.new(0,8)
_i[9].Name = [[UICorner]]
_i[9].Parent = _i[8]

_i[10] = Instance.new("UIStroke")
_i[10].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_i[10].Color = Color3.fromRGB(0,0,0)
_i[10].Enabled = true
_i[10].LineJoinMode = Enum.LineJoinMode.Round
_i[10].Thickness = 4.699999809265137
_i[10].Transparency = 0
_i[10].Name = [[UIStroke]]
_i[10].Parent = _i[8]

_i[11] = Instance.new("UIGradient")
_i[11].Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(147,147,147)),ColorSequenceKeypoint.new(0.488372,Color3.fromRGB(124,90,113)),ColorSequenceKeypoint.new(1,Color3.fromRGB(100,89,51))})
_i[11].Enabled = true
_i[11].Offset = Vector2.new(0,0)
_i[11].Rotation = 65
_i[11].Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(0.575092,0.70625,0),NumberSequenceKeypoint.new(1,0,0)})
_i[11].Name = [[UIGradient]]
_i[11].Parent = _i[8]


-- FAKE REQUIRE SYSTEM FOR MODULES
local _modules = {}
local old_require = require
local require = function(module)
	if _modules[module] then
		if type(_modules[module]) == 'function' then
			_modules[module] = _modules[module]()
		end
		return _modules[module]
	end
	return old_require(module)
end

-- Scripts:

local function TQJVI_fake_script()
	local script = Instance.new('LocalScript')
	script.Name = [[LocalScript]]
	script.Parent = _i[5]

	
	local CodeDisplay = script.Parent
	local function AddLogToList(self, action, args)
		local log = ""
		if action == "FireServer" then
			log = "FireServer: " .. self.Name
		elseif action == "InvokeServer" then
			log = "InvokeServer: " .. self.Name
		end
		if args then
			for _, arg in ipairs(args) do
				log = log .. " " .. tostring(arg)
			end
		end
		CodeDisplay.Text = log
	end
	
	if hookfunction and newcclosure then
		local oldFireServer
		oldFireServer = hookfunction(Instance.new("RemoteEvent").FireServer, newcclosure(function(self, ...)
			local args = {...}
			task.spawn(function() AddLogToList(self, "FireServer", args) end)
			return oldFireServer(self, ...)
		end))
	
		local oldInvokeServer
		oldInvokeServer = hookfunction(Instance.new("RemoteFunction").InvokeServer, newcclosure(function(self, ...)
			local args = {...}
			task.spawn(function() AddLogToList(self, "InvokeServer", args) end)
			return oldInvokeServer(self, ...)
		end))
	else
		warn("[CENIROSO ERROR] Exécuteur non compatible hookfunction.")
		CodeDisplay.Text = "<font color=\"#FF3333\">-- ERREUR COMPATIBILITÉ EXÉCUTEUR --</font>"
	end
end
coroutine.wrap(TQJVI_fake_script)()

local function CRIEE_fake_script()
	local script = Instance.new('LocalScript')
	script.Name = [[LocalScript]]
	script.Parent = _i[8]

	local button = script.Parent
	local frame = button.Parent -- La Frame parent qui va se déplacer
	
	local UserInputService = game:GetService("UserInputService")
	
	local dragging = false
	local dragInput = nil
	local dragStart = nil
	local startPos = nil
	
	-- Fonction pour mettre à jour la position de la Frame
	local function update(input)
		local delta = input.Position - dragStart
		-- On calcule la nouvelle position de la Frame
		frame.Position = UDim2.new(
			startPos.X.Scale, 
			startPos.X.Offset + delta.X, 
			startPos.Y.Scale, 
			startPos.Y.Offset + delta.Y
		)
	end
	
	-- Quand le joueur appuie sur le bouton (Souris ou Doigt)
	button.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = frame.Position
	
			-- On écoute le moment où le joueur relâche le bouton
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	-- Quand le joueur bouge la souris ou le doigt sur l'écran
	button.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	-- Mise à jour globale du mouvement
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(CRIEE_fake_script)()


_i[1].Parent = PlayerGui
