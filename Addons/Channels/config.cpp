#include "script_component.hpp"

class CfgPatches
{
	class LRGFundamentals_Channels
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

class Extended_PreInit_EventHandlers {
    class LRGFundamentals_Channels_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Channels\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class LRG_AI_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Channels\XEH_postInit.sqf'";
    };
};

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits;
		class ModuleDescription;
	};
	#include "ChannelsModule.hpp"
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};