#include "script_component.hpp"

class CfgPatches
{
	class LRG_Interaction
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

class Extended_PreInit_EventHandlers {
    class LRGFundamentals_Interaction_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Interaction\XEH_preInit.sqf'";
    };
};