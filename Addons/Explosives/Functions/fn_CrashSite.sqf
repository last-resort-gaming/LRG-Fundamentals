/*
Function: LR_fnc_CrashSite

Description:
	Simulates an aircraft being shot down. Players are knocked unconscious and awake near the crash
	location, basically like Lost.

Arguments:
	_stage - Used to execute a specific part of this function. <STRING>
	_vehicle - Variable name of aircraft to be 'crashed'.  <OBJECT>
	_crashsite - Location of crash site. <OBJECT or ARRAY>
	_players - Returns players in _vehicle. <ARRAY>

Examples:
	(begin example)
		["", [CrashPlane, getPos crashSite]] call LR_fnc_crashSite;
		["", [MyPlane, [1234,4321,0]]] call LR_fnc_crashSite;
	(end)

Authors: MitchJC & Mokka
*/

if (!isServer) exitwith {};

params [["_stage", "init"], ["_args",[]]];

_args params ["_vehicle", "_crashSite", ["_players", []]];


switch (_stage) do {
	case "init": {

    	_players = [];

    	{
      		if (objectParent _x == _vehicle) then {
	        	_players pushBackUnique _x;
      		};
	    } forEach allPlayers;

    	fnc_blurEffects = {
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [8];
			"dynamicBlur" ppEffectCommit 0;
			"dynamicBlur" ppEffectAdjust [0.0];
			"dynamicBlur" ppEffectCommit 20;
    	};

     	fnc_Black_In = {
 			1 cutText ["","BLACK IN", 10];
 		};

     	fnc_Black_Out = {
 			1 cutText ["","BLACK OUT", 5];
 		};

		publicVariable "fnc_Black_Out";
   		publicVariable "fnc_Black_In";
    	publicVariable "fnc_blurEffects";

	    {
	      "Aircraft_alarm" remoteExec ["playSound", _x];
	    } forEach _players;

		[
			{
				["fadeOut", _this] call LR_fnc_crashSite;
			}, [_vehicle, _crashSite, _players], 2
		] call CBA_fnc_waitAndExecute;
	};

	case "fadeOut": {
		if (isEngineOn _vehicle) then {
      		[_vehicle, false] remoteExec ["engineOn", _vehicle];
		};

		{
			remoteExecCall ["fnc_Black_Out", _x];
			[true] remoteExec ["disableUserInput", _x];
    	} forEach _players;

		[
			{
				["fadeSound", _this] call LR_fnc_crashSite;
			}, _args, 9
		] call CBA_fnc_waitAndExecute;
	};

	case "fadeSound": {
    	{
    		[2, 0] remoteExec ["fadeSound", _x];
    	  	moveOut _x;
    	} forEach _players;

    	[
    	  	{
    	    	["teleport", _this] call LR_fnc_crashSite;
    	  	}, _args, 2
    	] call CBA_fnc_waitAndExecute;
	};

  	case "teleport": {
    	{
    		// https://community.bistudio.com/wiki/vectorAdd
      		_randomPos = _crashSite vectorAdd [random 300, random 300, 0];

        	// preliminary shit, test if people lose their stuff or no
        	_x action ["Eject", _vehicle];
//	        _x setVelocity [0, 0, 0];
        	[false] remoteExec ["allowDamage", _x];
        	_x setPos _randomPos;
      	} forEach _players;

      	[
      		{
      	    	["woundAndEnable", _this] call LR_fnc_crashSite;
      	  	}, _args, 1
      	] call CBA_fnc_waitAndExecute;
  	};

  	case "woundAndEnable": {
		_bodyParts = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
		_injuryTypes = ["bullet", "vehiclecrash"];

    	{
			[true] remoteExec ["allowDamage", _x];
			[false] remoteExec ["disableUserInput", _x];
			[_x, "AidlPpneMstpSnonWnonDnon_AI"] remoteExec ["switchMove", _x];
			[objnull, _x] remoteExecCall ["ACE_medical_fnc_treatmentAdvanced_fullHealLocal", _x];

			for "_i" from 0 to (1+ random 4) do {
				[_x, 0.2, selectRandom _bodyParts, selectRandom _injuryTypes] remoteExecCall ["ace_medical_fnc_addDamageToUnit",0];
			};
    	} forEach _players;

    	[
    	  	{
    	    	["effects", _this] call LR_fnc_crashSite;
    	  	}, _args, 3
    	] call CBA_fnc_waitAndExecute;
  	};

  	case "effects": {
		skipTime 2;

    	{
			remoteExec ["fnc_blurEffects", _x];
			remoteExecCall ["fnc_Black_In", _x];
	    	[10, 1] remoteExec ["fadeSound", _x];
    	} forEach _players;

    	[
      		{
        		["finish", _this] call LR_fnc_crashSite;
	      	}, _args, 1
    	] call CBA_fnc_waitAndExecute;
	};

  	case "finish": {
    	deleteVehicle _vehicle;
  	};

	default {
		["init", _args] call LR_fnc_crashSite;
	};
};