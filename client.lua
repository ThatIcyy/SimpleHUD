local playerLoaded = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    playerLoaded = true
end)


local updatestatus = function(status, value)
    SendNUIMessage({
        event = 'updatestatus',
        status = status,
        value = tonumber(value)
    })
end


RegisterNetEvent('hud:client:UpdateNeeds')
AddEventHandler('hud:client:UpdateNeeds', function(hunger, thirst)
    updatestatus('hunger', hunger)
    updatestatus('thirst', thirst)
end)

Citizen.CreateThread(function()
    while true do
        if playerLoaded then
            local ped = PlayerPedId()
            local health = GetEntityHealth(ped) - 100
            updatestatus('health', health)
        end
        Citizen.Wait(2000)
    end
end)