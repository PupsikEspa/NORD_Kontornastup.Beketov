sleep 5;
/*if ((getPlayerUID player) == "76561198883184578") then {
	[((group player) getVariable "regArs"), ["NMG_weapons_AM17pp"], false] call ace_arsenal_fnc_addVirtualItems; //Ваза
};*/
if ((getPlayerUID player) == "76561198316727609") then {
	[((group player) getVariable "regArs"), ["NMG_weapons_ppsh","71rnd_762mm_psh_nmg","NMG_weapons_pksp","NMG_silence_dtknrmini","rhs_100Rnd_762x54mmR", "ACE_optic_MRCO_2D"], false] call ace_arsenal_fnc_addVirtualItems; //Шамко (блат)
};
