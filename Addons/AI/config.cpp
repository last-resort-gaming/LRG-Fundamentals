#include "script_component.hpp"

class CfgPatches
{
	class LRG_AI
	{
		author = AUTHOR;
		name = NAME;
		url = URL;
		units[] = {
			"LRG_Module_AISpawnsEastZeus",
			"LRG_Module_AISpawnsIndepZeus",
			"LRG_Module_AISpawnsWestZeus"
		};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"A3_UI_F",
			"A3_UI_F_Curator",
            "A3_Functions_F_Curator",
            "A3_Modules_F",
            "A3_Modules_F_Curator",
            "A3_Modules_F_Bootcamp_Misc",
			"cba_main",
			"cba_xeh",
			"LRG_Media"
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