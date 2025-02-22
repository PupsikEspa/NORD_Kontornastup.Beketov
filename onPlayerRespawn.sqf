systemChat "Respawning...";
player removeAllEventHandlers "HIT";
0 spawn {[] execVM "scripts\zeus\curator.sqf"};