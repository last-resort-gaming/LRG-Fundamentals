/*
 * Author: Psycho
 
 * give back the last damage of the specific body part
 
 * Arguments:
	0: Unit (Object)
	1: hitPartIndex (Number)
 
 * Return value:
	damage
 */

params ["_unit", "_hitPartIndex"];

_return_part_damage = [damage _unit, _unit getHitIndex _hitPartIndex] select (_hitPartIndex >= 0);

if (AIS_REVIVE_GUARANTY) then {
    _return_part_damage = _return_part_damage min 0.89;
};

_return_part_damage