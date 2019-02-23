/*
	LRG MISSION TEMPLATE
	RespawnOnStartPosition.sqf
	Author: MitchJC
	Description: Scripts executed when a player respawns.
*/
	player disableConversation true;
	[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];
	
	call LR_fnc_PlayerAddActions;
	
	{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;


if (isNil { player getVariable "StartingPos"; } ) then {
    player setVariable ["StartingPos", getPosATL player];
    player setVariable ["StartingDir", getDir player];
} else {
    player setPosATL (player getVariable ["StartingPos", getPosATL player]);
    player setDir (player getVariable ["StartingDir", 0]);
};

// YAINA Earplugs

private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_Earplugs = uiNamespace getVariable ["LRG_Main_Earplugs", false];
if (not _LRG_Main_Earplugs) exitWith{};
if (!hasInterface) exitwith {};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

[] execVM "z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\earplugs.sqf";