# qbx_teleports modification by TW

Modified teleportation between doors with advanced customization.

This modified version of qbx_teleports improves the original by integrating Ox_Target, replacing DrawText interactions with a more immersive and configurable targeting system. It also introduces an optional item requirement feature, allowing server owners to restrict teleport access based on player inventory, with configurable visibility settings for restricted teleports.

Key Modifications:

  - Ox_Target Integration

  - Ox_Inventory item checks (configurable/toggleable)

  - Notify player when they do not have the required item

  - Removed 'E' keypress interactions and replaced them with target-based sphere zones for teleport activation.

  - Allows players to interact with teleport locations by looking at them rather than stepping into a zone and pressing a key.

  - Configurable Labels & Icons

  - Now reads label and icon from config.json, allowing per-teleport customization.

  - Each teleport point can display different text and icons (e.g., elevator, door, etc.).

  - Adjustable Interaction Radius

  - Added a radius parameter to config.json, allowing custom interaction distances for each teleport.

  - Defaults to 2.0 meters if not specified.

  - Enhanced Ground Check for Teleports

  - Ensures safe teleportation by checking for valid ground positions when ignoreGround is false.

  - Seamless Vehicle Compatibility

  - Allows teleporting inside a vehicle if allowVehicle is true, ensuring smoother transitions.

This version improves immersion, flexibility, and server-side customization, making it a great upgrade for QBX-based FiveM servers.

Fas icons: https://fontawesome.com/icons


            {
                "_name": "Elevator @ labs",             <!-- A label for organization purposes  -->
                "coords": [3540.74, 3675.59, 20.99, 167.5],
                "allowVehicle": false,
                "ignoreGround": true,
                "label": "Take Elevator Up",
                "icon": "fas fa-elevator",
                "radius": 1.0,
                "itemRequired": "elevator_key",         <!-- Item required to use the teleport -->
                "itemVisibility": true                  <!-- Set to false to hide the target when the item is not in inventory -->
            },
            {
                "coords": [3540.74, 3675.59, 28.11, 172.5],
                "allowVehicle": false,
                "label": "Take Elevator Down",
                "icon": "fas fa-elevator",
                "radius": 1.0,
                "itemRequired": "elevator_key",
                "itemVisibility":true                   <!-- true Set to true to always show the target  -->
            }



dependencies `ox_lib`, `qbx_core`, `ox_inventory`, `ox_target`

//   ______   __     _____     ______     ______     __     __     ______     __         _____    
//  /\__  _\ /\ \   /\  __-.  /\  ___\   /\  ___\   /\ \  _ \ \   /\  == \   /\ \       /\  __-.  
//  \/_/\ \/ \ \ \  \ \ \/\ \ \ \  __\   \ \___  \  \ \ \/ ".\ \  \ \  __<   \ \ \____  \ \ \/\ \ 
//     \ \_\  \ \_\  \ \____-  \ \_____\  \/\_____\  \ \__/".~\_\  \ \_\ \_\  \ \_____\  \ \____- 
//      \/_/   \/_/   \/____/   \/_____/   \/_____/   \/_/   \/_/   \/_/ /_/   \/_____/   \/____/                                                                                                 
