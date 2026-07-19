local WeaponModule = {}

-- ============================================================================
-- 🛠️ TA BASE DE DONNÉES CONFIGURABLE (Noms, Images, Rayons, Couleurs)
-- ============================================================================
-- C'est ici, entre les accolades, que tu ajoutes toutes les armes de ton jeu.
-- ATTENTION : Écris toujours la clé de l'arme (le texte entre [ ]) en MINUSCULES.

WeaponModule.Database = {

    -- 🔵 EXEMPLE 1 : CONFIGURATION COMPLÈTE D'UNE ARME A FEU
    ["p226"] = {
        NomAffichage = "SIG SAUER P226",                 -- Le nom propre qui va s'écrire sur l'ESP
        ImageID = "rbxassetid://4483345998",             -- L'ID de la texture/image si tu veux la forcer
        MeshIdCible = "rbxassetid://123456789",          -- L'ID du modèle 3D (Utile pour décrypter si l'arme est masquée)
        CouleurRarete = Color3.fromRGB(0, 170, 255)      -- Couleur du contour UIStroke (Bleu ici)
    },

    -- 🔵 EXEMPLE 2 : CONFIGURATION D'UNE ARME BLANCHE / CORPS À CORPS
    ["clè"] = {
        NomAffichage = "CLÉ À MOLETTE",
        ImageID = "rbxassetid://4483345998",
        MeshIdCible = "",                                -- Si tu n'as pas le MeshId, laisse vide ""
        CouleurRarete = Color3.fromRGB(0, 170, 255)
    },

    -- 🔵 EXEMPLE 3 : AUTRE EXEMPLE AVEC COULEUR DIFFÉRENTE
    ["g3"] = {
        NomAffichage = "FUSIL D'ASSAUT G3",
        ImageID = "rbxassetid://1376330269",
        MeshIdCible = "rbxassetid://987654321",
        CouleurRarete = Color3.fromRGB(0, 255, 0)        -- Contour Vert
    },

    -- ⚪ EXEMPLE 4 : LES POINGS PAR DÉFAUT
    ["fists"] = {
        NomAffichage = "POINGS",
        ImageID = "rbxassetid://4483345998",
        MeshIdCible = "",
        CouleurRarete = Color3.fromRGB(150, 150, 150)    -- Contour Gris
    }
    
    -- 📌 POUR AJOUTER UNE NOUVELLE ARME :
    -- Copie-colle un bloc comme ceux du dessus, change le nom dans ["ici"], 
    -- et modifie ses paramètres internes. N'oublie pas la virgule à la fin du bloc !
}

