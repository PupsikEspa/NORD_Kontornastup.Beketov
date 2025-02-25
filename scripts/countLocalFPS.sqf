if (isServer) exitWith{};

_clientMapFPS = missionNamespace getVariable ("_clientMapFPS");
_avgFPS = _clientMapFPS getOrDefault [(getPlayerUID player), []]; 

if ((count _avgFPS) < 2) then {
	_avgFPS = [diag_fps, 1];
	systemChat format["DIAG_FPS: %1", diag_fps];
    systemChat format["After local FPS: %1, count: %2", (_avgFPS select 0), (_avgFPS select 1)];
	[[player, _avgFPS]] remoteExec ["Nord_fnc_setGlobalFPS", 2];
};

localNamespace setVariable ["_avgFPS", _avgFPS];;

[{
	_avgFPS = localNamespace getVariable ("_avgFPS");
	systemChat format["Before local FPS: %1, count: %2", (_avgFPS select 0), (_avgFPS select 1)];
	_avgFPS = [(((_avgFPS select 0) * (_avgFPS select 1)) + diag_fps) / ((_avgFPS select 1) + 1), (_avgFPS select 1) + 1];
	systemChat format["DIAG_FPS: %1", diag_fps];
    systemChat format["After local FPS: %1, count: %2", (_avgFPS select 0), (_avgFPS select 1)];
	if ((_avgFPS select 1) > 9) then {
		[[player, _avgFPS]] remoteExec ["Nord_fnc_setGlobalFPS", 2];
		systemChat (str [player, _avgFPS]);
		_avgFPS = [0,0];
	};
	localNamespace setVariable ["_avgFPS", _avgFPS];;
} , 5, []] call CBA_fnc_addPerFrameHandler;