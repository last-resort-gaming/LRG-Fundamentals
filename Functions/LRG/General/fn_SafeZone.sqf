/*
	LRG MISSION TEMPLATE
	fn_SafeZone.sqf
	Author: MitchJC, Flare exceptions by MartinCo
	Description: Prevents players from using weapons within safezoneArea of "respawn_west."
*/


if !(safezoneEnabled) exitwith {};

SafeZonePosition = (getMarkerPos "BASE");

	
_handle = [
{
  
  _SafeZoneEH = player getVariable ["SafeZoneEH", nil];
  
	if !(safezoneEnabled) exitwith {
		if !(isNil "_SafeZoneEH") then {
		player removeAllEventHandlers "FiredMan";
		player setVariable ["SafeZoneEH", nil];
		};
	};
	
	if !(isNil "_SafeZoneEH") exitwith {};

	_SafeZoneEH = player addEventHandler["FiredMan", {
    params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_mag", "_projectile", "_veh"];

    if (_weapon in ["CMFlareLauncher", "CMFlareLauncher_Singles", "CMFlareLauncher_Triples","UK3CB_BAF_CMFlareLauncher","UK3CB_BAF_IRJammer","rhsusf_weap_CMFlareLauncher"])  exitWith {true};
    if !(cameraOn isEqualTo (vehicle player)) exitWith {true};

    _checkObject = [_veh, _unit] select isNull _veh;
	
	if (_checkObject distance2D SafeZonePosition < safezoneArea) exitWith {
		deleteVehicle _projectile;
		hintC "Denied.";
	
	}}];
  
  player setVariable ["SafezoneEH", _SafeZoneEH];
	
}, 60, []] call CBA_fnc_addPerFrameHandler;
	
	