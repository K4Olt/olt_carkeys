# olt_carkeys

Vehicle Lock Script.
This script allows players to lock and unlock vehicles in GTA V using the ESX framework, ensuring that only vehicle owners or authorized users (such as police officers, if desired) can perform these actions. The script includes functionality for personal and police vehicles with server-side ownership verification using a callback function. The key features of the script include:

Locking/Unlocking Vehicles: Players can lock or unlock their vehicles by pressing a designated key (U by default) or using a command (/toggleLock).
Ownership Verification: The script checks vehicle ownership using the server-side database (owned_vehicles table) to ensure that only the rightful owners can lock/unlock their vehicles.
Key Fob Animation: When locking or unlocking a vehicle, a key fob animation is played for enhanced immersion.
Proximity Detection: The script automatically detects if the player is inside a vehicle or near one within 5 meters, and accordingly locks/unlocks the closest vehicle.
Client and Server Synchronization: The server handles ownership checks and returns a callback to the client, ensuring proper vehicle locking behavior.
Debugging: The script includes extensive debug print statements for easy troubleshooting and tracking of script behavior.
