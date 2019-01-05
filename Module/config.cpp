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
		displayName = "Mission Setup";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleMain";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
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
			class PilotCheck
			{
				displayName = "Pilot Restrictions";
				description = "Enable so only those with Pilot Trait can fly.";
				typeName = "BOOL";
				defaultValue = 1;
			};			
			class ViewDistanceEnable
			{
				displayName = "CH View Distance";
				description = "Enable CHVD within LRG Fundamentals";
				typeName = "BOOL";
				defaultValue = true;
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
			class CueCardsEnable
			{
				displayName = "Cue Cards";
				description = "Show/Hide Cue Cards in ACE Self Interaction Menu";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class DiaryEnable
			{
				displayName = "Diary Defaults";
				description = "Show/Hide Default LRG Diary Entries.";
				typeName = "BOOL";
				defaultValue = 1;
			};			
			class CreatorActionsEnable
			{
				displayName = "Creator Actions";
				description = "Show/Hide Creator Actions in ACE Self Interaction Menu";
				typeName = "BOOL";
				defaultValue = 1;
			};
			class FatigueVanilla
			{
				displayName = "Fatigue (Vanilla ONLY)";
				description = "Enable/Disable Vanilla Fatigue System. Does not apply with @ACE.";
				typeName = "BOOL";
				defaultValue = 0;
			};
			class FPSCounterEnable
			{
				displayName = "FPS Counter";
				description = "Enable/Disable FPS Counter on Map";
				typeName = "BOOL";
				defaultValue = 1;
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
		functionPriority = 2;
		isGlobal = 0;
		isTriggerActivated = 0;
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
						name = "@CUP - Russian Federation";
						value = "CUP AFRF";
					};					
					class AI_CUP_CMRS
					{
						name = "@CUP - Chernarussian Movement of the Red Star";
						value = "CUP CMRS";
					};					
					class AI_CUP_SLA
					{
						name = "@CUP - Sahrani Liberation Army";
						value = "CUP SLA";
					};					
					class AI_CUP_TA
					{
						name = "@CUP - Takistan Army";
						value = "CUP TA";
					};					
					class AI_CUP_TM
					{
						name = "@CUP - Takistan Militia";
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
		displayName = "Safe Zone";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
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

	class LRG_ModuleChannels: Module_F
	{
		scope = 2;
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
			class SideChatDuration
			{
				displayName = "Side - Duration";
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
};

class CfgFunctions {

    #include "cfgFunctions.hpp"
};