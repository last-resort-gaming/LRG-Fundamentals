#include "script_component.hpp"

class CfgPatches
{
	class LRG_AI
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"cba_main",
			"cba_xeh"
		};
		version = VERSION;
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

#include "CfgVehicles.hpp"

class CfgFunctions {

    #include "CfgFunctions.hpp"
};

class Extended_PreInit_EventHandlers
{
	class LRG_AI_Event
	{
		init = "call compile preProcessFileLineNumbers 'z\LRG Fundamentals\Addons\AI\XEH_preInit.sqf'";
	};
};