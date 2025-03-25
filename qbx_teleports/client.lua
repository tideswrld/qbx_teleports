local config = lib.loadJson('qbx_teleports.config')

if #config.teleports == 0 then return end

local zones = {}

AddEventHandler('onResourceStop', function (resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    for _, zone in ipairs(zones) do
        zone:remove()
    end
end)

local function teleportPlayer(destination)
    if not destination then return end
    local coordZ = destination.coords.z

    if not destination.ignoreGround then
        local isSafe, z = GetGroundZFor_3dCoord(
            destination.coords.x,
            destination.coords.y,
            destination.coords.z,
            false
        )

        if isSafe then coordZ = z end
    end

    if destination.allowVehicle and cache.vehicle then
        SetPedCoordsKeepVehicle(
            cache.ped,
            destination.coords.x,
            destination.coords.y,
            coordZ
        )

        SetVehicleOnGroundProperly(cache.vehicle)
    else
        SetEntityCoords(
            cache.ped,
            destination.coords.x,
            destination.coords.y,
            coordZ,
            true, false, false, false
        )
    end

    if type(destination.coords) == 'vector4' then
        SetEntityHeading(cache.ped, destination.coords.w)
    end
end

CreateThread(function ()
    for _, passage in ipairs(config.teleports) do
        for i = 1, #passage do
            local entrance = passage[i]
            local exit = passage[(i % 2) + 1]
            local coords = vec3(entrance.coords)
            
            exports.ox_target:addSphereZone({
                coords = coords,
                radius = entrance.radius or 2.0,
                options = {
                    {
                        name = 'teleport_' .. i,
                        label = entrance.label or 'Use Passage',
                        icon = entrance.icon or 'fas fa-door-open',
                        onSelect = function()
                            teleportPlayer({
                                coords = vec(exit.coords),
                                ignoreGround = exit.ignoreGround,
                                allowVehicle = entrance.allowVehicle
                            })
                        end
                    }
                }
            })
        end
    end
end)
