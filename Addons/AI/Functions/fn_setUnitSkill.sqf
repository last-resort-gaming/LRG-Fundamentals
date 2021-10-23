/*
Function: LR_fnc_SetUnitSkill

Description:
	Set the given unit's skill level to the desired one.

Arguments:
	_target - The array of units or the group whose skill level we want to adjust <UNIT / ARRAY OF UNITS / GROUP>
    _skillLevel - The skill level which we want to set the units to <SCALAR>

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin & MitchJC
*/

if (!isserver) exitwith {};

params ["_target", ["_skillLevel", 2]];

private _skillt = [
    "aimingAccuracy",
    "aimingShake",
    "aimingSpeed",
    "commanding",
    "courage",
    "endurance",
    "general",
    "reloadSpeed",
    "spotDistance",
    "spotTime"
];

private _skillv = [
    (0.10 + random 0.20),
    (0.45 + random 0.30),
    (0.30 + random 0.20),
    1, 1, 1, 1,
    (0.50 + random 0.50),
    (0.40 + random 0.30),
    (0.20 + random 0.40)
];

if !(isNil "LRG_AI_AimingAccuracy") then {
    _skillv = [
        (LRG_AI_AimingAccuracy - 0.05 + random 0.1),
        (LRG_AI_AimingShake - 0.05 + random 0.1),
        (LRG_AI_AimingSpeed - 0.05 + random 0.1),
        (LRG_AI_Commanding),
        (LRG_AI_Courage), 1,
        (LRG_AI_General),
        (LRG_AI_ReloadSpeed - 0.1 + random 0.30),
        (LRG_AI_SpotDistance - 0.1 + random 0.15),
        (LRG_AI_SpotTime - 0.1 + random 0.15)
    ];
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
    {[_x, [_a, _b]] remoteExec ["setSkill", _x]; true } count _units;
} forEach _skillt;

if (side _target == civilian) then {
    {_x setSkill [courage, LRG_AI_CivCourage]; true } count _units;

    if (LRG_AI_CivFleeing) then {
        {
            [_x, 0] remoteExec ["allowFleeing", _x]; true
        } count _units;
    };
};