-- Název resource, který chceme kontrolovat
local resourceToCheck = "vxrp_multipack"

-- Funkce pro kontrolu aktualizace resource podle GitHubu
function CheckResourceUpdates()
    local resourceName = resourceToCheck
    local fxManifestUrl = "https://raw.githubusercontent.com/VojtaNN/"..resourceName.."/main/fxmanifest.lua" -- Zde nahraď "TVOJ_GITHUB_REPOSITORY" názvem tvého GitHub účtu/repozitáře

    PerformHttpRequest(fxManifestUrl, function(statusCode, response, headers)
        if statusCode == 200 then -- Pokud byl soubor na GitHubu nalezen (úspěch)
            local fxManifest = LoadResourceFile(resourceName, "fxmanifest.lua") -- Načtení lokálního fxmanifest.lua

            if fxManifest ~= response then -- Porovnání lokálního souboru s verzí na GitHubu
                local currentVersion = GetResourceMetadata(resourceName, "version") or "N/A"
                local latestVersion = "N/A" -- Není dostupná verze z GitHubu přes API, použijeme "N/A" jako hodnotu

                print("^5[vxrp_multipack]^1 Resource "..resourceName.." is outdated!") -- Zelený prefix a světle modrý text pro neaktualní resource
                print("^5Current version: ^8 "..currentVersion)
                print("^5Latest version: ^2 "..latestVersion)
                print("^6Please update the script from GitHub.")
            else
                print("^5[vxrp_multipack]^19 Resource "..resourceName.." is up to date.") -- Zelený prefix a světle modrý text pro aktuální resource
            end
        else
            print("^5[vxrp_multipack]^1 Unable to verify the status of the resource "..resourceName..".") -- Zelený prefix a světle modrý text pro neúspěšnou kontrolu
        end
    end, "GET", "", {})
end

-- Spustí kontrolu aktualizace po načtení všech resource na serveru
AddEventHandler("onAllResourcesLoaded", function()
    CheckResourceUpdates()
end)
