local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/soft972/librairie-SOFT-HUB/refs/heads/main/lib%20v11%20modulaire/v1.lua'))()

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
_i[2].BackgroundTransparency = 1
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

_i[3] = Instance.new("TextLabel")
_i[3].AnchorPoint = Vector2.new(0,0)
_i[3].BackgroundColor3 = Color3.fromRGB(255,255,255)
_i[3].BackgroundTransparency = 1
_i[3].BorderColor3 = Color3.fromRGB(0,0,0)
_i[3].BorderSizePixel = 0
_i[3].ClipsDescendants = false
_i[3].LayoutOrder = 0
_i[3].Position = UDim2.new(0.00235294,0,0.003861,0)
_i[3].Rotation = 0
_i[3].Selectable = false
_i[3].Size = UDim2.new(0.995294,0,0.992278,0)
_i[3].SizeConstraint = Enum.SizeConstraint.RelativeXY
_i[3].Visible = true
_i[3].ZIndex = 1
_i[3].Font = Enum.Font.SourceSansBold
_i[3].LineHeight = 1
_i[3].MaxVisibleGraphemes = -1
_i[3].RichText = true
_i[3].Text = [[0]]
_i[3].TextColor3 = Color3.fromRGB(255,255,255)
_i[3].TextScaled = true
_i[3].TextSize = 52
_i[3].TextStrokeColor3 = Color3.fromRGB(0,0,0)
_i[3].TextStrokeTransparency = 1
_i[3].TextTransparency = 1
_i[3].TextTruncate = Enum.TextTruncate.None
_i[3].TextWrapped = true
_i[3].TextXAlignment = Enum.TextXAlignment.Left
_i[3].TextYAlignment = Enum.TextYAlignment.Top
_i[3].Name = [[TextLabel]]
_i[3].Parent = _i[2]


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

local function MVEUZ_fake_script()
	local script = Instance.new('LocalScript')
	script.Name = [[LocalScript]]
	script.Parent = _i[3]

	
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
coroutine.wrap(MVEUZ_fake_script)()

local function YOKOC_fake_script()
	local script = Instance.new('LocalScript')
	script.Name = [[LocalScript]]
	script.Parent = _i[3]

	local TextLabel = script.Parent -- adapte le chemin si besoin
	
	local function filtrerTexte(texte)
		local resultat = ""
		for i = 1, #texte do
			local c = texte:sub(i, i)
			if c:match("%d") then
				resultat = resultat .. c
			end
		end
		return resultat
	end
	
	TextLabel:GetPropertyChangedSignal("Text"):Connect(function()
		local nouveauTexte = filtrerTexte(TextLabel.Text)
		if nouveauTexte ~= TextLabel.Text then
			TextLabel.Text = nouveauTexte
		end
		MDC = TextLabel.Text
		print(MDC)
	end)
    return MDC
end
coroutine.wrap(YOKOC_fake_script)()


_i[1].Parent = PlayerGui

local Window = soronice:CreateWindow({
    Name = "SOFT-HUB",
    BrandLogo   = "99988830313432",
    ShowDevice = true,
    ShowPing = true,
    ShowFPS = true,
    VersionTag = "V1",
    KeySystem = false,
    KeySettings = { Title = "ACCES PREMIUM", LinkText = "Copier", Key = "1234", GrabKeyFromSite = false, Link = "" }
})

local MainTab = Window:CreateTab("Main", 79047049601630) --
local FARMTab = Window:CreateTab("FARM", 74615953378946) --
local joueurTab = Window:CreateTab("Joueur", 74615953378946) --
local ServeurTab = Window:CreateTab("Serveur", 137633026925616) --

MainTab:CreateToggle({
    Name = "on ou off",
    CurrentValue = false,
    Callback = function(Value)
        AutoFarm = Value
        
        -- Exécute la boucle en arrière-plan tant que le toggle est activé
        task.spawn(function()
        while AutoFarm do
        task.wait(0.5)
local args = {
    MDC,
    "consume_power_up",
    Instance.new("Tool", nil)
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Get"):InvokeServer(unpack(args))
end
        end)
    end
})
