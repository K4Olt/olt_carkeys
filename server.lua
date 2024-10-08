ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('olt_vehiclelock:checkOwnership', function(source, cb, plate)
    local xPlayer = ESX.GetPlayerFromId(source)

    exports.oxmysql:fetch('SELECT * FROM owned_vehicles WHERE owner = ? AND plate = ?', {
        xPlayer.identifier, plate
    }, function(result)
        if result and result[1] then

            cb(true)
        else

            if xPlayer.job.name == "police" then

                cb(true)
            else
                cb(false)
            end
        end
    end)
end)
