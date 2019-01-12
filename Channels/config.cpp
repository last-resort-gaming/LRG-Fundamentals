////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class LRGFundamentals_Channels
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
    class LRG_Channels_Event {
        init = "call compile preprocessFileLineNumbers '\LRG Fundamentals\Channels\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class LRG_AI_Event {
        init = "call compile preprocessFileLineNumbers '\LRG Fundamentals\Channels\XEH_postInit.sqf'";
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
	class LRG_ModuleChannels: Module_F
	{
		scope = 1;
		displayName = "Channels";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleChannels";
		functionPriority = 4;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class GlobalText
			{
				displayName = "Global Text";
				description = "Should players be allowed to type/draw in Global chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class GlobalVoice
			{
				displayName = "Global Voice";
				description = "Should players be allowed to speak in Global chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class SideText
			{
				displayName = "Side Text";
				description = "Should players be allowed to type/draw in Side chat?";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class SideVoice
			{
				displayName = "Side Voice";
				description = "Should players be allowed to speak in Side chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};	
			class CommandText
			{
				displayName = "Command Text";
				description = "Should players be allowed to type/draw in Command chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class CommandVoice
			{
				displayName = "Command Voice";
				description = "Should players be allowed to speak in Command chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class GroupText
			{
				displayName = "Group Text";
				description = "Should players be allowed to type/draw in Group chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class GroupVoice
			{
				displayName = "Group Voice";
				description = "Should players be allowed to speak in Group chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class VehicleText
			{
				displayName = "Vehicle Text";
				description = "Should players be allowed to type/draw in Vehicle chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class VehicleVoice
			{
				displayName = "Vehicle Voice";
				description = "Should players be allowed to speak in Vehicle chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class DirectText
			{
				displayName = "Direct Text";
				description = "Should players be allowed to type/draw in Direct chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class DirectVoice
			{
				displayName = "Direct Voice";
				description = "Should players be allowed to speak in Direct chat?";
				typeName = "BOOL";
				defaultValue = 0;
			};													
			class GlobalDuration
			{
				displayName = "Global Duration";
				description = "If enabled, time in minutes for how long Global Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = -1;
			};
			class SideDuration
			{
				displayName = "Side Duration";
				description = "If enabled, time in minutes for how long Side Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = 60;
			};
			class CommandDuration
			{
				displayName = "Command Duration";
				description = "If enabled, time in minutes for how long Command Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = -1;
			};
			class GroupDuration
			{
				displayName = "Group Duration";
				description = "If enabled, time in minutes for how long Group Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = -1;
			};
			class VehicleDuration
			{
				displayName = "Vehicle Duration";
				description = "If enabled, time in minutes for how long Vehicle Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = -1;
			};
			class DirectDuration
			{
				displayName = "Direct Duration";
				description = "If enabled, time in minutes for how long Direct Chat is active, -1 is permanent";
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