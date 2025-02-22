params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];
systemChat "Respawning...";
player removeAllEventHandlers "HIT";
[_newUnit, "scripts\zeus\curator.sqf"] remoteExec ["execVM", 2];