/*
	author: Martin
	description: none
	returns: nothing
*/

params ["_veh", ["_serviceTime", 60], ["_serviceRand", 30], ["_sideChat", true], ["_playerDistance", 0]];

if (isNil "_veh") exitWith {};
if (isNull _veh)  exitWith {};

if(_veh isKindOf "UAV") then {

	_type = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "DisplayName");

    _msg = format ["Servicing %1, This will tafke at least %2", _type, _serviceTime call YAINA_fnc_formatDuration];
    if(_sideChat) then {
        _veh sideChat _msg;
    } else {
        systemChat _msg;
    };

    // First we remove any extra waypoints since if we don't it may
    // try and start running away and set the last one to ourselves.
    while {(count (waypoints _veh)) > 1} do {
        deleteWaypoint ((waypoints _veh) select 0);
    };
    ((waypoints _veh) select 0) setWPPos position _veh;

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
    };

};