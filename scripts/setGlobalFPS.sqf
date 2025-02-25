params ["_playerFPS"];

if (!isServer) exitWith{};

_playerUnit = _playerFPS select 0;
_avgPlayerFPS = _playerFPS select 1;
if (!isServer) exitWith{};
//if (hasInterface) then {hint format ["Average FPS %1: %2", name _playerUnit, (_avgPlayerFPS select 0)];};
diag_log format ["Average FPS %1: %2", name _playerUnit, (_avgPlayerFPS select 0)];

_clientMapFPS = missionNamespace getVariable ("_clientMapFPS");
_clientMapFPS set [(getPlayerUID _playerUnit), _avgPlayerFPS];
missionNamespace setVariable ["_clientMapFPS", _clientMapFPS, true];