#include "script_component.hpp"

class CfgPatches
{
	class LRG_Logistics
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"McDiod", "Mokka"};
		weapons[] = {};
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};


class Extended_PreInit_EventHandlers {
    class LRG_Logistics_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Logistics\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class LRG_Logistics_Event {
        clientInit = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Logistics\XEH_clientInit.sqf'";
    };
};

#include "CfgWeapons.hpp"