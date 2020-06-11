/*
Function: LR_fnc_checkFOBPos

Description:
	Allows players to see how and where the FOB would be deployed, so they can
	make some adjustments before placing in the FOB.

Arguments:
	_object - Object to turn into a portable FOB

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_object"];

_type = _object getVariable ["LR_PortableFOB_Type", "NULL"];

if (_type isEqualTo "NULL") exitWith {
	systemChat "Invalid FOB type set!";
};

// Don't want to have our FOB controller destroyed when everything is being spawned in...
//_object allowDamage false;

_pos = getPos _object;
_dir = getDir _object;

// Get composition array and spawn it using the BIS_fnc_ObjectsMapper
_compArray = call (compile format ["call LR_fnc_%1", _type]);

_objects = [_pos, _dir, _compArray, 0, true] call LR_fnc_objectsMapper;

// Properly align the objects with the ground etc, only works with ACE for now...
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	{
		_x call ace_common_fnc_fixPosition;
	} forEach _objects;
};


// Delete the preview objects after some time
[
	{
		{
			deleteVehicle _x;
		} forEach _this;
	},
	_objects,
	15
] call CBA_fnc_waitAndExecute;