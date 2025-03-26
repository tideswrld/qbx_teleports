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

-- Function to check if the player has the required item using ox_inventory
local function playerHasItem(itemName)
    return exports.ox_inventory:Search('count', itemName) > 0  -- Using ox_inventory search to check if item is present
end

-- Function to notify the player when they don't have the required item
local function notifyPlayer(message)
    exports.qbx_core:Notify({
        text = message,           -- The main message
        notifyType = 'error',     -- The notification type (error in this case)
        duration = 5000,          -- The duration the notification will remain on screen
        notifyPosition = 'top-right', -- Position of the notification
        notifyIcon = 'fas fa-exclamation-circle', -- Icon for the notification
        notifyIconColor = 'red'  -- Color of the icon (red for error)
    })
end

CreateThread(function ()
    for _, passage in ipairs(config.teleports) do
        for i = 1, #passage do
            local entrance = passage[i]
            local exit = passage[(i % 2) + 1]
            local coords = vec3(entrance.coords)
            
            -- Only show the target if item is required and player has it, or if itemVisibility is set to true
            if entrance.itemRequired and not playerHasItem(entrance.itemRequired) and not entrance.itemVisibility then
                -- Don't add target if the player doesn't have the required item
                goto continue
            end
            
            exports.ox_target:addSphereZone({
                coords = coords,
                radius = entrance.radius or 2.0,
                options = {
                    {
                        name = 'teleport_' .. i,
                        label = entrance.label or 'Use Passage',
                        icon = entrance.icon or 'fas fa-door-open',
                        onSelect = function()
                            -- Notify the player with a general message if they don't have the required item
                            if entrance.itemRequired and not playerHasItem(entrance.itemRequired) then
                                notifyPlayer("You're missing something...")
                                return
                            end
                            
                            teleportPlayer({
                                coords = vec(exit.coords),
                                ignoreGround = exit.ignoreGround,
                                allowVehicle = entrance.allowVehicle
                            })
                        end
                    }
                }
            })

            ::continue::
        end
    end
end)
