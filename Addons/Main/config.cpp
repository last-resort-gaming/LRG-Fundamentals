#include "script_component.hpp"

class CfgPatches
{
	class LRG_Modules
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

#include "Dialogs/CfgDisplays.hpp"

#include "CfgRespawnTemplates.hpp"

class Extended_PreInit_EventHandlers {
    class LRG_Main_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\Main\XEH_preInit.sqf'";
    };
};

class CfgFactionClasses
{
	class NO_CATEGORY;
	class LRG_Modules: NO_CATEGORY
	{
		displayName = "LRG Fundamentals";
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
	#include "Functions\AIS\Core\cfgFunctions.hpp"
	#include "Functions\AIS\System\cfgFunctions.hpp"
	#include "Functions\AIS\Effects\cfgFunctions.hpp"
	#include "Functions\AIS\Damage\cfgFunctions.hpp"
};

#include "Functions\AIS\Effects\BarDlg.hpp"
#include "Functions\CHVD\dialog.hpp"
#include "Functions\YAINA\General\crewNamesTitles.hpp"

class CfgScriptPaths
{
	LRGDisplays = "z\LRG Fundamentals\addons\Main\Scripts\UI\Displays\";
};