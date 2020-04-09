/*
 * Author: psycho
 
 * Pull a injured out of a vehicle
 
 * Arguments:
	0: Unit (Object)
	1: Vehicle (Object)
 
 * Return value:
	-
*/

params ["_unit", "_vehicle"];

// get the wounded unit
private _crew = crew _vehicle;
private _injured = objNull;
{
	if (_x getVariable ["ais_unconscious", false]) exitWith {_injured = _x};
	true
} count _crew;

_injured setVariable ["ais_man_pullOut", true, true];

// move the wounded out of the vehicle
[[_injured, _vehicle, 0], {_this call LRG_AIS_System_fnc_moveCargoRemote}] remoteExec ["call"];

if (_injured call LRG_AIS_System_fnc_allowDrag) then {
	[{[(_this select 0), (_this select 1)] call LRG_AIS_System_fnc_drag}, [_unit,_injured]] call LRG_AIS_Core_fnc_onNextFrame;
};


true