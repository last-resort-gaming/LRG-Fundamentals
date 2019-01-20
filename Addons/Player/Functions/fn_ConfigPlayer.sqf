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

if (_Section isEqualto -1) exitwith {};

call {

	if (_Section isEqualto 0) exitwith {_Section = "Command"};
	if (_Section isEqualto 1) exitwith {_Section = "1 Section"};
	if (_Section isEqualto 2) exitwith {_Section = "2 Section"};
	if (_Section isEqualto 3) exitwith {_Section = "3 Section"};
	if (_Section isEqualto 4) exitwith {_Section = "909 EAW"};
	if (_Section isEqualto 5) exitwith {_Section = "Support"};
};

if (local _unit) then {

//========== Section Config
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {

		private ["_ShortRange", "_LongRange"];

		call {

			if (_Section == "Command") exitwith {
				_ShortRange = [0,9,["475","500","425","100","200","300","400","82"],0,nil,-1,0,false];
				_LongRange = [0,9,["30","40","60","50","82","82","82","82","82"],0,nil,-1,0,false];
			};
			if (_Section == "1 Section") exitwith {
				_ShortRange = [0,9,["100","125","150","425","82","82","82","82"],0,nil,-1,0,false];
				_LongRange = [0,9,["30","60","82","82","82","82","82","82","82"],0,nil,-1,0,false];
			};
			if (_Section == "2 Section") exitwith {
				_ShortRange = [0,9,["200","225","250","425","82","82","82","82"],0,nil,-1,0,false];
				_LongRange = [0,9,["30","60","82","82","82","82","82","82","82"],0,nil,-1,0,false];
			};
			if (_Section == "3 Section") exitwith {
				_ShortRange = [0,9,["300","325","350","425","82","82","82","82"],0,nil,-1,0,false];
				_LongRange = [0,9,["30","60","82","82","82","82","82","82","82"],0,nil,-1,0,false];
			};
			if (_Section == "909 EAW") exitwith {
				_ShortRange = [0,9,["401","402","403","404","405","406","407","425"],0,nil,-1,0,false];
				_LongRange = [0,9,["50","60","40","82","82","82","82","82","82"],0,nil,-1,0,false];
			};
			if (_Section == "Support") exitwith {
				_ShortRange = [0,9,["70","75","425","82","82","82","82","82"],0,nil,-1,0,false];
				_LongRange = [0,9,["30","60","82","82","82","82","82","82","82"],0,nil,-1,0,false];
			};
		};

		group _unit setVariable ["tf_sw_frequency", _ShortRange, true];
		group _unit setVariable ["tf_lr_frequency", _LongRange, true];
	};
//========== Trait Config
	private _TraitsArray = call {
	if ((typeName _Traits) isEqualTo "STRING") exitWith { [_Traits]};
	_Traits
	};	
	
	if !(_TraitsArray isEqualTo []) then {
		{
			_unit setUnitTrait [_x, true, true];
		} forEach _TraitsArray;
	};
//========ACE Player Traits
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {

	_unit setvariable ["ace_advanced_fatigue_performanceFactor",2.0,true];

	if (_unit getunittrait "Medic") then { _unit setVariable ["ace_medical_medicClass", 1, true]};
	if (_unit getunittrait "Doctor") then { _unit setVariable ["ace_medical_medicClass", 2, true]};
	if (_unit getunittrait "Engineer") then { _unit setVariable ["ace_isEngineer", 1, true]};
	if (_unit getunittrait "Adv Engineer") then { _unit setVariable ["ace_isEngineer", 2, true]};

};

//========== Loadout Config
	if !(_Loadout isEqualto []) then {
		[_unit, _Loadout] call LR_fnc_Loadouts;
	};

//=========== Patches
	[_unit, _Section] call LR_fnc_Patches;
};

//========== SideChat Config
if (hasinterface) then {
	if ((isClass (configFile >> "CfgPatches" >> "task_force_radio")) && (EnableSideChat)) then {
		if ((_Section == "Command") || (_Section == "909 EAW")) then {
			1 enablechannel [true, false];
		};
	};
};