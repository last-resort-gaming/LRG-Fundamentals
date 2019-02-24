// not documented: postInit

if (!hasInterface) exitwith {};
/*
player addAction ["Repack Magazines", "player spawn LR_fnc_clientRepackMagazines","",-98,false,true];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit addAction ["Repack Magazines", "player spawn LR_fnc_clientRepackMagazines","",-98,false,true];
}];
*/

	[
		player,
		"RepackMags",
		"<t color='#356789'>Repack Mags</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{},
		{},
		{player spawn LR_fnc_clientRepackMagazines},
		{},
		[],
		1,
		false,
		"Repacking Mags",
		false
	] call LR_fnc_AddHoldAction;


	player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[
		player,
		"RepackMags",
		"<t color='#356789'>Repack Mags</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{},
		{},
		{player spawn LR_fnc_clientRepackMagazines},
		{},
		[],
		1,
		false,
		"Repacking Mags",
		false
	] call LR_fnc_AddHoldAction;
}];