-- ============================================================================
-- ⚙️ MÉCANIQUES INTERNES (Ne rien modifier ici, le script s'occupe de tout)
-- ============================================================================

-- Fonction qui extrait automatiquement l'image si aucune n'est forcée dans la BDD
function WeaponModule.getToolTexture(tool)
    if not tool then return "rbxassetid://4483345998" end
    
    -- Vérification si l'arme existe dans notre BDD et possède une image forcée
    local nameLower = tool.Name:lower()
    if WeaponModule.Database[nameLower] and WeaponModule.Database[nameLower].ImageID ~= "" then
        return WeaponModule.Database[nameLower].ImageID
    end

    -- Sinon, fouille classique du Tool pour trouver une icône
    if typeof(tool.TextureId) == "string" and tool.TextureId ~= "" then return tool.TextureId end
    if tool:GetAttribute("ImageId") then return tool:GetAttribute("ImageId") end
    
    local handle = tool:FindFirstChild("Handle")
    if handle then
        if handle:IsA("MeshPart") and handle.TextureID ~= "" then return handle.TextureID end
        local decal = handle:FindFirstChildOfClass("Decal")
        if decal and decal.Texture ~= "" then return decal.Texture end
        local mesh = handle:FindFirstChildOfClass("SpecialMesh")
        if mesh and mesh.TextureId ~= "" then return mesh.TextureId end
    end
    return "rbxassetid://4483345998"
end

local toolCache = setmetatable({}, {__mode = "k"})

-- Système de décryptage intelligent : Nom -> ToolTip -> MeshId
function WeaponModule.matchToolName(tool, ReplicatedStorage, StarterPack)
    if not tool then return "Unknown", WeaponModule.getToolTexture(nil) end
    if toolCache[tool] then return toolCache[tool].name, toolCache[tool].texture end

    local nameLower = tool.Name:lower()
    
    -- 1. Vérification directe par le nom dans notre BDD
    if WeaponModule.Database[nameLower] then
        local data = WeaponModule.Database[nameLower]
        local tex = WeaponModule.getToolTexture(tool)
        toolCache[tool] = {name = data.NomAffichage, texture = tex}
        return data.NomAffichage, tex
    end

    -- 2. Vérification par le ToolTip (Si le nom est masqué par un nombre)
    local realName = tool.Name
    if tool:FindFirstChild("ToolTip") and tool.ToolTip.Value ~= "" then
        local tipLower = tool.ToolTip.Value:lower()
        if WeaponModule.Database[tipLower] then
            local data = WeaponModule.Database[tipLower]
            local tex = WeaponModule.getToolTexture(tool)
            toolCache[tool] = {name = data.NomAffichage, texture = tex}
            return data.NomAffichage, tex
        end
        realName = tool.ToolTip.Value
    end

    -- 3. Décryptage ultime par comparaison de modèle 3D (MeshId)
    local handle = tool:FindFirstChild("Handle")
    local uniqueMeshId = nil
    if handle then
        if handle:IsA("MeshPart") then uniqueMeshId = handle.MeshId
        else
            local mesh = handle:FindFirstChildOfClass("SpecialMesh")
            if mesh then uniqueMeshId = mesh.MeshId end
        end
    end

    if uniqueMeshId and uniqueMeshId ~= "" then
        -- Parcourt la BDD pour voir si ce MeshId appartient à une arme connue
        for key, data in pairs(WeaponModule.Database) do
            if data.MeshIdCible ~= "" and data.MeshIdCible == uniqueMeshId then
                local tex = data.ImageID ~= "" and data.ImageID or WeaponModule.getToolTexture(tool)
                toolCache[tool] = {name = data.NomAffichage, texture = tex}
                return data.NomAffichage, tex
            end
        end

        -- Si pas dans la BDD, cherche dans le jeu pour trouver une correspondance de dossier
        for _, source in ipairs({ReplicatedStorage:FindFirstChild("Items"), StarterPack}) do
            if source then
                for _, item in ipairs(source:GetDescendants()) do
                    if item:IsA("Tool") and item ~= tool then
                        local iHandle = item:FindFirstChild("Handle")
                        local iMeshId = iHandle and (iHandle:IsA("MeshPart") and iHandle.MeshId or (iHandle:FindFirstChildOfClass("SpecialMesh") and iHandle:FindFirstChildOfClass("SpecialMesh").MeshId))
                        
                        if iMeshId == uniqueMeshId then
                            local matchedName = item.Name
                            local matchedTex = WeaponModule.getToolTexture(item)
                            -- Formatage si trouvé dans la BDD après coup
                            if WeaponModule.Database[matchedName:lower()] then
                                matchedName = WeaponModule.Database[matchedName:lower()].NomAffichage
                            end
                            toolCache[tool] = {name = matchedName, texture = matchedTex}
                            return matchedName, matchedTex 
                        end
                    end
                end
            end
        end
    end
    
    -- Sécurité si l'arme est totalement inconnue
    local fallbackTex = WeaponModule.getToolTexture(tool)
    toolCache[tool] = {name = realName, texture = fallbackTex}
    return realName, fallbackTex
end

-- Extraction automatique de la couleur depuis la BDD
function WeaponModule.getToolRarityColor(toolName)
    -- Cherche si le nom (ou une partie du nom) correspond à notre BDD
    local nameLower = tostring(toolName):lower()
    
    for key, data in pairs(WeaponModule.Database) do
        if nameLower == key or string.find(nameLower, key) or nameLower == data.NomAffichage:lower() then
            return data.CouleurRarete
        end
    end
    
    return Color3.fromRGB(255, 255, 255) -- Blanc par défaut si l'arme n'est pas configurée
end

return WeaponModule
