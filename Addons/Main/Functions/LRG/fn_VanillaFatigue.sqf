// not documented: postInit

if (!hasinterface) exitwith {};
if !(isClass (configFile >> "CfgPatches" >> "ace_main")) exitwith {};

player enableFatigue LRG_Main_FatigueVanilla;

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	player enableFatigue LRG_Main_FatigueVanilla;
}];