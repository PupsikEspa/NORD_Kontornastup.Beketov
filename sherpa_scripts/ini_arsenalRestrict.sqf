{
	if (_x != ((group player) getVariable "regArs")) then {[_x, false] call ace_arsenal_fnc_removeBox; _x lockInventory true;};
} forEach [vks_ars,dshp56_ars,dshd7_ars,pyatnashka_ars,obrmp155_ars,timer_ars,dshd76_ars,obrmp810_ars,obrspn22_ars,obrspn45_ars,volki_ars,dshr_rusich_ars,gnl_ars,odshbr95_ars,ogshbr128_ars,odsbr82_ars,obrmp36_ars,odshbr80_ars,psu_ars,oshb425_ars,ombr47_ars,opsn8_ars,opsn3_ars,msco73_ars];