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
#define RADIUS 50

// Run on server
if (!isServer) exitWith {
	remoteExec ["LR_Missions_startSandstorm01", 2];
};

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
	addCamShake[5, 25, 10];
};

fnc_playSound = {
	playSound3D [_this, player];
};

publicVariable "fnc_Black_Out";
publicVariable "fnc_Black_In";
publicVariable "fnc_blurEffects";
publicVariable "fnc_camShake";
publicVariable "fnc_playSound";

// systemChat "Starting up"; //Debug

// Base path for the explosive shell sounds (1-8)
// TODO: find better sounds
_shellSoundBasePath = "a3\sounds_f\weapons\Explosion\expl_shell_%1.wss";

// Get the position of the start compound
_compoundPos = getMarkerPos PLAYER_START_MARKER;

// Play the prayer sound
[_compoundPos, "CallToPrayer", 250, 1, 4] call LR_fnc_Sound3DFromPos;

// Wait 16 seconds after the call kicks in and spawn the explosion sounds and
// apply the fancy post-processing
[
	{
		params ["_shellSoundBasePath", "_compoundPos"];

		// systemChat "Spawning explosions"; //Debug

		// Spawn some explosions around the players.
		_nrOfExpl = (floor (random 7)) + 7;

		for "_i" from 0 to _nrOfExpl do {

			// Select an explosion sound
			_explSound = format [_shellSoundBasePath, (floor (random 7) + 1)];

			// Wait some random time if this isn't the first explosion
			_explWait = random 12;

			if (_i == 0) then {
				_explWait = 0;
			};

			[
				{
					// TRACE(_this); // Debug
					{
						_this remoteExec ["fnc_playSound", _x];
						_strength = random 1 + 0.4;
						[_strength] remoteExec ["ace_hearing_fnc_earRinging", _x];
					} forEach allPlayers;
				},
				_explSound,
				_explWait
			] call CBA_fnc_waitAndExecute;
		};

		// Apply Post-Processing to all players
		[
			{
				// systemChat "Adding cam shake"; //Debug
				// Cam shake and blur
				remoteExec ["fnc_camShake", 0];
				[7, -1] remoteExec ["fnc_blurEffects", 0];
			},
			[],
			1
		] call CBA_fnc_waitAndExecute;

		// Fade sound and black out
		[
			{
				// systemChat "Fade sound and black out"; //Debug
				remoteExecCall ["fnc_Black_Out", 0];
				[true] remoteExec ["disableUserInput", 0];
				[2, 0] remoteExec ["fadeSound", 0];
				[2, 0] remoteExec ["fadeMusic", 0];
			},
			[],
			6+3
		] call CBA_fnc_waitAndExecute;

		// Teleport all players
		[
			{
				// systemChat "Teleporting"; //Debug
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
				// systemChat "Fading in"; //Debug

				{
					[_x, "AidlPpneMstpSnonWnonDnon_AI"] remoteExec ["switchMove", _x];
				} forEach allPlayers;

				[0, 20] remoteExec ["fnc_blurEffects", 0];
				[false] remoteExec ["disableUserInput", 0];
				remoteExecCall ["fnc_Black_In", 0];
	    		[10, 1] remoteExec ["fadeSound", 0];
	    		[10, 1] remoteExec ["fadeMusic", 0];
			},
			[],
			14+3
		] call CBA_fnc_waitAndExecute;
	},
	[_shellSoundBasePath, _compoundPos],
	30
] call CBA_fnc_waitAndExecute;



