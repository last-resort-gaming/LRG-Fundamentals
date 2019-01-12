if !(hasinterface) exitwith {};

if (isNil "LRG_Main_MapIcons") exitwith {};
if (not LRG_Main_MapIcons) exitWith{};

[] execVM "LRG Fundamentals\General\Scripts\QS\QS_icons.sqf";