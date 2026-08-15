local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/soft972/librairie-SOFT-HUB/refs/heads/main/lib%20v11%20modulaire/v1.lua'))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Référence vers ton RemoteEvent unique "Send"
local targetRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Send")

if hookfunction and newcclosure then
	local oldFireServer
	oldFireServer = hookfunction(targetRemote.FireServer, newcclosure(function(self, ...)
		local args = {...}

		-- Vérifie si l'appel correspond bien au remote "Send"
		if self == targetRemote and #args > 0 then
			-- Recherche de la valeur numérique changeante (le prestige) dans les arguments
			for _, arg in ipairs(args) do
				if type(arg) == "number" then
					GetKey = tostring(arg)
					break
				end
	
				return GetKey
			end
		end		
		return oldFireServer(self, ...)
	end))
else
	warn("[CENIROSO ERROR] Exécuteur non compatible hookfunction.")
	print("<font color=\"#FF3333\">-- ERREUR COMPATIBILITÉ --</font>")
end

print(GetKey)

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

local MainTab:CreateToggle({
	Name = "on ou off",
	CurrentValue = false,
	Callback = function(Value)
		local AutoFarm = Value
        
		if AutoFarm == true then
        MKY = true
		else
        MKY = false
		end
		-- Exécute la boucle en arrière-plan tant que le toggle est activé
		task.spawn(function()
			while AutoFarm do
            task.wait(0.5)
				local args = {
					GetKey, --<- + 1
					"set_sprinting_1",
					 MKY --<-[true/false]
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Send"):FireServer(unpack(args))
				
			end
		end)
	end
})
