params ["_playerUnit", "_didJIP"];
diag_log "Exec curator.sqf...";
_playerUID = getPlayerUID _playerUnit;
systemChat "Giving Zeus...";
_zeusmodule = [ 
    "76561199002226480", /// Фламберг
    "76561198376736313", /// Борв
    "76561198284004882", /// Миллер
    "76561199042520076", /// Ермак
    "76561198361041147", /// Кириенко
    "76561198815605790", /// Струна
	"76561198995428804", /// Gaga
	"76561198135788033", /// Арестун
	"76561198338806858", /// Цикада
	"76561198984888750", /// Варден
	"76561198316727609", /// Doctor
	"76561198852035938", /// Капуста
	"76561199221988240", /// Fanta
	"76561199287760678", /// Шилов
	"76561199061768748", /// Штефан
	"76561198453561118", /// Типок
	"76561198998228174", /// Узбек
	"76561199117120731", /// Морти
	"76561199161998110", /// Штурман
	"76561198908535754", /// Князь
	"76561198055139490" /// ГБР теыты [8 ОПСпН] Бiйрактар
];
if (!(_playerUID in _zeusmodule)) exitwith {};
if ((side _playerUnit != civilian) && (_playerUID != "76561198432363921") && (_playerUID != "76561198284004882") && (_playerUID !="76561198135788033") && (_playerUID != "76561198216667587") && (_playerUID != "76561199287760678")) exitwith {};

systemChat "Giving Zeus... 2";

_index = _zeusmodule find _playerUID;
	["dedmen"]  call {
		missionNamespace setVariable [_this select 0,_playerUnit, true];
		[0, {
			params ["_myName"];
			private _curVarName = _myName+"Cur";
			
			if (!isNil _curVarName) then {
				[-1, compile format["if (_playerUnit == %1) then {%1 sideChat 'deleting Curator';}", _myName]] call CBA_fnc_globalExecute;
				deleteVehicle (missionNamespace getVariable [_curVarName, objNull]);
				missionNamespace setVariable [_curVarName, nil, true];
			};


			if (isNil _curVarName) then {
				[-1, compile format["if (_playerUnit == %1) then {%1 sideChat 'creating Curator';}", _myName]] call CBA_fnc_globalExecute;

				if (isNil "DedmenCur_group") then {DedmenCur_group = creategroup sideLogic;};
				private _myCurObject = DedmenCur_group createunit["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];	//Logic Server
				_myCurObject setVariable ["showNotification",false];
				
				missionNamespace setVariable [_curVarName, _myCurObject, true];
				publicVariable "DedmenCur_group";
				unassignCurator _myCurObject;
				_cfg = (configFile >> "CfgPatches");
				_newAddons = [];
				for "_i" from 0 to((count _cfg) - 1) do {
					_name = configName(_cfg select _i);
					_newAddons pushBack _name;
				};
				if (count _newAddons > 0) then {_myCurObject addCuratorAddons _newAddons};

				_myCurObject setcuratorcoef["place", 0];
				_myCurObject setcuratorcoef["delete", 0];
				private _enableSyncVar = _myName+"_enableSync";
				private _val = random 500;
				missionNamespace setVariable [_enableSyncVar, random 500];
				[_enableSyncVar,_val] spawn {
					while  {(missionNamespace getVariable [_this select 0, 0]) == (_this select 1)} do {
					// {
					_myCurObject addCuratorEditableObjects[(allMissionObjects "All"), true];
					// } forEach allCurators;
					sleep 2;
				};};
				

			};
			private _myCurObject = missionNamespace getVariable [_curVarName, objNull];
			
			/* if (getAssignedCuratorUnit (_myCurObject) != dedmen) then {*/
			unassignCurator _myCurObject;
			sleep 0.4;
			dedmen assignCurator _myCurObject;
			/* };*/
			[-1, compile format["if (_playerUnit == %1) then {%1 sideChat 'you are Curator';}", _myName]] call CBA_fnc_globalExecute;
		}, _this] call CBA_fnc_globalExecute;
	};

systemChat "Giving Zeus... 3";
diag_log "Exec curator.sqf finished";