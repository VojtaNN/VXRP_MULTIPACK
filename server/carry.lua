local carrying = {}
--carrying[source] = targetSource, source is carrying targetSource
local carried = {}
--carried[targetSource] = source, targetSource is being carried by source

RegisterServerEvent("CarryPeople:sync")
AddEventHandler("CarryPeople:sync", function(targetSrc)
	local source = source
	local sourcePed = GetPlayerPed(source)
   	local sourceCoords = GetEntityCoords(sourcePed)
	local targetPed = GetPlayerPed(targetSrc)
    local targetCoords = GetEntityCoords(targetPed)
	
	local sourceX = sourceCoords.x
	local sourceY = sourceCoords.y
	local targetX = targetCoords.x
	local targetY = targetCoords.y

	local nevimjedna = targetX - sourceX
	local nevimdva = targetY - sourceY
	local wtfidk = math.sqrt(nevimjedna * nevimjedna + nevimdva * nevimdva)

	if wtfidk > 15 then
		DiscordMsg(source, targetSrc, wtfidk)
	else
		if #(sourceCoords - targetCoords) <= 3.0 then 
			TriggerClientEvent("CarryPeople:syncTarget", targetSrc, source)
			carrying[source] = targetSrc
			carried[targetSrc] = source
		end
	end
end)

RegisterServerEvent("CarryPeople:stop")
AddEventHandler("CarryPeople:stop", function(targetSrc)
	local source = source
	local sourcePed = GetPlayerPed(source)
	local sourceCoords = GetEntityCoords(sourcePed)
	local targetPed = GetPlayerPed(targetSrc)
    local targetCoords = GetEntityCoords(targetPed)

	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", targetSrc)
		carrying[source] = nil
		carried[targetSrc] = nil
	elseif carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])			
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)

AddEventHandler('playerDropped', function(reason)
	local source = source
	
	if carrying[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carrying[source])
		carried[carrying[source]] = nil
		carrying[source] = nil
	end

	if carried[source] then
		TriggerClientEvent("CarryPeople:cl_stop", carried[source])
		carrying[carried[source]] = nil
		carried[source] = nil
	end
end)

function DiscordMsg(src, targetsrc, vzdalenost)
	local webhook = "https://discord.com/api/webhooks/927979713081794580/7ogdx-5MebK0Tual1isAcn9oj7k0rQJdAi33HambeaG670VWfZURI3Z7miWT0-zKoz3v"
	local connect = {
		  {
			  ["color"] = 7419530,
			  ["title"] = "CARRY NA VELKOU VZDÁLENOST",
			  ["description"] = GetPlayerName(src)  .. "\n [" .. json.encode(GetPlayerIdentifiers(src)) .. "] \n" .. "\nse snažil dát carry hráči\n" .. GetPlayerName(targetsrc) .. "\n [" .. json.encode(GetPlayerIdentifiers(targetsrc)) .. "] \n" .. "\nna vzdálenost " .. vzdalenost,
			  ["footer"] = {
				  ["text"] = os.date('%H:%M:%S - %d. %m. %Y', os.time())
			  }
		  }
	  }
	  PerformHttpRequest(
		  webhook,
		  function(err, text, headers)
		  end,
		  "POST",
		  json.encode(
			  {
				  username = "CARRY",
				  embeds = connect,
				  avatar_url = "https://fivem-dev.cz/uploads/monthly_2021_02/ALESPESGIF.gif.cc4f86c72d204a9382f8a75b5dddba02.gif"
			  }
		  ),
		  {["Content-Type"] = "application/json"}
	  )
end
