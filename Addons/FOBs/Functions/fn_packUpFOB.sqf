/*
Function: LR_fnc_packUpFOB

Description:
	Packs up the passed FOB

Arguments:
	_object - FOB to pack up

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

if (!isServer) exitWith {
	_this remoteExec ["LR_fnc_packUpFOB", 2];
};

params ["_object"];

// sanity checks
if !(_object getVariable ["LR_PortableFOB_Deployed", false]) exitWith {
	systemChat "FOB has to be deployed first!";
};

// delete composition objects
{
	deleteVehicle _x;
} forEach (_object getVariable ["LR_PortableFOB_Objects", []]);

// set variables
_object setVariable ["LR_PortableFOB_Deployed", false, true];
_object setVariable ["LR_PortableFOB_Pos", [0, 0, 0], true];

// we may not actually need to do that, instead we just disable packing up the FOB
// if we are too far away.
/*
// re-enable the driver seat on vehicles
if (_object isKindOf "AllVehicles") then {
	_object lockDriver false;
};


// re-enable dragging and carrying
[_object, true] call ACE_dragging_fnc_setCarryable;
[_object, true] call ACE_dragging_fnc_setDraggable;
*/

// unhide terrain
{
    if !(isNull _x) then {
        _x hideObjectGlobal false;
        _x allowDamage true;
    };
} forEach (_object getVariable ["LR_PortableFOB_hiddenObjects", []]);