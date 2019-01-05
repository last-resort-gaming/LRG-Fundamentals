params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic"
];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

_SafeZoneEnable = _logic getVariable ["SafeZoneEnable", "0"];
_SafeZoneSize = _logic getVariable ["SafeZoneSize", "150"];
_SafeZoneDuration = _logic getVariable ["SafeZoneDuration", "-1"];
_SafeZoneLocation = (getPos _logic);

if (!hasinterface) exitwith {};

If !(_SafeZoneEnable) exitwith {};

// Compile code from boilerplate string with the applicable values (pos, area) hardcoded by replacing the %x
_ehCode = compileFinal format [
  "params [""_unit"", ""_weapon"", ""_muzzle"", ""_mode"", ""_ammo"", ""_mag"", ""_projectile"", ""_veh""];
	if (_weapon in [""CMFlareLauncher"", ""CMFlareLauncher_Singles"", ""CMFlareLauncher_Triples"",""UK3CB_BAF_CMFlareLauncher"",""UK3CB_BAF_IRJammer"",""rhsusf_weap_CMFlareLauncher""])  exitWith {true};
	if !(cameraOn isEqualTo (vehicle player)) exitWith {true};
	_checkObject = [_veh, _unit] select isNull _veh;
	if (_checkObject distance2D %1 < %2) exitWith {
		deleteVehicle _projectile;
		hintC ""Denied."";
		playSound ""Denied""; 
	}",
  _SafeZoneLocation,
  _SafeZoneSize
];

// Just use this code in the eh
_SafeZoneEHID = player addEventHandler [
  "FiredMan", _ehCode
];