/*
Function: LR_Missions_fnc_startSandstorm01

Description:
	Starts the first part of Op Sandstorm.

Parameters:
	None

Return Values:
	Nothing

Examples:
    Nothing to see here.

Author:
	Mokka
*/

#define TRACE(x) systemChat format ["%1: %2", #x, x]; diag_log format ["%1: %2", #x, x]

#define PLAYER_START_MARKER "S1"
#define DEST_MARKER "S2"
#define RADIUS 200

fnc_blurEffects = {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [8];
	"dynamicBlur" ppEffectCommit (_this select 0);
	if ((_this select 1) < 0) exitWith {};
	"dynamicBlur" ppEffectAdjust [0.0];
	[
		{
			"dynamicBlur" ppEffectCommit _this;
		},
		(_this select 1),
		(_this select 0)
	] call CBA_fnc_waitAndExecute;
};

fnc_Black_In = {
	1 cutText ["","BLACK IN", 10];
};

fnc_Black_Out = {
	1 cutText ["","BLACK OUT", 5];
};

fnc_camShake = {
	enableCamShake true;
	setCamShakeParams [0.1, 1, 1, 1, true];
	addCamShake[10, 15, 10];
};

publicVariable "fnc_Black_Out";
publicVariable "fnc_Black_In";
publicVariable "fnc_blurEffects";
publicVariable "fnc_camShake";

// Run on server
if (!isServer) exitWith {
	remoteExec ["LR_Missions_startSandstorm01", 2];
};

systemChat "Starting up"; //Debug

// Base path for the explosive shell sounds (1-8)
_shellSoundBasePath = "a3\sounds_f\weapons\Explosion\expl_shell_%1.wss";

// Get the position of the start compound
_compoundPos = getMarkerPos PLAYER_START_MARKER;

// Play the prayer sound
[_compoundPos, "CallToPrayer", 250, 1] call LR_fnc_Sound3DFromPos;

// Wait 16 seconds after the call kicks in and spawn the explosion sounds and
// apply the fancy post-processing
[
	{
		params ["_shellSoundBasePath", "_compoundPos"];

		systemChat "Spawning explosions"; //Debug

		// Spawn some explosions around the players.
		_nrOfExpl = (floor (random 5)) + 5;

		for "_i" from 0 to _nrOfExpl do {

			// Select an explosion sound
			_explSound = format [_shellSoundBasePath, (floor (random 7) + 1)];

			// Get a position somewhere around the compound position
			// Get a random angle
			_explAngle = random 360;

			// Get a random distance between 50 and 200 metres away from the
			// marker position
			_explDistance = 50 + floor (random 150);

			// Now get the position
			// x = distance * cos(angle) + x0
			_explPosX = _explDistance * (cos _explAngle) + (_compoundPos select 0);

			// y = distance * sin(angle) + y0
			_explPosY = _explDistance * (sin _explAngle) + (_compoundPos select 1);

			// On ground
			_explPosZ = 0;

			_explPos = [_explPosX, _explPosY, _explPosZ];

			// Wait some random time if this isn't the first explosion
			_explWait = random 12;

			if (_i == 0) then {
				_explWait = 0;
			};

			[
				{
					TRACE(_this); // Debug
					_this remoteExec ["playSound3D", 0];
					_strength = random 5;
					[_strength] remoteExec ["ace_hearing_fnc_earRinging", 0];
				},
				[_explSound, objNull, false, _explPos],
				_explWait
			] call CBA_fnc_waitAndExecute;
		};

		// Apply Post-Processing to all players
		[
			{
				systemChat "Adding cam shake"; //Debug
				// Cam shake and blur
				remoteExec ["fnc_camShake", 0];
				[15, -1] remoteExec ["fnc_blurEffects", 0];
			},
			[],
			1
		] call CBA_fnc_waitAndExecute;

		// Fade sound and black out
		[
			{
				systemChat "Fade sound and black out"; //Debug
				remoteExecCall ["fnc_Black_Out", 0];
				[true] remoteExec ["disableUserInput", 0];
				[2, 0] remoteExec ["fadeSound", 0];
			},
			[],
			6+3
		] call CBA_fnc_waitAndExecute;

		// Teleport all players
		[
			{
				systemChat "Teleporting"; //Debug
				{
					// Get random position somewhere around the destination marker
					_destDist = random RADIUS;

					// Get random direction
					_destAngle = random 360;

					// Get centre pos
					_centrePos = getMarkerPos DEST_MARKER;

					// Destination Pos X
					// x = distance * cos(angle) + x0
					_destPosX = _destDist * cos(_destAngle) + (_centrePos select 0);

					// Destination Pos Y
					// y = distance * sin(angle) + y0
					_destPosY = _destDist * sin(_destAngle) + (_centrePos select 1);

					_x setPos [_destPosX, _destPosY];
				} forEach allPlayers;
			},
			[],
			12+3
		] call CBA_fnc_waitAndExecute;

		// Fade in and stuff
		[
			{
				systemChat "Fading in"; //Debug

				{
					[_x, "AidlPpneMstpSnonWnonDnon_AI"] remoteExec ["switchMove", _x];
					[objnull, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHealLocal", _x];
				} forEach allPlayers;

				[0, 20] remoteExec ["fnc_blurEffects", 0];
				[false] remoteExec ["disableUserInput", 0];
				remoteExecCall ["fnc_Black_In", 0];
	    		[10, 1] remoteExec ["fadeSound", 0];
			},
			[],
			14+3
		] call CBA_fnc_waitAndExecute;
	},
	[_shellSoundBasePath, _compoundPos],
	16
] call CBA_fnc_waitAndExecute;



