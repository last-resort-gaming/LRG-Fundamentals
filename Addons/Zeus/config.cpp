#include "script_component.hpp"

class CfgPatches
{
	class LRG_Zeus
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};

#include "cfgVehicles.hpp"

class Extended_PreInit_EventHandlers {
    class LRG_Main_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Zeus\XEH_preInit.sqf'";
    };
};