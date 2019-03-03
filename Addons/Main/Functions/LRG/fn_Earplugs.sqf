// not documented: postInit

if !(hasInterface) exitwith {};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

if (isNil { player getVariable "EarplugsAdded"; } ) then {
		player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		[] execVM "z\LRG Fundamentals\Addons\Main\Scripts\Earplugs\earplugs.sqf";
	}];
	player setvariable ["EarplugsAdded", true];
};
