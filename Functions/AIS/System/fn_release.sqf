/*
 * Author: Psycho
 
 * Stop to drag another unit.
 
 * Arguments:
	0: Unit (Object)
 
 * Return value:
	-
*/

params ["_unit"];
private _target = _unit getVariable "ais_DragDrop_Torso";
private _pos = getPosATL _target;

_unit setVariable ["ais_DragDrop_Torso", objNull];
_target setVariable ["ais_DragDrop_Player", objNull, true];
_unit setVariable ["ais_CarryDrop_Torso", false];

_target setVariable ["ais_hasHelper", objNull, true];
_unit playAction "released";

detach _unit;
detach _target;

if (alive _target) then {
	[_target, "AinjPpneMstpSnonWrflDb_release"] remoteExec ["switchMove", 0];

	// We need to place the target just above the surface, otherwise they'll clip through and
	// fall to the floor below etc. therefore, we set the veritcal component to that of the healer
	// to whom the target was previously attached as they are already at surface level
	_pos set [2, (getPosATL _unit select 2) + 0.05];
	_target setPosATL _pos;
};


true