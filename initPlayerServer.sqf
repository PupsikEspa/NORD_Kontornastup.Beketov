params ["_playerUnit", "_didJIP"];
diag_log "Exec curator.sqf...";
[_playerUnit] execVM "scripts\zeus\curator.sqf"; //ВСУ
diag_log "Exec curator.sqf finished";