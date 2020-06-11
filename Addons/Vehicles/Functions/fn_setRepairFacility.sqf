/*
Function: LR_fnc_setRepairFacility

Description:
	Turns the given object or trigger into a repair facility.

Arguments:
	_object - Object to turn into a repair facility

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params ["_object"];

// If the object is not a trigger, create one based on bounding boxes
if !(_object isKindOf "EmptyDetector") then {

    private _SpawnLocation = getPosATL _object;
    private _GetObjectSize = boundingBoxReal _object;
    private _Width = (_GetObjectSize select 1) select 0;
    private _Length = (_GetObjectSize select 1) select 1;
    private _Height = ((_GetObjectSize select 1) select 2) *2;
    _object = createTrigger ["EmptyDetector",_SpawnLocation];
    _object setTriggerArea [_Width, _Length, getdir _object, false, _Height];
};

_object setTriggerActivation ["ANY", "PRESENT", true];
_object setTriggerStatements [
    "_v = (thislist select 0); { _v isKindOf _x } count [""UAV"", ""Plane"", ""Helicopter"", ""LandVehicle""] > 0 && { speed _v < 1 } && { isTouchingGround _v };",
    "call { _v = (thisList select 0); if (_v isKindOf ""UAV"") exitWith { [_v] execVM ""z\LRG Fundamentals\Addons\Vehicles\Scripts\uav.sqf""; }; _type = { if (_v isKindOf _x) exitWith { _x } ; nil } count [""UAV"", ""Plane"", ""Helicopter"", ""LandVehicle""];if (_type isEqualTo 0) exitWith {};[_type, _v, 30, 30] execVM ""z\LRG Fundamentals\Addons\Vehicles\Scripts\general.sqf"";};",
    ""
];