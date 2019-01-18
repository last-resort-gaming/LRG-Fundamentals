/*
	LRG MISSION TEMPLATE
	OnPlayerRespawn.sqf
	Author: MitchJC
	Description: Scripts executed when a player respawns.
*/
	player disableConversation true;
	[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];
	
	call LR_fnc_PlayerAddActions;
	
	{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;
	
	if !(isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		[] execVM "scripts\earplugs.sqf";
		player enableFatigue false;
	};


if (isNil { player getVariable "StartingPos"; } ) then {
    player setVariable ["StartingPos", getPosATL player];
    player setVariable ["StartingDir", getDir player];
} else {
    player setPosATL (player getVariable ["StartingPos", getPosATL player]);
    player setDir (player getVariable ["StartingDir", 0]);
};