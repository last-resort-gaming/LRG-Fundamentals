/*
	LRG MISSION TEMPLATE
	LR_fnc_ConfigPlayer.sqf
	Author: MitchJC
	Description: Used to configure basic player attributes and equipment.
	
	Syntax
	[_unit, _Section, [_Traits], _Loadout] call LR_fnc_ConfigPlayer;
	
	Parameters
	_unit - Player the setup is applied to.  <OBJECT>
	_Section - The Section the Player is in. <STRING>
	_Traits - Which Traits the player has, can be more than one. <ARRAY>
	_Loadout - Name of Loadout to call. Changes player equipment to Loadout from LRG Fundamentals. <STRING>

	
	Example 1:	[this] call LR_fnc_ConfigPlayer;
	Example 2:	[this, "1 Section"] call LR_fnc_ConfigPlayer;
	Example 3:	[this, "909 EAW", ["Pilot"]] call LR_fnc_ConfigPlayer;
	Example 4;	[this, "Command", ["Pilot", "Mission Maker"]] call LR_fnc_ConfigPlayer;
	Example 5:	[this, "909 EAW", ["Pilot"], "3CB Pilot"] call LR_fnc_ConfigPlayer;
	
*/

params [
	"_unit",
	["_Section", "Support"],
	["_Traits", []],
	["_Loadout", []]
];
//========== Section Config
if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {

	private ["_ShortRange", "_LongRange"];

	_SectionFreq = call {

		if (_Section == "Command") exitwith {
			_ShortRange = [0,9,["475","500","425","100","200","300","400",LR0],0,nil,-1,0,false];
			_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
		if (_Section == "1 Section") exitwith {
			_ShortRange = [0,9,["100","125","150","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
			_LongRange = [0,9,[LR1,LR4,LR0,LR0,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
		if (_Section == "2 Section") exitwith {
			_ShortRange = [0,9,["200","225","250","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
			_LongRange = [0,9,[LR1,LR4,LR0,LR0,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
		if (_Section == "3 Section") exitwith {
			_ShortRange = [0,9,["300","325","350","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
			_LongRange = [0,9,[LR1,LR4,LR0,LR0,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
		if (_Section == "909 EAW") exitwith {
			_ShortRange = [0,9,["401","402","403","404","405","406","407","425"],0,nil,-1,0,false];
			_LongRange = [0,9,[LR3,LR4,LR2,LR0,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
		if (_Section == "Support") exitwith {
			_ShortRange = [0,9,["70","75","425",LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
			_LongRange = [0,9,[LR1,LR4,LR0,LR0,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
		};
	};
	
	group _unit setVariable ["tf_sw_frequency", _ShortRange, true];
	group _unit setVariable ["tf_lr_frequency", _LongRange, true];
};
//========== Trait Config
if !(_Traits isEqualTo []) then {	
	{
		_unit setUnitTrait [_x, true, true];
	} forEach _Traits;
};
//========== Loadout Config
if !(_Loadout isEqualto []) then {
	[_unit, _Loadout] call LR_fnc_Loadouts;
};