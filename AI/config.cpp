////////////////////////////////////////////////////////////////////
//DeRap: LRG_Modules\config.bin
//Produced from mikero's Dos Tools Dll version 6.44
//'now' is Thu Jan 03 16:49:44 2019 : 'file' last modified on Wed Dec 05 17:41:22 2018
//http://dev-heaven.net/projects/list_files/mikero-pbodll
////////////////////////////////////////////////////////////////////

class CfgPatches
{
	class LRG_AI
	{
		author = "Last Resort Gaming";
		name = "LRG Fundamentals";
		url = "https://www.lastresortgaming.net/";
		units[] = {"LRG_ModuleAISpawns"};
		requiredVersion = 1.60;
		requiredAddons[]={"A3_Data_F"};
		version = "1.0";
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
	class LRG_ModuleAISpawns: Module_F
	{
		scope = 2;
		displayName = "AI Spawn";
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
					class AI_RHS_GREF_ChDKZ
					{
						name = "@RHS GREF - ChDKZ Insurgents";
						value = "RHS GREF ChDKZ";
					};
					class AI_RHS_AFRF_MSV
					{
						name = "@RHS AFRF - Russia - MSV";
						value = "AI_RHS_AFRF_MSV";
					};
					class AI_RHS_AFRF_VDV
					{
						name = "@RHS AFRF - Russia - VDV";
						value = "AI_RHS_AFRF_VDV";
					};												
					class AI_RHS_AFRF_VMF
					{
						name = "@RHS AFRF - Russia - VMF";
						value = "AI_RHS_AFRF_VMF";
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
	class LRG_ModuleAISettings: Module_F
	{
		scope = 2;
		displayName = "AI Difficulty Settings";
		icon = "LRG Fundamentals\Media\Images\LRG Logo.paa";
		author = "MitchJC";
		vehicleClass = "Modules";
		category = "LRG_Modules";
		function = "LR_fnc_moduleAISettings";
		functionPriority = 1;
		isGlobal = 0;
		isTriggerActivated = 0;
		isDisposable = 0;
		is3DEN = 0;
		class Arguments: ArgumentsBaseUnits
		{
			class InitialAI
			{
				displayName = "Include Initial AI";
				description = "Any AI placed in the Editor will have difficulty set to this module on mission start.";
				typeName = "BOOL";
				defaultValue = 1;
			};	
			class ZeusAI
			{
				displayName = "Include Zeus placed AI";
				description = "Any Zeus placed AI will have their difficulty set to this module as soon as placed (if used with ConfigZeus)";
				typeName = "BOOL";
				defaultValue = 1;
			};					
			class LRGAimingAccuracy
			{
				displayName = "Min Aiming Accuracy";
				description = "Higher value means the AI will be more likely to hit the target.";
				typeName = "Number";
				defaultValue = 0.10;
			};
			class LRGAimingShake
			{
				displayName = "Min Aiming Shake";
				description = "Higher value means the AI will be more precise.";
				typeName = "Number";
				defaultValue = 0.45;
			};
			class LRGAimingSpeed
			{
				displayName = "Min Aiming Speed";
				description = "Higher value means the AI can rotate and stabilize its aim faster.";
				typeName = "Number";
				defaultValue = 0.30;
			};
			class LRGCommanding
			{
				displayName = "Commanding";
				description = "Higher value means the AI can report targets faster.";
				typeName = "Number";
				defaultValue = 1;
			};
			class LRGCourage
			{
				displayName = "Courage";
				description = "Higher value means the AI has got more courage.";
				typeName = "Number";
				defaultValue = 1;
			};
			class LRGGeneral
			{
				displayName = "General";
				description = "Higher value improves the AI's decision making.";
				typeName = "Number";
				defaultValue = 1;
			};
			class LRGReloadSpeed
			{
				displayName = "Min Reload Speed";
				description = "Higher value means the AI can switch or reload weapons faster.";
				typeName = "Number";
				defaultValue = 0.50;
			};
			class LRGSpotDistance
			{
				displayName = "Min Spot Distance";
				description = "Higher value means the AI is better at spotting targets.";
				typeName = "Number";
				defaultValue = 0.40;
			};
			class LRGSpotTime
			{
				displayName = "Min Spot Time";
				description = "Higher value means the AI will react faster to death, damage or enemies.";
				typeName = "Number";
				defaultValue = 0.20;
			};
																																																				
		};
		class ModuleDescription: ModuleDescription
		{
			description = "Short module description";
			sync[] = {"LocationArea_F"};
			class LocationArea_F
			{
				position = 0;
				optional = 0;
				duplicate = 1;
				synced[] = {"Anything"};
			description[] = {
				"When this Module is placed, all AI placed by Zeus wil use these difficulty settings.",
				"This Module also applies a + random amount to any Min named value to add a bit of variation."
				};
			};
		};
	};	
};
class CfgFunctions {

    #include "cfgFunctions.hpp"
};