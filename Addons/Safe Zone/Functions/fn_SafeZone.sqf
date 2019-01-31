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
private _SafeZoneEHID = player addEventHandler [
  "FiredMan", _ehCode
];


// SafeZone Duration Check

  [{
		params ["_args", "_pfhID"];
		_args params ["_SafeZoneDuration", "_SafeZoneEHID"];

		if (_SafeZoneDuration isEqualTo 0) then {[_pfhID] call CBA_fnc_removePerFrameHandler;} else {
			if (servertime > (_SafeZoneDuration * 60)) then {
						player removeEventHandler ["FiredMan", _SafeZoneEHID];
						[_pfhID] call CBA_fnc_removePerFrameHandler;
			};
		};
  }, 60, [_SafeZoneDuration, _SafeZoneEHID]] call CBA_fnc_addPerFrameHandler;