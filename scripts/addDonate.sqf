sleep 5;
/*if ((getPlayerUID player) == "76561198883184578") then {
	[((group player) getVariable "regArs"), ["NMG_weapons_AM17pp"], false] call ace_arsenal_fnc_addVirtualItems; //Ваза
};*/
if ((getPlayerUID player) == "76561198316727609") then {
	[((group player) getVariable "regArs"), ["NMG_weapons_ppsh","71rnd_762mm_psh_nmg","NMG_weapons_pksp","NMG_silence_dtknrmini","rhs_100Rnd_762x54mmR", "ACE_optic_MRCO_2D"], false] call ace_arsenal_fnc_addVirtualItems; //Шамко (блат)
};

if ((getPlayerUID player) == "76561198297574929") then {
	[((group player) getVariable "regArs"), ["rhsusf_acc_RM05","rhsusf_acc_rotex_mp7","rhsusf_mag_40Rnd_46x30_AP","rhsusf_weap_MP7A2_folded","rhsusf_acc_grip3","rhsusf_weap_MP7A2"], false] call ace_arsenal_fnc_addVirtualItems; //Giga
};

if ((getPlayerUID player) == "76561198168372978") then {
	[((group player) getVariable "regArs"), ["NMG_weapons_A762"], false] call ace_arsenal_fnc_addVirtualItems; //Giga
};