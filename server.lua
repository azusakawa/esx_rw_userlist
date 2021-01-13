ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		maxClientNum = GetConvarInt("sv_maxClients", 0)
		if not isProcess then
			isProcess = true
			playerList = {}
			local players = ESX.GetPlayers()
			for i=1, #players do 
				local xPlayer = ESX.GetPlayerFromId(players[i])
		
				local playersId = xPlayer.source

				table.insert(
					playerList,
					{
						id = xPlayer.source,
						nickname = xPlayer.getName(),
						job = xPlayer.job.name
					}
				)

			end
			TriggerClientEvent('vrp_rw_userlistC.updatePlayerList', -1, playerList, maxClientNum)
			isProcess = false
		end
	end
end)
