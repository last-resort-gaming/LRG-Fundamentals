params [
	"_SafeZoneSize",
  	"_SafeZoneDuration",
	"_SafeZoneLocation"
];

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

