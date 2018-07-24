// band-aid fix for onPlayerConnected
//[CBAP_OPC_FIX, "onPlayerConnected", {}] call BIS_fnc_addStackedEventHandler;
//[CBAP_OPC_FIX, "onPlayerConnected"] call BIS_fnc_removeStackedEventHandler;

// PFH stuff
call compile preprocessFileLineNumbers 'functions\CBA\PFH\init_perFrameHandler.sqf';
