-- Soubor: server.lua (umístěte v resources/[VXRP_MULTIPACK]/)

-- Funkce pro tisk zprávy do konzole s formátováním
function PrintColoredMessage(prefix, message, prefixColor, textColor)
    print("^" .. prefixColor .. "[" .. prefix .. "] ^" .. textColor .. message .. "^7")
end

-- Event, který se spustí po načtení všech resource na serveru
Citizen.CreateThread(function()
    Citizen.Wait(0) -- Počkáme až se načtou všechny resource
    TriggerEvent('onAllResourcesLoaded') -- Vyvoláme náš vlastní event
end)

-- Náš vlastní event, který zavolá tisk zprávy do konzole
AddEventHandler('onAllResourcesLoaded', function()
    PrintColoredMessage("VXRP_MULTIPACK", "Server byl úspěšně spuštěn.", "2", "5")
end)
