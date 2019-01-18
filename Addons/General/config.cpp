#include "script_component.hpp"

class CfgPatches
{
	class LRG_General
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

#include "CfgRespawnTemplates.hpp"
#include "CfgDisplays.hpp"
#include "CfgUnitInsignia.hpp"

// This needs to look the way it does. Yes, it sucks.
class CfgScriptPaths
{
	LRGDisplays = "z\LRG Fundamentals\addons\General\Scripts\UI\Displays\";
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};
