/*
Function: LR_fnc_MedicalFacility

Description:
	Creates an area around _object where players are healed or revived after a time delay.

Arguments:
	_object - Object the MedicalFacility is created on. <OBJECT>
	_length - Length of Area. <NUMBER>
	_Width - Width of Area. <NUMBER>
	_Height- Height of Area. <NUMBER>

Examples:
	--- Code
		[this] call LR_fnc_MedicalFacility;
		[this, 10, 5, 5] call LR_fnc_MedicalFacility;
		[MyMedicalBuilding, 10, 5, 5] call LR_fnc_MedicalFacility;
	---
Author: MitchJC
*/
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

params [
	"_object",
	["_Length", 5],
	["_Width", 5],
	["_Height", 5]
];


LR_FNC_Medical = {

	if (player getVariable "ACE_isUnconscious") then {
		[format ["%1<br />is being revived at the LRG Medical Facility.", profileName], [1,-0.2], "#ed1b2e", 0.4] call LR_fnc_dynamicText;
		[ACE_medical_fnc_treatmentAdvanced_fullHealLocal, [objNull,player], 10] call CBA_fnc_waitAndExecute;
	} else {
		[ACE_medical_fnc_treatmentAdvanced_fullHealLocal, [objNull,player], 5] call CBA_fnc_waitAndExecute;
	};
};

_trg = createTrigger ["EmptyDetector",_object];
_trg setTriggerArea [_Length, _Width, getdir _object,true, _Height];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerStatements ["player in thislist", "call LR_fnc_Medical",""];