params ["_playerUnit", "_didJIP"];
diag_log "Exec curator.sqf...";
[_playerUnit] execVM "scripts\zeus\curator.sqf";
_playerUnit addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[_unit] execVM "scripts\zeus\curator.sqf";
}];
diag_log "Exec curator.sqf finished";