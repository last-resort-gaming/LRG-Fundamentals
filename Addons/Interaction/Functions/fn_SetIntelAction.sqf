// not documented: internal function
if ( not hasInterface ) exitWith {};

params [
	"_object",
	["_actionTitle", "Take Intel"],
 	["_itemName", "Intel"]
];

[
	_object,
	"intel" + str (floor (random 360)),
	_actionTitle,
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"_player distance _target < 2 &&
	 {
	 	((side group _player) in (_target getvariable ['RscAttributeOwners',[west,east,resistance,civilian]])) ||
	 	(((group _player) getVariable ['LRG_section','Command']) in (_target getVariable ['RscAttributeOwners',['Command']]))
	 }",
	"true",
	{ [format["<t color='#FFBB00' size = '.5'>You're collecting %1.</t>",(_this select 2) select 0],-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;},
	{},
	{
		_this spawn LR_fnc_RunIntelAction;
		[format["<t color='#339900' size = '.5'>You've collected %1.</t>",(_this select 2) select 0],-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;
	},
	{[format["<t color='#cc3232' size = '.5'>You've stopped collecting %1.</t>",(_this select 2) select 0],-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;},
	[_itemName],
	5,
	true,
	format ["You're collecting %1", _itemName],
	false
] call LR_fnc_AddHoldAction;
