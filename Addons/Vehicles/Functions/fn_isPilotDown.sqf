/*
Function: LR_fnc_isPilotDown

Description:
	Returns true if the pilot of the given vehicle is currently incapacitated

Arguments:
	_vehicle - Vehicle to check pilot of

Return Values:
	If the pilot is down

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_vehicle"];

if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {
	((not alive (driver _vehicle)) || (driver _vehicle) getVariable ["ACE_isUnconscious", false])
};

((not alive (driver _vehicle)) || (lifeState (driver _vehicle)) in ["INCAPACITATED", "DEAD", "DEAD-RESPAWN", "DEAD-SWITCHING"])