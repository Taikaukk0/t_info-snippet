ESX = nil

TriggerEvent('esx:getSharedObject', function(k) ESX = k end)

local Duunit = {
	'police',
	'ambulance',
	'mechanic',
	'cardealer',
	'taxi'
}

RegisterCommand("tiedoitus", function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    local showError = true
    for k,v in pairs(Duunit) do
        if xPlayer.job.name == v then
	    showError = false
            TriggerClientEvent('chatMessage', -1, xPlayer.job.label .. " tiedoittaa" , {255, 255, 255}, table.concat(args, " "))
        end
    end
    Wait(150)
    if showError then
        TriggerClientEvent('chat:addMessage', source, { args = {"^1ILMOITUS", "Et ole valtuutettu tähän komentoon!"} })
    end
end)
