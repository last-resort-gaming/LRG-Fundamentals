/*
	LRG MISSION TEMPLATE
	LR_fnc_ConfigPlayer.sqf
	Author: MitchJC
	Description: Used to configure basic player attributes.
	
	Syntax
	[_unit, _Section, [_Traits]] call LR_fnc_ConfigPlayer;
	
	Parameters
	_unit - Player the setup is applied to.  <OBJECT>
	_Section - The Section the Player is in. <STRING>
	_Traits - Which Traits the player has, can be more than one. <ARRAY>
	
	Example 1:	[this] call LR_fnc_ConfigPlayer;
	Example 2:	[this, "1 Section"] call LR_fnc_ConfigPlayer;
	Example 3:	[this, "909 EAW", ["Pilot"]] call LR_fnc_ConfigPlayer;
	Example 4;	[this, "Command", ["Pilot", "Mission Maker"]] call LR_fnc_ConfigPlayer;
	
	_Section = ["1 Section", "2 Section", "3 Section", "909 EAW", "Support"];
	_Trait = ["Mission Maker", "Pilot"];
*/

params [
"_unit",
["_Section", "Support"],
["_Traits", []]
];

private ["_ShortRange", "_LongRange"];

_SectionFreq = call {

if (_Section == "Command") exitwith {
_ShortRange = [0,9,["475","500","425","100","200","300","400",LR0],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
};
if (_Section == "1 Section") exitwith {
_ShortRange = [0,9,["100","125","150","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
};
if (_Section == "2 Section") exitwith {
_ShortRange = [0,9,["200","225","250","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
};
if (_Section == "3 Section") exitwith {
_ShortRange = [0,9,["300","325","350","425",LR0,LR0,LR0,LR0],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
};
if (_Section == "909 EAW") exitwith {
_ShortRange = [0,9,["401","402","403","404","405","406","407","425"],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
};
if (_Section == "Support") exitwith {
_ShortRange = [0,9,["70","75","425",LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
_LongRange = [0,9,[LR1,LR2,LR4,LR3,LR0,LR0,LR0,LR0,LR0],0,nil,-1,0,false];
	};
};
	
	group _unit setVariable ["tf_sw_frequency", _ShortRange, true];
	group _unit setVariable ["tf_lr_frequency", _LongRange, true];

{
_unit setUnitTrait [_x, true, true];
} foreach _Traits;