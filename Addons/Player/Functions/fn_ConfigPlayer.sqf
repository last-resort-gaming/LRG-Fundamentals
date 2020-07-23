/*
Function: LR_fnc_ConfigPlayer

Description:
	Used to configure basic player attributes and equipment.

Arguments:
	_unit - Player the setup is applied to. <OBJECT>
	_Section - The Section the Player is in. <STRING>
	_Traits - Which Traits the player has, can be more than one. <ARRAY>
	_Loadout - Name of Loadout to call. Changes player equipment to Loadout from LRG Fundamentals. <STRING>

Examples:
	(begin example)
		[this] call LR_fnc_ConfigPlayer;
		[this, "1 Section"] call LR_fnc_ConfigPlayer;
		[this, "909 EAW", ["Pilot"]] call LR_fnc_ConfigPlayer;
		[this, "Command", ["Pilot", "Mission Maker"]] call LR_fnc_ConfigPlayer;
		[this, "909 EAW", ["Pilot"], "3CB Pilot"] call LR_fnc_ConfigPlayer;
	(end)

Author:
	MitchJC
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
	// todo: replace this check with a check for tfar_core path if legacy TFAR reaches EOL
	// and gets fully deprecated
	if (isClass (configFile >> "CfgPatches" >> "task_force_radio")) then {

		// TFAR Beta now uses tfar_core as its main patch, task_force_radio patch is only supplied
		// for legacy compatibility, so we can use this to check if the beta is currently loaded,
		// or not
		_beta = isClass (configFile >> "CfgPatches" >> "tfar_core");

		private ["_ShortRange", "_LongRange"];

		call {
			if (_Section == "Command") exitwith {
				_ShortRange = ["475", "480", "425", "100", "200", "300", "400"];
				_LongRange = ["30", "32", "40", "60", "50", "82", "82", "82"];
			};
			if (_Section == "1 Section") exitwith {
				_ShortRange = ["100", "125", "150", "425", "82", "82", "82", "82"];
				_LongRange = ["30", "32", "60", "61", "62", "63", "64", "65", "66"];
			};
			if (_Section == "2 Section") exitwith {
				_ShortRange = ["200", "225", "250", "425", "82", "82", "82", "82"];
				_LongRange = ["30", "32", "60", "61", "62", "63", "64", "65", "66"];
			};
			if (_Section == "3 Section") exitwith {
				_ShortRange = ["300", "325", "350", "425", "82", "82", "82", "82"];
				_LongRange = ["30", "32", "60", "61", "62", "63", "64", "65", "66"];
			};
			if (_Section == "909 EAW") exitwith {
				_ShortRange = ["401", "402", "403", "404", "405", "406", "407", "425"];
				_LongRange = ["50", "60", "40", "60", "61", "62", "63", "64"];
			};
			if (_Section == "Support") exitwith {
				_ShortRange = ["500", "525", "550", "575", "100", "200", "300", "425"];
				_LongRange = ["30", "32", "60", "61", "62", "63", "64", "65", "66"];
			};
		};

		// TFAR Beta and Legacy use different way to set the frequency, so we have to check which version
		// is loaded to support both
		if (_beta) then {
			_unit setVariable ["TFAR_freq_sr", _ShortRange, true];
			_unit setVariable ["TFAR_freq_lr", _LongRange, true];
		} else {
			group _unit setVariable ["tf_sw_frequency", [0,9,_ShortRange,0,nil,-1,0,false], true];
			group _unit setVariable ["tf_lr_frequency", [0,9,_LongRange,0,nil,-1,0,false], true];
		};
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

	//=========== Set Section
	_unit setVariable ["LRG_Section", _Section, true];
};

//========== SideChat Config
if (hasinterface) then {
	if ((isClass (configFile >> "CfgPatches" >> "task_force_radio")) && (EnableSideChat)) then {
		if ((_Section == "Command") || (_Section == "909 EAW")) then {
			1 enablechannel [true, false];
		};
	};
};