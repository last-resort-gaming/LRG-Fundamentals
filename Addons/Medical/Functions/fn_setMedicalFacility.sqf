/*
Function: LR_fnc_setMedicalFacility

Description:
	Turns the given object or trigger into a medical facility.

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
if (!isServer) exitWith {};

// If the object is not a trigger, create one based on bounding boxes
if !(_object isKindOf "EmptyDetector") then {
    private _SpawnLocation = getPosATL _object;
    private _GetObjectSize = boundingBoxReal _object;
    private _Width = (_GetObjectSize select 1) select 0;
    private _Length = (_GetObjectSize select 1) select 1;
    private _Height = ((_GetObjectSize select 1) select 2) *2;
    _object = createTrigger ["EmptyDetector",_SpawnLocation, false];
    _object setTriggerArea [_Width, _Length, getdir _object, false, _Height];
};

_object setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_object setTriggerStatements [
    "true",
    "
    {
        [_x] remoteExec [""LR_fnc_FacilityHeal"",_x];
    } forEach thisList;",
    ""
];