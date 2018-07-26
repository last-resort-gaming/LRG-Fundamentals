/*
	LRG MISSION TEMPLATE
	LR_fnc_ResetTargets.sqf
	Author: MitchJC
	Description: Used to set pop up targets to fall when hit and then up on laptop command.
	
	Syntax
	[_object, _title, _center, _distance] call LR_fnc_ResetTargets;
	
	Parameters
	_object - Object the addaction is applied to.  <OBJECT>
	_title - The name of the addaction, visable to players. <STRING>
	_center - Center of area to check for Pop up targets <ARRAY>
	_distance -  How far from center point to look for Pop Up targets<STRING>
	
	Example 1:	[this, "Reset Targets", [1200,4200,0], 250] call LR_fnc_ResetTargets;
	Example 2:	[MyLaptopName, "Reset 300m Range", [5500,3522,0], 300] call LR_fnc_ResetTargets;
*/



if (!isServer) exitWith {};

params [
		"_object",
		["_Title", "Reset Targets"],
		["_center", [0,0,0]],
		["_distance", 250]
];

private ["_Targets", "_SwivelTargets"];

LR_fnc_SetTargets = {

params [
		["_center", [0,0,0]],
		["_distance", 250]
];

_targets = nearestObjects [_center, ["TargetBase"], _distance];
if (count _targets < 1) exitWith {

};
{_x animate ["Terc",0];} forEach _targets;
{_x addEventHandler ["HIT", {
(_this select 0) animate ["Terc",1];
(_this select 0) RemoveEventHandler ["HIT",0];
}
]} forEach _targets;



_SwivelTargets = nearestObjects [_center, ["Target_Swivel_01_base_F"], _distance];
if (count _SwivelTargets < 1) exitWith {

};
{_x animate ["Terc",0]; _x setVariable ["BIS_poppingEnabled", false];} forEach _SwivelTargets;
{_x addEventHandler ["HitPart", {
((_this select 0) select 0) animate ["Terc",1];
((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
}
]} forEach _SwivelTargets;

};

[_center,_distance] call LR_fnc_SetTargets;	// Initial Reset.

[
	_object,
	format ["<t color='#00FFFF'>%1</t>", _Title],
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{ [format["<t color='#FFBB00' size = '.5'>Resetting Targets</t>"],-1,0.8,2,0.5,0,789] spawn BIS_fnc_dynamicText;},
	{},
	{[(_this select 3) select 2, (_this select 3) select 3]call LR_fnc_SetTargets;
	[format["<t color='#556b2f' size = '.5'>Targets Reset</t>"],-1,0.8,5,0.5,0,789] spawn BIS_fnc_dynamicText;
	},
	{[format["<t color='#cc3232' size = '.5'>Aborted</t>"],-1,0.8,5,0.5,0,789] spawn BIS_fnc_dynamicText;},
	[_object, _Title, _center, _distance],
	2,
	0,
	false,
	false
	] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];

	{_x addCuratorEditableObjects [[_object], false];} ForEach allcurators;
	{[_object, false] remoteExec [_x, 2];} foreach ["enableSimulationGlobal","allowDamage"];