////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

#define _ARMA_

class CfgPatches
{
	class LRG_Modules
	{
		author = "Last Resort Gaming";
		name = "LRG Fundamentals";
		url = "https://www.lastresortgaming.net/";
		units[] = {"LRG_ModuleMain"};
		requiredVersion = 1.60;
		requiredAddons[]={"A3_Data_F"};
		version = "1.0";
		authors[] = {"MitchJC"};
		weapons[] = {};
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
	class LRG_ModuleMain: Module_F
	{
		scope = 2;
		displayName = "LRG Mission Setup";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleMain";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class VehicleCrewListEnable
			{
				displayName = "Vehicle Crew List";
				description = "Shows a list of players in a vehicle.";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class MapIconsEnable
			{
				displayName = "Map Icons";
				description = "Shows player locations on the map";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class ViewDistanceMaxDistance
			{
				displayName = "CHVD - Max View Distance";
				description = "Max distance a player can set CHVD View Distance to.";
				typeName = "NUMBER";
				defaultValue = 12000;
			};
			class ViewDistanceMaxObjectDistance
			{
				displayName = "CHVD - Max Object View Distance";
				description = "Max distance a player can set CHVD Object View Distance to.";
				typeName = "NUMBER";
				defaultValue = 12000;
			};
			class ViewDistanceNoGrass
			{
				displayName = "CHVD - Allow No Grass";
				description = "Should players be allowed to turn grass off?";
				typeName = "BOOL";
				defaultValue = false;
			};			
			class ArsenalSaveLoad
			{
				displayName = "Arsenal - Save/Load";
				description = "Should a player be allowed to Save/Load Loadouts in the Arsenal?";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class DynamicWeatherEnable
			{
				displayName = "Dynamic Weather";
				description = "Allow randomised Weather";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class DynamicWeatherStart
			{
				displayName = "Dynamic Weather - Start";
				description = "If Dynamic Weather enabled, what should the starting weather be?";
				typeName = "STRING";
				class values
				{
					class DWRandom
					{
						name = "Random";
						value = "Random";
					};
					class DWClear
					{
						name = "Clear";
						value = "Clear";
						default = 1;
					};
					class DWCloudy
					{
						name = "Cloudy";
						value = "Cloudy";
					};
					class DWRain
					{
						name = "Rain";
						value = "Rain";
					};
				};
			};
			class TFARTransmitRange
			{
				displayName = "TFAR - Range Multiplyer";
				description = "Increase or decrease max Transmit Range. 0.1 = poor range, 3.5 = All of Altis";
				typeName = "NUMBER";
				defaultValue = 2.5;
			};
			class TFARTerrainInterference
			{
				displayName = "TFAR - Terrain Interference";
				description = "How much Terrain interferes with range. 0.1 = little impact, 2.0 = large impact.";
				typeName = "NUMBER";
				defaultValue = 1.0;
			};
			class SideChatEnable
			{
				displayName = "Side Chat";
				description = "Should players be allowed to type/draw in side chat?";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class SideChatDuration
			{
				displayName = "Side Chat - Duration";
				description = "Time in minutes for how long Side Chat is active, -1 is permanent";
				typeName = "NUMBER";
				defaultValue = 60;
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
	class LRG_ModuleAISpawns: Module_F
	{
		scope = 2;
		displayName = "LRG AI Spawn";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleAISpawns";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class ObjName
			{
				displayName = "Objective Name";
				description = "Name of Objective/Spawn Position";
				typeName = "STRING";
				defaultValue = "Objective 1";
			};
			class EnemyType
			{
				displayName = "Enemy Faction";
				description = "Enemy Faction Type for this Module.";
				typeName = "STRING";
				class values
				{
					class AI_CSAT
					{
						name = "CSAT";
						value = "CSAT";
					};
					class AI_CSAT_Pacific
					{
						name = "CSAT Pacific";
						value = "CSAT Pacific";
					};
					class AI_AAF
					{
						name = "AAF";
						value = "AAF";
					};
					class AI_Syndikat
					{
						name = "Syndikat";
						value = "Syndikat";
					};
					class AI_CUP_AFRF
					{
						name = "CUP AFRF";
						value = "CUP AFRF";
					};					
					class AI_CUP_CMRS
					{
						name = "CUP CMRS";
						value = "CUP CMRS";
					};					
					class AI_CUP_SLA
					{
						name = "CUP SLA";
						value = "CUP SLA";
					};					
					class AI_CUP_TA
					{
						name = "CUP TA";
						value = "CUP TA";
					};					
					class AI_CUP_TM
					{
						name = "CUP TM";
						value = "CUP TM";
					};					
				};
				defaultValue = "CSAT";
			};
			class Radius
			{
				displayName = "Spawn Radius";
				description = "AI Spawn radius from this module";
				typeName = "NUMBER";
				defaultValue = 500;
			};			
			class GarrisonedGroups
			{
				displayName = "Garrisoned Groups";
				description = "Number of Garrisoned AI Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class GarrisonedGroupsMin
			{
				displayName = "Garrisoned Groups Min Radius";
				description = "The minimum radius in metres around the Spawn Position which shall be populated with garrisoned units.";
				typeName = "Number";
				defaultValue = 0;
			};
			class GarrisonedGroupsMax
			{
				displayName = "Garrisoned Groups Max Radius";
				description = "	The maximum radius in metres around the Spawn Position which shall be populated with garrisoned units.";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIPatrolsMin
			{
				displayName = "Min Infantry Patrols";
				description = "Minimum Number of Infantry Patrol Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIPatrolsMax
			{
				displayName = "Max Infantry Patrols";
				description = "Maximum Number of Infantry Patrol Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIAAMin
			{
				displayName = "Min AA Infantry";
				description = "Minimum Number of AA Infantry Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIAAMax
			{
				displayName = "Max AA Infantry";
				description = "Maximum Number of AA Infantry Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIATMin
			{
				displayName = "Min AT Infantry";
				description = "Minimum Number of AT Infantry Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class EIATMax
			{
				displayName = "Max AT Infantry";
				description = "Maximum Number of AT Infantry Groups to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehAAMin
			{
				displayName = "Min AA Vehicles";
				description = "Minimum Number of AA Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehAAMax
			{
				displayName = "Max AA Vehicles";
				description = "Maximum Number of AA Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehMRAPMin
			{
				displayName = "Min MRAPs";
				description = "Minimum Number of MRAPs to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehMRAPMax
			{
				displayName = "Max MRAPs";
				description = "Maximum Number of MRAPs to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehLightMin
			{
				displayName = "Min Light Vehicles";
				description = "Minimum Number of Light Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehLightMax
			{
				displayName = "Max Light Vehicles";
				description = "Maximum Number of Light Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehHeavyMin
			{
				displayName = "Min Heavy Vehicles";
				description = "Minimum Number of Heavy Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehHeavyMax
			{
				displayName = "Max Heavy Vehicles";
				description = "Maximum Number of Heavy Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehRandomMin
			{
				displayName = "Min Random Vehicles";
				description = "Minimum Number of Random Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
			};
			class VehRandomMax
			{
				displayName = "Max Random Vehicles";
				description = "Maximum Number of Random Vehicles to Spawn";
				typeName = "Number";
				defaultValue = 0;
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
class LRG_ModuleSafeZone: Module_F
	{
		scope = 2;
		displayName = "LRG Safe Zone";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleSafeZone";
		functionPriority = 1;
		isGlobal = 1;
		isTriggerActivated = 1;
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