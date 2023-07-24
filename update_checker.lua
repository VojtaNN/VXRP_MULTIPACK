local currentVersion = "1.0.0" -- Nastavte aktuální verzi skriptu
local githubRepo = "user/repo" -- Zde nahraďte "user/repo" za uživatelské jméno a název repozitáře na GitHubu
local checkInterval = 3600 -- Interval v sekundách pro kontrolu aktualizace (v tomto příkladu 1 hodina)

local function CheckForUpdate()
    local resourceName = GetCurrentResourceName()
    local url = "https://api.github.com/repos/" .. githubRepo .. "/releases/latest"

    PerformHttpRequest(url, function(statusCode, data, headers)
        if statusCode == 200 then
            local release = json.decode(data)
            local latestVersion = release.tag_name

            if latestVersion ~= currentVersion then
                print("*********************************************")
                print(resourceName .. " is outdated!")
                print("Current version: " .. currentVersion)
                print("Latest version: " .. latestVersion)
                print("Please update the script from GitHub.")
                print("*********************************************")
            else
                print(resourceName .. " is up to date.")
            end
        else
            print("Failed to check for updates. Status Code: " .. statusCode)
        end
    end, "GET", "", {["User-Agent"] = "request"})
end

CheckForUpdate()
setInterval(CheckForUpdate, checkInterval * 1000) -- Spustí kontrolu pravidelně po uplynutí zadaného intervalu
