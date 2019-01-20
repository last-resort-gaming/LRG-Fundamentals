/*
	LRG MISSION TEMPLATE
	LR_fnc_ConfigEquipment.sqf
	Author: MitchJC
	Description: Used to configure basic container equipment and ACE medical state.
	
	Syntax
	[_container, _Type, _isMedicalFacility] call LR_fnc_ConfigEquipment;
	
	Parameters
	_container - Container the setup is applied to.  <OBJECT>
	_Type - Equipment setup to add. <STRING>
	_isMedicalFacility - Should _container be treated as a medical facilty/vehicle? <BOOLIAN>


	
	Example 1:	[this] call LR_fnc_ConfigEquipment;
	Example 2:	[this, "Basic Medical", false] call LR_fnc_ConfigEquipment;
	Example 3:	[this, "Full MERT", true] call LR_fnc_ConfigEquipment;
	
*/
if (!isServer) exitwith {};

params [
	"_container",
	["_Type", "Basic Medical"],
	["_isMedicalFacility", false]
];

if (_Type isEqualto -1) exitwith {};

call {

	if (_Type isEqualto 0) exitwith {_Type = "Basic Medical"};
	if (_Type isEqualto 1) exitwith {_Type = "Full MERT"};

};

private ["_ContainerItems"];

call {

	if (_Type isEqualTo "Full MERT") exitwith {
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

	if (_Type isEqualTo "Basic Medical") exitwith {
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
};

{_container addItemCargoGlobal _x} foreach _ContainerItems;

//=========================== ACE Medical Building/_ContainerItems
if (_isMedicalFacility) then {
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {
		_container setVariable ["ace_medical_medicClass", 1, true];
	};
};