/*
Function: LR_fnc_makeIED

Description:
	Sets up a given object as an IED. The explosive will be armed and
	primed for detonation if any player comes within the given radius.
	The explosives will detonate roughly after the time given has passed.
	The detonation may also produce smaller secondary detonations. 

	If the time until detonation is a negative number (eg. -5), the actual time
	until detonation is randomised between 0 and that number, in our example a
	value somewhere between 0 and 5.
	
	If _announce is set to true, an announcement will be made once the IED has 
	been armed, indicating the approximate time until detonation and when it is 
	about to detonate. 
	
	Additionally, you can set the _announceInterval parameter to enable 
	occasional announcements about the time left until detonation.

	The armed IED can be disarmed through ACE interaction. If enabled, players
	also need to have a defusal kit on them in order to be able to disable the
	IED. Once disarmed it cannot be primed again.

	Note: ACE is absolutely necessary for using this function. Please use 
	LR_fnc_IEDVehicle for a vanilla alternative, restricted to land vehicles.

Parameters:
	_object - The object which shall be initialized as an IED
	_detonationTime - The time in seconds after which the explosives will go off once armed, negative for random time up to that value
	_proximityRadius - The IED will be armed if any player comes closer to the vehicle than this radius (in metres)
	_secondaries - Set to true to have the detonation of the IED also produce a random amount of secondary explosions around the main detonation
	_announce - Set to true to enable announcements about the state of the IED
	_announceInterval - The interval in seconds in which players should be informed about the time left
	_requireDefusalKit - Set to true to require players to have a defusal kit on them in order to defuse the IED

Return Values:
	None

Examples:
    --- Code
	// In the init field of an object in the editor (e.g. a Crate)
	[
		this,
		120,
		20,
		true,
		true,
		30,
		true
	] call LR_fnc_makeIED;
	---

Author:
	Mokka
*/

params [
	["_object", objNull],
	["_detonationTime", 120],
	["_proximityRadius", 20],
	["_secondaries", true],
	["_announce", true],
	["_announceInterval", 30],
	["_requireDefusalKit", true]
];

if (!isClass (configFile >> "CfgPatches" >> "ace_main")) exitWith {};

if (hasInterface && {
	(!(_object getVariable ["IEDdisarmed",false])) &&
	(!(_object getVariable ["IEDdetonated", false]))
}) then {
	_condition = [{
		((_this select 0) getVariable ["IEDarmed",false])
		&& {not ((_this select 0) getVariable ["IEDdetonated",false])}
		&& {not ((_this select 0) getVariable ["IEDdisarmed", false])}
	}, {
		((_this select 0) getVariable ["IEDarmed",false])
		&& {not ((_this select 0) getVariable ["IEDdetonated",false])}
		&& {not ((_this select 0) getVariable ["IEDdisarmed", false])}
		&& {[(_this select 1)] call ace_explosives_fnc_canDefuse}
	}] select (_requireDefusalKit);

	// Adds action to defuse the bomb
	_action = [
		"DefuseIED",
		"Defuse IED",
		"",
		{
			(_this select 0) setVariable ["IEDdisarmed", true, true];
			["You've disarmed the IED.", [-1, 0.8], "#339900", 0.5, false] call LR_fnc_dynamicText;
		},
		_condition
	] call ace_interact_menu_fnc_createAction;

	[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
};

if (!isServer) exitWith {};

// Randomise detonation time if param is negative
if (_detonationTime < 0) then {
	_detonationTime = random (abs _detonationTime);
};

// Create the physical explosive
_explosive = "ACE_Explosives_Place_SatchelCharge" createVehicle [0, 0, 0];
_pos = getPos _object;
_explosive setPos _pos;
_explosive attachTo [_object];
hideObjectGlobal _explosive;

// Add PFH for proximity checking
[
	{
		params ["_args","_pfhID"];
		_args params ["_object", "_proximityRadius", "_detonationTime", "_announce"];
		_armed = _object getVariable ["IEDarmed", false];
		_disarmed = _object getVariable ["IEDdisarmed", false];
		_destroyed = _object getVariable ["IEDdetonated",false];

		if (_disarmed || _destroyed) exitWith {
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};

		{
			if ((_object distance2D _x) < _proximityRadius && (not _disarmed) && (not _armed)) then {
				_object setVariable ["IEDarmed", true, true];

				// Tell everyone that this is a thing that happened if the user so wishes:
				if (_announce) then {
					[
						format ["The IED has been armed and will detonate in %1 seconds!",_detonationTime],
						[-1, 0.8],"#cc3232", 0.5, true
					] call LR_fnc_dynamicText;
				};
			};
		} forEach allPlayers;
	},
	1,
	[_object, _proximityRadius, _detonationTime, _announce]
] call CBA_fnc_addPerFrameHandler;

// Add PFH to check for explosives armed
[
	{
		params ["_args","_pfhID"];
		_args params ["_explosive", "_object", "_detonationTime", "_secondaries", "_announce", "_announceInterval"];

		_armed = _object getVariable ["IEDarmed", false];
		_disarmed = _object getVariable ["IEDdisarmed", false];
		_destroyed = _object getVariable ["IEDdetonated",false];

		if (_disarmed || _destroyed) exitWith {
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
		if ((not _armed)) exitWith {};

		_startTime = _object getVariable ["startTime", 0];

		if (_startTime == 0) then {
			_startTime = time;
			_object setVariable ["startTime",_startTime, true];
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
				format ["The IED will detonate in %1 seconds!",_timeLeft],
				[-1, 0.8], "#cc3232", 0.5, true
			] call LR_fnc_dynamicText;
		};

		// If the delta of startTime and current time exceeds the detonation timer,
		// we blow the vehicle up!
		// We do this check every frame since we want to be able to disarm the bomb.
		if (_timeLeft <= 3) then {

			_object setVariable ["IEDdetonated", true, true];

			if (_announce) then {
				[
					"Time's out, the IED could detonate any second!",
					[-1, 0.8], "#cc3232", 0.5, true
				] call LR_fnc_dynamicText;
			};

			_detIn = _timeLeft + random (3) - 1.5;

			[
				{
					params ["_object", "_secondaries"];
					_secArray = [0, 0, 0];

					// Set the amount of secondary explosions according to the param.
					if (_secondaries) then {
						_secArray = [(ceil (random 6) + 2), (random 4 + 1), (random 2 + 1)];
					};
					_pos = position _object;
					// Detonate using LR_fnc_SpawnExplosives.
					[
						0,
						_pos,
						_secArray,
						"R_TBG32V_F"
					] call LR_fnc_SpawnExplosives;

					_bomb = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (_pos);
					_bomb setDamage 1;
				}, [_object, _secondaries], (_detIn)
				
			] call CBA_fnc_waitAndExecute;
		};
	},
	1,
	[_explosive, _object, _detonationTime, _secondaries, _announce, _announceInterval]
] call CBA_fnc_addPerFrameHandler;