# qbx_teleports

This modified version of qbx_teleports improves the original by integrating Ox_Target, replacing DrawText interactions with a more immersive and configurable targeting system. It also introduces an optional item requirement feature, allowing server owners to restrict teleport access based on player inventory, with configurable visibility settings for restricted teleports.

Showcase: 
https://youtu.be/wW9oGOKuZXk

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


//   ______   __     _____     ______     ______     __     __     ______     __         _____    
//  /\__  _\ /\ \   /\  __-.  /\  ___\   /\  ___\   /\ \  _ \ \   /\  == \   /\ \       /\  __-.  
//  \/_/\ \/ \ \ \  \ \ \/\ \ \ \  __\   \ \___  \  \ \ \/ ".\ \  \ \  __<   \ \ \____  \ \ \/\ \ 
//     \ \_\  \ \_\  \ \____-  \ \_____\  \/\_____\  \ \__/".~\_\  \ \_\ \_\  \ \_____\  \ \____- 
//      \/_/   \/_/   \/____/   \/_____/   \/_____/   \/_/   \/_/   \/_/ /_/   \/_____/   \/____/                                                                                                 
