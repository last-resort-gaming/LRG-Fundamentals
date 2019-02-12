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
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = VERSION;
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers
{
	class LRG_AI_Event
	{
		init = "call compile preProcessFileLineNumbers 'z\LRG Fundamentals\Addons\AI\XEH_preInit.sqf'";
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

	#include "AISettingsModule.hpp"
	#include "AISpawnsEastModule.hpp"
	#include "AISpawnsIndependentModule.hpp"
	#include "AISpawnsWestModule.hpp"
};
class CfgFunctions {

    #include "CfgFunctions.hpp"
};