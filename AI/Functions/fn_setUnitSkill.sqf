/*
Function: LR_fnc_SetUnitSkill

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
	Martin & MitchJC
*/

if (!isserver) exitwith {};

params ["_target", ["_skillLevel", 2]];

private _skillt = ["aimingAccuracy", "aimingShake", "aimingSpeed", "commanding", "courage", "endurance", "general", "reloadSpeed", "spotDistance", "spotTime"];
private _skillv = [(0.10 + random 0.20), (0.45 + random 0.30),(0.30 + random 0.20), 1, 1, 1, 1, (0.50 + random 0.50), (0.40 + random 0.30), (0.20 + random 0.40)];

if !(isNil "LRGaimingAccuracy") then {
    _skillv = [(LRGaimingAccuracy + random 0.20), (LRGaimingShake + random 0.20),(LRGaimingSpeed + random 0.20), (LRGcommanding), (LRGcourage), 1, (LRGgeneral), (LRGreloadSpeed + random 0.50), (LRGspotDistance + random 0.30), (LRGspotTime + random 0.40)];
};

 
    {
        if (_x < 0) then {_x = 0 };
        if (_x > 1) then {_x = 1 };
        } foreach _skillv;
        
private _units = call {
    if ((typeName _target) isEqualTo "GROUP") exitWith { units _target };
    if ((typeName _target) isEqualTo "ARRAY") exitWith { _target };
    [_target];
};

{
    _a = _x;
    _b = _skillv select _forEachIndex;
    {_x setSkill [_a, _b]; true } count _units;
} forEach _skillt;
