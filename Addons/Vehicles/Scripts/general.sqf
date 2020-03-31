/*
Function: general.sqf

Description:
	Script to service general vehicles (except UAVs).

Arguments:
	_kind - Base class name of the vehicle to service
    _veh - The vehicle to service
    _serviceTime - Time in seconds to service the vehicle for
    _serviceRand - Random delay for the servicing duration
    _sideChat - Announce servicing of vehicle in the side chat
    _allowAny - Allow anyone in the vehicle to initiate servicing
    _playerDistance - Players have to stay within this distance for servicing to continue

Return Values:
	Nothing

Examples:
    Nothing to see here.

Author:
	Mokka
*/

params [
    "_kind",
    "_veh",
    ["_serviceTime", 60],
    ["_serviceRand", 30],
    ["_sideChat", true],
    ["_allowAny", false],
    ["_playerDistance", 0]
];

if (isNil "_veh") exitWith {};
if (isNull _veh)  exitWith {};

if(_veh isKindOf _kind && !(_veh isKindOf "UAV")) then {

    if !(_allowAny || (driver _veh isEqualTo player)) exitWith {};

	_type = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "DisplayName");

    _msg = format ["Servicing %1, This will take at least %2", _type, _serviceTime call YAINA_F_fnc_formatDuration];

    if(_sideChat) then {
        _veh sideChat _msg;
    } else {
        systemChat _msg;
    };

    _veh setFuel 0;

    sleep _serviceTime + (floor random _serviceRand);

    // Handle player distance
    if (_playerDistance > 0 && _veh distance2D player > _playerDistance) exitWith {
        _msg = format ["Servicing Failed for %1, no longer in range", _type];
        if(_sideChat) then {
            _veh sideChat _msg;
        } else {
            systemChat _msg;
        };
    };

    _veh setDamage 0;
    _veh setFuel 1;
    _veh setVehicleAmmo 1;

    _veh engineOn false;

    _msg = format ["%1 is now ready", _type];
    if(_sideChat) then {
        _veh sideChat _msg;
    } else {
        systemChat _msg;
    }
};