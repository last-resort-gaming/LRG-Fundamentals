////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class LRG_QSIcons
	{
		author = "Last Resort Gaming";
		name = "LRG Fundamentals";
		url = "https://www.lastresortgaming.net/";
		units[] = {};
		requiredVersion = 1.60;
		requiredAddons[] = {"A3_UI_F","cba_main","cba_xeh"};
		version = "1.0";
		authors[] = {"MitchJC"};
		weapons[] = {};
	};
};

class Extended_PreInit_EventHandlers {
    class LRG_QSIcons_Event {
        init = "call compile preprocessFileLineNumbers '\LRG Fundamentals\QS Icons\XEH_preInit.sqf'";
    };
};

class CfgFunctions {
    #include "cfgFunctions.hpp"
};