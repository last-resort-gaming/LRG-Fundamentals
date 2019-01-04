params [
    ["_logic",objNull,[objNull]],
    ["_groups",[],[[]]],
    "_localGroups",
    "_logic",
    ["_SafeZoneEnable", true],
	["_SafeZoneSize", 150],
	["_SafeZoneDuration", -1]
];

//if (hasInterface && !isServer) exitWith {};

//_localGroups = _groups select { local _x };

//if (_localGroups isEqualTo []) exitWith {};

SafeZoneEnable = _logic getVariable ["SafeZoneEnable", "0"];
SafeZoneSize = _logic getVariable ["SafeZoneSize", "0"];
SafeZoneDuration = _logic getVariable ["SafeZoneDuration", "1"];
SafeZoneLocation = (getPos _logic);


// Client Actions

	_handle = [
		{
		
	  		_SafeZoneEH = player getVariable ["SafeZoneEH", nil];
	
			if !(_SafeZoneEnable) exitwith {
				if !(isNil "_SafeZoneEH") then {
					player removeAllEventHandlers "FiredMan";
					player setVariable ["SafeZoneEH", nil];
				};
			};

			if !(isNil "_SafeZoneEH") exitwith {};

			_SafeZoneEH = player addEventHandler[
				"FiredMan", {
			    	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_mag", "_projectile", "_veh"];

				    if (_weapon in ["CMFlareLauncher", "CMFlareLauncher_Singles", "CMFlareLauncher_Triples","UK3CB_BAF_CMFlareLauncher","UK3CB_BAF_IRJammer","rhsusf_weap_CMFlareLauncher"])  exitWith {true};
				    if !(cameraOn isEqualTo (vehicle player)) exitWith {true};

				    _checkObject = [_veh, _unit] select isNull _veh;

					if (_checkObject distance2D SafeZoneLocation < SafeZoneSize) exitWith {
						deleteVehicle _projectile;
						hintC "Denied.";
						playSound "Denied"; 
					}
				}
			];

			player setVariable ["SafezoneEH", _SafeZoneEH];
		}, 60, []
	] call CBA_fnc_addPerFrameHandler;