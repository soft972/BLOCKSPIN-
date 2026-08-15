local soronice = loadstring(game:HttpGet('https://raw.githubusercontent.com/soft972/librairie-SOFT-HUB/refs/heads/main/lib%20v11%20modulaire/v1.lua'))()

-- 1. Remplace cette URL par ton lien "Raw" de GitHub
local url = "https://raw.githubusercontent.com/soft972/00000000000000/refs/heads/main/1r11r11g1r/mfg.lua"

-- 2. Téléchargement du script
local success, result = pcall(function()
    return game:HttpGet(url)
end)

if success then
    -- 3. Transformation du texte en code exécutable
    local fonction_chargee, erreur = loadstring(result)
    
    if fonction_chargee then
        -- 4. Exécution du code et récupération de la variable
        -- On assigne ce qui sort de ton GitHub à "GetKey"
        local GetKey = fonction_chargee()
        
        print("La variable GetKey a été chargée avec succès !")
        
        -- =========================================================
        -- PLACE LA SUITE DE TON CODE ICI
        -- Ton script connaît maintenant "GetKey" et tu peux 
        -- l'utiliser partout en dessous de cette ligne.
        -- =========================================================
        
    else
        warn("Erreur de syntaxe dans le script GitHub :", erreur)
    end
else
    warn("Erreur de connexion à GitHub :", result)
end

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
