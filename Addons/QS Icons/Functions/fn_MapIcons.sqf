if !(hasinterface) exitwith {};

if (isNil "LRG_QSIcons_MasterEnable") exitwith {};
if (not LRG_QSIcons_MasterEnable) exitWith{};

[] execVM "z\LRG Fundamentals\addons\QS Icons\Scripts\QS_icons.sqf";