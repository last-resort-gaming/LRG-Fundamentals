if !(hasinterface) exitwith {};

if (isNil "LRG_QSIcons_MasterEnable") exitwith {};
if (not LRG_QSIcons_MasterEnable) exitWith{};

[] execVM "LRG Fundamentals\QS Icons\Scripts\QS_icons.sqf";