/*
	author: Martin
	description:
	  Runs the revive actions on an injured player without
	  having to go through all the actions etc.

	  These just comes from completed handler of fn_revive.sqf

	returns: nothing
*/

params ["_injured"];

if !(isPlayer _injured) exitWith {};

// Remove any effects
_injured setVariable ["ais_unconscious", false, true];
_injured setVariable ["ais_hasHelper", ObjNull, true];
call AIS_Effects_fnc_garbage;

// Do the healing
if (AIS_REVIVE_HEAL) then {
    _injured setDamage 0;
    _injured setVariable ["ais_fireDamage", 0];
} else {
    // make sure the unit can walk after revive
    if ((_injured getHitIndex 10) > 0.49) then {
        [{(_this select 0) setHitIndex [10, 0.49]}, [_injured]] call AIS_Core_fnc_onNextFrame;
    };
};

// Give unit their FAKs back
[_injured] remoteExecCall ["AIS_System_fnc_restoreFaks", _injured, false];

// update network
_injured stop false;
{_injured enableAI _x; nil} count ["MOVE","TARGET","AUTOTARGET","ANIM","AUTOCOMBAT"];
[_injured, false] remoteExecCall ["AIS_System_fnc_unconcsiousRemote", 0, false];
[_injured, false] remoteExec ["setCaptive", 0, false];

// remove Handlers
["GetOutMan"] remoteExec ["removeAllEventHandlers", _injured, false];