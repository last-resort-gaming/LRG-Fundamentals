/*
Function: LR_fnc_checkFOBDeploy

Description:
	Returns true is the space is clear to deploy a FOB of certain size.
	Size that needs to be clear (circle radius from controller):
	Camp FOB - 5 m
	Small FOB - 10 m
	Medium FOB - 15 m
	Large FOB - 20 m

Arguments:
	_object - Object to check FOB space for

Return Values:
	true if enough space is free, false otherwise

Examples:
    Nothing to see here

Author:
	Mokka
*/
params ["_object"];

_size = _object getVariable ["LR_PortableFOB_Size", -1];
_pos = getPos _object;

_obstructed = ((count nearestTerrainObjects [_object, ["BUILDING","HOUSE","CHURCH","CHAPEL","FUELSTATION","HOSPITAL","RUIN","BUNKER","WALL"], 5 + _size * 5]) > 0);
_deployed = (_object getVariable ["LR_PortableFOB_Deployed", false]);

if ((!_deployed) && {_obstructed}) exitWith {
	hintSilent "Can't deploy FOB! There are buildings in the way...";
	false;
};

// Can't deploy what's already been deployed
// Neither do we want solid structures anywhere near the FOB
(!_deployed) && (!_obstructed);