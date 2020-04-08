#include "script_component.hpp"

class CfgPatches
{
	class LRG_AIS_Revive
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
    class LRG_AIS_Reive_Event {
        init = "call compile preprocessFileLineNumbers 'z\LRG Fundamentals\Addons\AIS Revive\XEH_preInit.sqf'";
    };
};

class CfgFunctions {
    #include "cfgFunctions.hpp"
};

#include "Functions\Effects\BarDlg.hpp"