/*
Function: LR_fnc_deployFOB

Description:
	Deploys the FOB.

Arguments:
	_object - Object whose FOB to deploy
	_caller - Player that's deploying the FOB

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_deployFOB", 2];
};

params ["_object"];

// sanity checks
if (_object getVariable ["LR_PortableFOB_Deployed", false]) exitWith {
	systemChat "FOB was already deployed!";
};

_type = _object getVariable ["LR_PortableFOB_Type", "NULL"];

if (_type isEqualTo "NULL") exitWith {
	systemChat "Invalid FOB type set!";
};

_size = _object getVariable ["LR_PortableFOB_Size", -1];

if (_size < 0) exitWith {
	systemChat "Invalid FOB size!";
};

// Don't want to have our FOB controller destroyed...
// TODO: May have to re-enable damage after spawning complete, at least for vehicles
// We don't want invulnerable gunships, do we?
_object allowDamage false;

_pos = getPos _object;
_dir = getDir _object;

// hide nearby terrain objects
_hiddenObjects = [_pos, 5 + _size * 5, [], ["WALLS", "VEGETATION", "MISC"]] call YAINA_fnc_hideTerrainObjects;

// Get composition array and spawn it using the BIS_fnc_ObjectsMapper
_compArray = call (compile format ["call LR_fnc_%1", _type]);

_objects = [_pos, _dir, _compArray, 0] call BIS_fnc_objectsMapper;

// Properly align the objects with the ground etc...
{
	_x call ace_common_fnc_fixPosition;
} forEach _objects;

// Set the runtime variables for the FOB object
_object setVariable ["LR_PortableFOB_Objects", _objects, true];
_object setVariable ["LR_PortableFOB_HiddenObjects", _hiddenObjects, true];
_object setVariable ["LR_PortableFOB_Deployed", true, true];
_object setVariable ["LR_PortableFOB_Pos", _pos, true];

// re-enable damage
_object allowDamage true;

// we may not actually need to do that, instead we just disable packing up the FOB
// if we are too far away.
/*
// For vehicles, lock the driver seat and throw people on the driver seat out, we
// can't have our FOBs drive off...
if (_object isKindOf "AllVehicles") then {
	_object lockDriver true;

	[driver _object, ["getOut", _object]] remoteExec ["action", (driver _object)];
};

// Disable carrying and dragging on the FOB object
[_object, false] call ACE_dragging_fnc_setCarryable;
[_object, false] call ACE_dragging_fnc_setDraggable;
*/