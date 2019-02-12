/*
Function: LR_fnc_infantryGarrison

Description:
	Garrison buildings in given radius around given position, using
	units of the passed faction.

Parameters:
	_pos - Position around which to garrison buildings <POSITION 3D>
	_radius - Radius around the position in which to garrison buildings, in min-max <ARRAY OF SCALARS>
	_side - Side of the units to garrison <SIDE>
	_factionSide - Side string of the faction to use in populating the garrisons <STRING>
	_faction - The faction which we want to use to populate the garrisons <STRING>
	_infantryType - Class name of the infantry group type to use in populating <STRING>
	_infList - Array of groups to use in populating <ARRAY OF STRINGS>
	_groupCount - The amount of groups we want to create <SCALAR>
	_AIOB_Positioning - The positioning directive to use <SCALAR, defaults to: 2>
	_skill - The skill level of the garrisoned units <STRING>
	_maxFill - The maximum amount of units in one building <SCALAR, defaults to: 4>
	_excludes - Exclude buildings in this array from being garrisoned <ARRAY OF STRING>
	_units - Array of units already in existence which we want to garrison as well <ARRAY OF UNITS>


Return Values:
	Array containing the garrisoned units <ARRAY OF UNITS>

Examples:
    Nothing to see here

Author:
	MartinCo & MitchJC
*/
if (!isServer) exitWith {};

params [
    "_pos",
    ["_radius", [0, 30]],
	["_side", east],
	["_FactionSide", "EAST"],
    ["_faction", "OPF_F"],
	["_InfantryType","UInfantry"],
	["_infList", ["OIA_GuardSquad"]],
    ["_groupCount", 1],
    ["_AIOB_Positioning", 2],
    ["_skill", "LRG Default"],
    ["_maxFill", 4],
    ["_excludes", []],
    ["_units", []]
];

if (_units isEqualTo []) then {

    for "_x" from 1 to _groupCount do {
		private _groupType = (configFile >> "CfgGroups" >> _FactionSide >> _faction >> _InfantryType >> (selectRandom _infList));
        private _g = [_pos, _side, _groupType] call BIS_fnc_spawnGroup;
        _units append (units _g);
    };
};

if (_units isEqualTo []) exitWith { [] };

private _failed = [_pos, nil, _units, _radius, _AIOB_Positioning, true, _maxFill, _excludes] call DERP_fnc_AIOccupyBuilding;

// Remove any non-garrisoned units
{ deleteVehicle _x; } forEach _failed;
_allUnits = _units - _failed;

// Set Skill
[_allUnits, _skill] call LR_fnc_setUnitSkill;

// Add units to zeus
{_x addCuratorEditableObjects [_allUnits, false];} forEach allCurators;

_allUnits;
