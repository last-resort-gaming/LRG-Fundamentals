/*
	LRG MISSION TEMPLATE
	fn_PlayerAddActions.sqf
	Author: MitchJC
	Description: Includes AddActions for players. Also called on respawn.
*/

if ((!hasInterface) || !(player getUnitTrait "Mission Maker")) exitwith {};
	
[player,
"<t color='#27e833'>Mission Complete</t>",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsUp_ca.paa",
"true",
"true",
{ hint "You're Completing the Mission." },
{},
{"EveryoneWon" remoteExec ["BIS_fnc_endMissionServer", 2];},
{ hint "You've Cancelled Mission Completion." },
[],
5,
-96,
true,
false] call BIS_fnc_holdActionAdd;

[player,
"<t color='#cc3232'>Mission Failed</t>",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsDown_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsDown_ca.paa",
"true",
"true",
{ hint "You're Failing the Mission." },
{},
{"EveryoneLost" remoteExec ["BIS_fnc_endMissionServer", 2];},
{ hint "You've Cancelled Mission Failure." },
[],
5,
-96,
true,
false] call BIS_fnc_holdActionAdd;