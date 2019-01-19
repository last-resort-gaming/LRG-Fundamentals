#include "script_component.hpp"

class CfgPatches
{
	class LRG_Vehicles
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

class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits;
		class ModuleDescription;
	};
	#include "ServicingModule.hpp"		
};


class CfgFunctions {

    #include "cfgFunctions.hpp"
};
