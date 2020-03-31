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

class CfgMods {
	class LRG_Fundamentals {
		dir = "@LRG Fundamentals";
		name = "LRG Fundamentals";

		author = "LastResortGaming";

		hidePicture = 0;
		hideName = 1;

		description = "LRG Fundamentals provides a simple-yet-effective mission making framework used by the LastResortGaming community.";
		overview = "LRG Fundamentals provides a simple-yet-effective mission making framework used by the LastResortGaming community.";

		picture = "\z\LRG Fundamentals\Addons\Media\images\LRG Logo.paa";
		logo = "\z\LRG Fundamentals\Addons\Media\images\LRG Logo.paa";
		logoOver = "\z\LRG Fundamentals\Addons\Media\images\LRG Logo.paa";
		logoSmall = "\z\LRG Fundamentals\Addons\Media\images\Patches\LRGLogo.paa";
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
};

#include "Functions\AIS\Effects\BarDlg.hpp"
#include "Functions\CHVD\dialog.hpp"
#include "Functions\YAINA\General\crewNamesTitles.hpp"

class CfgScriptPaths
{
	LRGDisplays = "z\LRG Fundamentals\addons\Main\Scripts\UI\Displays\";
};