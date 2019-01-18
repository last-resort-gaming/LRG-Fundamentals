////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#include "script_component.hpp"

class CfgPatches
{
	class LRG_SafeZone
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
class LRG_ModuleSafeZone: Module_F
	{
		scope = 2;
		displayName = "Safe Zone";
		icon = LOGO_PATH;
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleSafeZone";
		functionPriority = 3;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class SafeZoneEnable
			{
				displayName =  "Safe Zone";
				description = "Should players be restricted from shooting at base?";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class SafeZoneSize
			{
				displayName = "Size";
				description = "Area of Safe Zone around this module in meters.";
				typeName = "NUMBER";
				defaultValue = 150;
			};
			class SafeZoneDuration
			{
				displayName = "Duration";
				description = "How long should the safe zone be active. -1 means permanent.";
				typeName = "NUMBER";
				defaultValue = -1;
			};																																		
		};
		class ModuleDescription: ModuleDescription
		{
			description = "LRG Fundamentals Module Description Goes Here.";
			sync[] = {"LocationArea_F"};
			class LocationArea_F
			{
				position = 0;
				optional = 0;
				duplicate = 1;
				synced[] = {"Anything"};
			};
		};
	};
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};