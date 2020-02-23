/*
Function: LR_fnc_CivilianGarrison

Description:
	Garrison buildings in given radius around given position, using
	units of the passed faction.

Arguments:
	_pos - Position around which to garrison buildings <POSITION 3D>
	_radius - Radius around the position in which to garrison buildings, in min-max <ARRAY OF SCALARS>
	_faction - The faction which we want to use to populate the garrisons <STRING>
	_side - The side of the civilians to spawn <SIDE>
	_pedList - Array of units to use in populating <ARRAY OF STRINGS>
	_unitCount - The amount of units we want to create <SCALAR>
	_AIOB_Positioning - The positioning directive to use <SCALAR, defaults to: 2>
	_maxFill - The maximum amount of units in one building <SCALAR, defaults to: 1>
	_excludes - Exclude buildings in this array from being garrisoned <ARRAY OF STRING>

Return Values:
	Array containing the garrisoned units <ARRAY OF UNITS>

Examples:
    Nothing to see here

Author:
	Mokka
*/

if (!isServer) exitWith {};

params [
	"_pos", "_radius",
	["_faction", "CIV_Default"],
	["_side", civilian],
	"_pedList",
	["_unitCount", 0],
	["_AIOB_Positioning", 2],
	["_maxFill", 1],
	["_excludes", []]
];

_units = [];
_group = createGroup [_side, true];

for "_x" from 0 to _unitCount do {
	private _u = _group createUnit [(selectRandom _pedList), _pos, [], 0, "CAN_COLLIDE"];
	_units append [_u];
};

if (_units isEqualTo []) exitWith {};

private _failed = [_pos, nil, _units, _radius, _AIOB_Positioning, true, _maxFill, _excludes] call DERP_fnc_AIOccupyBuilding;

// Remove any non-garrisoned units
{ deleteVehicle _x; } forEach _failed;
_allUnits = _units - _failed;

// Add units to zeus
{_x addCuratorEditableObjects [_allUnits, false];} forEach allCurators;

_allUnits;
