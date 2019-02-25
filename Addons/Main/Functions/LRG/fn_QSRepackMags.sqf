// not documented: postInit

if (!hasInterface) exitwith {};

	[
		player,
		"<t color='#356789'>Repack Mags</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{},
		{},
		{player spawn LR_fnc_clientRepackMagazines},
		{},
		[],
		1,
		-92,
		false,
		false
	] call BIS_fnc_holdActionAdd;

	player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[
		player,
		"<t color='#356789'>Repack Mags</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
		"true",
		"true",
		{},
		{},
		{player spawn LR_fnc_clientRepackMagazines},
		{},
		[],
		1,
		-92,
		false,
		false
	] call BIS_fnc_holdActionAdd;
}];