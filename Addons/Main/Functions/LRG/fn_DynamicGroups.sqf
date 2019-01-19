if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if (isNil "LRG_Main_DynamicGroups") exitwith {};
if (not LRG_Main_DynamicGroups) exitWith{};

if (isserver) then {
	["Initialize"] call BIS_fnc_dynamicGroups;
} else {
	["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};