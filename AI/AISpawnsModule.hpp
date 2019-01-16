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
					class AI_OPTRE_Insurrectionists
					{
						name = "@OPTRE - Insurrectionists";
						value = "AI_OPTRE_Insurrectionists";
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
				defaultValue = 200;
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