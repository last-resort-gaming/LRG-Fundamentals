/*
Function: general

Description:
    Service on general vehicles.

Arguments:
    _kind - Class name of the vehicle to service <STRING>
    _veh - The vehicle to service <OBJECT>
    _serviceTime - Time in seconds that it takes for the service to be completed <SCALAR>
    _serviceRand - Additional random amount of time to add to the service time <SCALAR>
    _sideChat - Announce servicing in the sideChat? <BOOLEAN>
    _allowAny - Allow anyone in the vehicle to service? <BOOLEAN>

Return Value:
    None

Example:
    Nothing to see here

Author: Martin
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

    _msg = format ["Servicing %1, This will take at least %2", _type, _serviceTime call YAINA_fnc_formatDuration];

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