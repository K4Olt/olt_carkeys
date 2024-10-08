ESX = exports["es_extended"]:getSharedObject()
local isLocked = false
print('Made by OlTi')

function playKeyAnimation()
    local playerPed = PlayerPedId()
    RequestAnimDict("anim@mp_player_intmenu@key_fob@")
    while not HasAnimDictLoaded("anim@mp_player_intmenu@key_fob@") do
        Citizen.Wait(100)
    end
    TaskPlayAnim(playerPed, "anim@mp_player_intmenu@key_fob@", "fob_click", 8.0, -8.0, 1000, 49, 0, false, false, false)
end

function isPlayerPolice()
    local playerJob = ESX.GetPlayerData().job.name
    return playerJob == 'police'
end

-- Toggle vehicle lock/unlock
function toggleVehicleLock()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle == 0 then
        vehicle = GetClosestVehicle(playerCoords, 5.0, 0, 71) 
    end

    if DoesEntityExist(vehicle) then
        if isPlayerPolice() then 
            isLocked = not isLocked

            if isLocked then
                SetVehicleDoorsLocked(vehicle, 2)
                TriggerEvent('esx:showNotification', 'Vehicle locked')
            else
                SetVehicleDoorsLocked(vehicle, 1)
                TriggerEvent('esx:showNotification', 'Vehicle unlocked')
            end

            playKeyAnimation()
        else
            TriggerEvent('esx:showNotification', 'You do not have permission to lock this vehicle')
        end
    else
        TriggerEvent('esx:showNotification', 'No vehicle nearby')
    end
end

exports('toggleVehicleLock', toggleVehicleLock)

RegisterCommand("toggleLock", toggleVehicleLock, false)
RegisterKeyMapping("toggleLock", "Lock/Unlock Vehicle", "keyboard", "u")
