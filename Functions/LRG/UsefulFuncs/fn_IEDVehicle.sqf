/*
Function: LR_fnc_IEDVehicle

Description:
	Sets up a given vehicle as a driven IED. The explosive will be armed and
	primed for detonation if any player comes within the given radius.
	The explosives will detonate roughly after the time given has passed.
	The detonation may also produce smaller secondary detonations. 
	
	If _announce is set to true, an announcement will be made on the sideChat 
	once the IED has been armed, indicating the approximate time until 
	detonation and when it is about to detonate. 
	
	Additionally, you can set the _announceInterval parameter to enable 
	occasional announcements about the time left until detonation.

	The armed IED vehicle can be disarmed through a mouse-wheel action.  
	Once disarmed it cannot be primed again.

Parameters:
	_vehicle - The vehicle which shall be initialized
	_detonationTime - The time in seconds after which the explosives will go off once armed
	_proximityRadius - The IED will be armed if any player comes closer to the vehicle than this radius (in metres)
	_secondaries - Set to true to have the detonation of the IED also produce a random amount of secondary explosions around the main detonation
	_announce - Set to true to enable announcements about the state of the IED
	_announceInterval - The interval in seconds in which players should be informed about the time left

Return Values:
	None

Examples:
    --- Code
	// In the init field of a vehicle in the editor (e.g. a Truck)
	[
		this,
		120,
		20,
		true,
		true,
		30
	] call LR_fnc_IEDVehicle;
	---

Author:
	Mokka
*/

params [
	["_vehicle", objNull],
	["_detonationTime", 120],
	["_proximityRadius", 20],
	["_secondaries", true],
	["_announce", true],
	["_announceInterval", 30]
];

if (!isServer) exitWith {};

// Check if we are using a valid vehicle.
if (not (_vehicle isKindOf "LandVehicle")) exitWith {
	systemChat "LR_fnc_IEDVehicle: Invalid vehicle passed, needs to be a land vehicle!";
	};

// Add PFH for proximity checking
[
	{
		(_this select 0) params ["_vehicle", "_proximityRadius", "_detonationTime", "_announce"];
		_armed = _vehicle getVariable ["IEDarmed", false];
		_disarmed = _vehicle getVariable ["IEDdisarmed", false];
		{
			if ((_vehicle distance2D _x) < _proximityRadius && (not _disarmed) && (not _armed)) then {
				_vehicle setVariable ["IEDarmed", true];

				if (_announce) then {
					// Tell everyone that this is a thing that happened if the user so wishes:
					[
						format ["<t color='#cc3232' size = '.5'>The IED has been armed and will detonate in %1 seconds!</t>",_detonationTime],
						-1,0.8,5,2,0,789
					] remoteExec ["BIS_fnc_dynamicText", 0];
				};
			};
		} forEach allPlayers;
	},
	5,
	[_vehicle, _proximityRadius, _detonationTime, _announce]
] call CBA_fnc_addPerFrameHandler;

// Add PFH to check for explosives armed
[
	{
		(_this select 0) params ["_vehicle", "_detonationTime", "_secondaries", "_announce", "_announceInterval"];

		_armed = _vehicle getVariable ["IEDarmed", false];
		_disarmed = _vehicle getVariable ["IEDdisarmed", false];
		_destroyed = _vehicle getVariable ["IEDdetonated",false];

		if ((not _armed) || _disarmed || _destroyed) exitWith {};

		_startTime = _vehicle getVariable ["startTime", 0];

		if (_startTime == 0) then {
			_startTime = time;
			_vehicle setVariable ["startTime",_startTime];
		};

		// Delta time since the IED has been armed
		_deltaTime = time - _startTime;

		// Calculate time left until detonation
		_timeLeft = floor (_detonationTime - _deltaTime);

		if ((_announce) 
			&& (_announceInterval > 0)
			&& (_timeLeft % _announceInterval) == 0 
			&& (not (_timeLeft == _detonationTime)) 
			&& (_timeLeft != 0)) then {
			[
				format ["<t color='#cc3232' size = '.5'>The IED will detonate in %1 seconds!</t>",_timeLeft],
				-1,0.8,5,2,0,789
			] remoteExec ["BIS_fnc_dynamicText", 0];
		};

		// If the delta of startTime and current time exceeds the detonation timer,
		// we blow the vehicle up!
		// We do this check every frame since we want to be able to disarm the bomb.
		if (_timeLeft <= 5) then {

			_vehicle setVariable ["IEDdetonated", true, true];

			if (_announce) then {
				[
					"<t color='#cc3232' size = '.5'>Time's out, the IED could detonate any second!</t>",
					-1,0.8,5,2,0,789
				] remoteExec ["BIS_fnc_dynamicText", 0];
			};

			// Set the amount of secondary explosions according to the param.
			if (_secondaries) then {
				_secArray = [ceil (random 8), random 10, random 8];
			} else {
				_secArray = [0, 0, 0];
			};

			// Detonate using LR_fnc_SpawnExplosives.
			[
				_timeLeft + (random 2) - 1,
				position _vehicle,
				_secArray,
				"R_TBG32V_F"							// This is an AP rocket warhead, bound to do some damage.
			] call LR_fnc_SpawnExplosives;
		};
	},
	1,
	[_vehicle, _detonationTime, _secondaries, _announce, _announceInterval]
] call CBA_fnc_addPerFrameHandler;

// Add a holdAction for disarming the bomb.
[
	 _vehicle
	,"Disarm IED"
	,"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa"
	,"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa"
	,"isplayer _this 
	&& {_this distance _target < 5} 
	&& {_target getVariable [""IEDarmed"",false]} 
	&& {not (_target getVariable [""IEDdetonated"",false])}"
	,"true"
	,{ ["<t color='#FFBB00' size = '.5'>You're disarming the IED.</t>",-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;}
	,{}
	,{ 	
		(_this select 0) setvariable ["IEDdisarmed", true, true];
		["<t color='#339900' size = '.5'>You've disarmed the IED.</t>",-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;
	},
	{["<t color='#cc3232' size = '.5'>You've stopped disarming the IED.</t>",-1,0.8,5,2,0,789] spawn BIS_fnc_dynamicText;}
	,[]
	,random [5, 7.5, 10]
	,-92
	,true
	,false
] remoteExec ["BIS_fnc_holdActionAdd", 0, true];