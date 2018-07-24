/*
Function: LR_fnc_SpawnExplosives

Description:
	Utility function for spawning explosions and secondaries on objects, 
	positions or objectives.

Parameters:
	_delay - The delay in seconds until the explosives go off
    _pos - The position of the objective about to blow up
    _sub - Array containing the following information: [Amount of Secondaries, Delay after Main Explosion, Radius around _pos]
    _method - The type of destruction we want, that is the type of exlosive (Default: Mortar round)

Return Values:
	None

Examples:
    Nothing to see here

Author:
	Martin (original: YAINA_..._fnc_destroy), 
    ported and adjusted by Mokka
*/

if !(isServer) exitWith {};

[{
    params [
		"_delay", 
		"_pos", 
		["_sub", [0, 10, 5]], 
		["_method", "Bo_mk82"]
	];

    // Bail if we are requested to
    if (!(isNil "_r") && { _r isEqualTo false }) exitWith {};

    _method createVehicle (_pos vectorAdd [0,0,0.5]);

    private _csleep = _sub select 1;
    private _nsleep = (_sub select 1) * 2;

    if ((_sub select 0) > 0) then {
        for "_x" from 2 to ((_sub select 0)+1) do {
            private _m = _x % 2;
            private _s = 0; if (_m isEqualTo 1) then { _s = 0.25 + (random 0.75); };
            [
				{ "SmallSecondary" createVehicle _this }, 
				[
					_pos, floor(_x / 2) * (_sub select 2), 
					random 360
				] call BIS_fnc_relPos, 
				_csleep + _s
			] call CBA_fnc_waitAndExecute;
			
            if (_m isEqualTo 1) then {
                _nsleep = _nsleep / 2;
                _csleep = _csleep + (_nsleep / 2);
            };
        };
    };

}, _this, _this select 0] call CBA_fnc_waitAndExecute;