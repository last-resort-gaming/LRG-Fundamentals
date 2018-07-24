/*
Function: YAINA_SPAWNS_fnc_setUnitSkill

Description:
	Set the given unit's skill level to the desired one.

Parameters:
	_target - The array of units or the group whose skill level we want to adjust
    _skillLevel - The skill level which we want to set the units to

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin
*/

params ["_target", ["_skillLevel", 2]];

if (typeName _skillLevel isEqualTo "SCALAR") then {
    if (_skillLevel < 1) then { _skillLevel = 1; };
    if (_skillLevel > 4) then { _skillLevel = 4; };
};

// We set each unit to be a random skill within the range below table
private _skillt = ["aimingAccuracy", "aimingShake", "aimingSpeed", "commanding", "courage", "endurance", "general", "reloadSpeed", "spotDistance", "spotTime"];
private _skillv = call {
    if (_skillLevel isEqualTo "LRG Default") exitWith { [(0.10 + random 0.20), (0.45 + random 0.30),(0.30 + random 0.20), 1, 1, 1, 1, (0.50 + random 0.50), (0.40 + random 0.30), (0.20 + random 0.40)] };
    if (_skillLevel isEqualTo "SME") exitWith { [0.10, 0.20, 0.20, 1, 1, 1, 1, 0.5, 0.50, 0.2] };
    if (_skillLevel isEqualTo "MAO") exitWith { [0.10, 0.20, 0.20, 1, 1, 1, 1, 0.5, 0.50, 0.2] };
    if (_skillLevel isEqualTo 1)     exitWith { [0.25, 0.65, 0.40, 1, 1, 1, 1, 1.0, 0.75, 0.6] };
    if (_skillLevel isEqualTo 2)     exitWith { [0.35, 0.75, 0.55, 1, 1, 1, 1, 1.0, 0.80, 0.7] };
    if (_skillLevel isEqualTo 3)     exitWith { [0.50, 0.90, 0.70, 1, 1, 1, 1, 1.0, 1.00, 0.9] };
    if (_skillLevel isEqualTo 4)     exitWith { [1, 1, 1, 1, 1, 1, 1, 1, 1, 1] };
    nil;
};

if (isNil "_skillv") exitWith {};

private _units = call {
    if ((typeName _target) isEqualTo "GROUP") exitWith { units _target };
    if ((typeName _target) isEqualTo "ARRAY") exitWith { _target };
    [_target];
};

{
    _a = _x;
    _b = _skillv select _forEachIndex;
    { _x setSkill [_a, _b]; true } count _units;
} forEach _skillt;
