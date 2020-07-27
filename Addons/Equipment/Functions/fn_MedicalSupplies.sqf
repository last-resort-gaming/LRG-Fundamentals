/*
Function: LR_fnc_MedicalSupplies

Description:
	Used to configure basic container medical state.

Arguments:
	_container - Container the setup is applied to. <OBJECT>
	_Type - Equipment setup to add. <STRING>
	_purge - Clear the container's inventory before adding supplies? <BOOLEAN>

Examples:
	(begin example)
		[this] call LR_fnc_MedicalSupplies;
		[this, "MERT", true] call LR_fnc_MedicalSupplies;
	(end)

Author:
	MitchJC
*/
if (!isServer) exitwith {};

params [
	"_container",
	["_Type", "NONE"],
	["_purge", false]
];

private _VarType = _container getVariable ["LRG_Equipment_Select", -1];

call {
	if (_VarType isEqualto 0) exitwith {_Type = "Limited"};
	if (_VarType isEqualto 1) exitwith {_Type = "Standard"};
	if (_VarType isEqualto 2) exitwith {_Type = "MERT"};
};

if (_Type isEqualTo "NONE") exitWith {};

private ["_ContainerItems"];

call {
	if (_Type isEqualTo "Limited") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["ACE_elasticBandage", 20],
				["ACE_quikclot", 20],
				["ACE_morphine", 25],
				["ACE_packingBandage", 20],
				["ACE_tourniquet", 10]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 20]
			];
		};
	};
	if (_Type isEqualTo "Standard") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["ACE_elasticBandage", 20],
				["ACE_quikclot", 20],
				["ACE_bloodIV_500", 20],
				["ACE_epinephrine", 25],
				["ACE_morphine", 25],
				["ACE_packingBandage", 20],
				["ACE_tourniquet", 10]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 30],
				["Medikit", 2]
			];
		};
	};
	if (_Type isEqualTo "MERT") exitwith {
		if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
			_ContainerItems = [
				["adv_aceCPR_AED", 1],
				["ACE_elasticBandage", 50],
				["ACE_quikclot", 50],
				["ACE_bloodIV_500", 20],
				["ACE_bloodIV", 20],
				["ACE_epinephrine", 25],
				["ACE_morphine", 30],
				["ACE_packingBandage", 10],
				["ACE_tourniquet", 10]
			];
		} else {
			_ContainerItems = [
				["FirstAidKit", 50],
				["Medikit", 2]
			];
		};
	};
};

if (_purge) then {
	clearItemCargoGlobal _container;
};

{_container addItemCargoGlobal _x} foreach _ContainerItems;