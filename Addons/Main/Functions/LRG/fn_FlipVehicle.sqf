	if (!hasinterface) exitwith {};
	
	[
		player,
		"<t color='#ffae00'>Flip Vehicle</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
		"(cursorTarget iskindof 'landVehicle') && cursorTarget distance player < 5",
		"true",
		{},
		{},
		{   
			_veh = cursorTarget;
			_veh setVectorUp [0,0,1];
			cursorTarget setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];
        },
		{},
		[],
		5,
		-93,
		false,
		false
	] call BIS_fnc_holdActionAdd;

	player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[
		player,
		"<t color='#ffae00'>Flip Vehicle</t>",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_takeOff1_ca.paa",
		"(cursorTarget iskindof 'landVehicle') && cursorTarget distance player < 5",
		"true",
		{},
		{},
		{   
			_veh = cursorTarget;
			_veh setVectorUp [0,0,1];
			cursorTarget setPosATL [(getPosATL _veh) select 0, (getPosATL _veh) select 1, 0];
        },
		{},
		[],
		5,
		-93,
		false,
		false
	] call BIS_fnc_holdActionAdd;
}];