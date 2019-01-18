////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class LRG_Modules
	{
		author = "Last Resort Gaming";
		name = "LRG Fundamentals";
		url = "https://www.lastresortgaming.net/";
		units[] = {"LRG_ModuleMain"};
		requiredVersion = 1.60;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = "1.0";
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class LRG_Main_Event {
        init = "call compile preprocessFileLineNumbers '\LRG Fundamentals\Main\XEH_preInit.sqf'";
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
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits;
		class ModuleDescription;
	};
	#include "MainModule.hpp"
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
	#include "Functions\AIS\Core\cfgFunctions.hpp"
	#include "Functions\AIS\System\cfgFunctions.hpp"
	#include "Functions\AIS\Effects\cfgFunctions.hpp"
	#include "Functions\AIS\Damage\cfgFunctions.hpp"
	#include "Functions\YAINA\General\CfgFunctions.hpp"
	#include "Functions\YAINA\Commands\CfgFunctions.hpp"
};

#include "Functions\AIS\Effects\BarDlg.hpp"
#include "Functions\CHVD\dialog.hpp"
#include "Functions\YAINA\General\crewNamesTitles.hpp"
