/*
 * Author: Psycho
 
 * Set the unit in unconcsious state. This is a public function.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	Nothing
	
* Exapmle:
	[player] call LRG_AIS_System_fnc_setUnconscious;
 */


params ["_unit"];

if (time <= 0) exitWith {
	[
		{time > 0},
		{_this call LRG_AIS_System_fnc_setUnconscious},
		[_unit]
	] call LRG_AIS_Core_fnc_waitUntilAndExecute;
};

if (isPlayer _unit) then {
	[_unit] call LRG_AIS_System_fnc_unconsciousPlayer
} else {
	[_unit] call LRG_AIS_System_fnc_unconsciousAI
};


true