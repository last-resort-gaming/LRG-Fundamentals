if !(hasinterface) exitwith {};

if (isNil "LRG_QSIcons_MaterEnable") exitwith {};
if (not LRG_QSIcons_MaterEnable) exitWith{};

[] execVM "LRG Fundamentals\QS Icons\Scripts\QS_icons.sqf";