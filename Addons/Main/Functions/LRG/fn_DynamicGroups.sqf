// not documented: postInit

private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_DynamicGroups = uiNamespace getVariable ["LRG_Main_DynamicGroups", false];
if (not _LRG_Main_DynamicGroups) exitWith{};

if (isserver) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
} else {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};