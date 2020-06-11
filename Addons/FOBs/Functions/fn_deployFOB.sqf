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

params ["_object", "_caller"];

// sanity checks
if (_object getVariable ["LR_PortableFOB_Deployed", false]) exitWith {
	systemChat "FOB was already deployed!";
};

_type = _object getVariable ["LR_PortableFOB_Type", "NULL"];

if (_type isEqualTo "NULL") exitWith {
	systemChat "Invalid FOB type set!";
};

_name = _object getVariable ["LR_PortableFOB_Name", ""];

_size = _object getVariable ["LR_PortableFOB_Size", -1];

if (_size < 0) exitWith {
	systemChat "Invalid FOB size!";
};

// Don't want to have our FOB controller destroyed when everything is being spawned in...
_object allowDamage false;

_pos = getPos _object;
_dir = getDir _object;

// hide nearby terrain objects
_hiddenObjects = [_pos, 5 + _size * 5, [], ["WALLS", "VEGETATION", "MISC"]] call YAINA_F_fnc_hideTerrainObjects;

// Get composition array and spawn it using the BIS_fnc_ObjectsMapper
_compArray = call (compile format ["call LR_fnc_%1", _type]);

_objects = [_pos, _dir, _compArray, 0, false] call LR_fnc_objectsMapper;

// Properly align the objects with the ground etc, only works with ACE for now...
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	{
		_x call ace_common_fnc_fixPosition;
	} forEach _objects;
};

// Add the FOB as a respawn position
_respawnPos = [side _caller, _pos, _name] call BIS_fnc_addRespawnPosition;

// Set the runtime variables for the FOB object
_object setVariable ["LR_PortableFOB_Objects", _objects, true];
_object setVariable ["LR_PortableFOB_HiddenObjects", _hiddenObjects, true];
_object setVariable ["LR_PortableFOB_Deployed", true, true];
_object setVariable ["LR_PortableFOB_Pos", _pos, true];
_object setVariable ["LR_PortableFOB_RespawnPos", _respawnPos, true];

// re-enable damage and hope nothing breaks
_object allowDamage true;