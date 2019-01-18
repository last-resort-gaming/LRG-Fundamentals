/*
 * Author: Psycho
 
 * Re-initialize a respawned unit.
 
 * Arguments:
	0: Unit (Object)
	1: Corpse (Object)
 
 * Return value:
	-
*/

params ["_unit", "_corpse"];

// Restore Loadout ?
if (AIS_RESTORE_LOADOUT) then {
    _loadout = _unit getVariable "AIS_RespawnLoadout";
    if !(isNil "_loadout") then {
        _unit setUnitLoadout _loadout;

        // If we respawned from unconsious, then we'll need to restore FAKs
        _unit call AIS_System_fnc_restoreFaks;
    };
};

_unit setVariable ["ais_unconscious", false, true];
_unit setVariable ["ais_stabilized", false, true];
_unit setVariable ["ais_fireDamage", 0];
_unit setVariable ["AIS_UnitIsDead", false];
_unit setVariable ["AIS_MedicalStore", nil, true];
_unit setCaptive false;

if (isPlayer _unit) then {
	if (local player) then {showHud true};
	if (AIS_TOGGLE_RADIO) then {
		[true] call AIS_Effects_fnc_toggleRadio;
	};
} else {
	_unit stop false;
	{_unit enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM"];
};