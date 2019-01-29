	class LRG_ModuleAISpawnsIndependent: Module_F
	{
		scope = 2;
		displayName = "AI Spawn - Independent";
		icon = "\z\LRG Fundamentals\addons\media\images\icons\AI INDEP.paa";
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
					class CUP_I_NAPA
					{
						name = "@CUP - National Part of Chernarus";
						value = "CUP_I_NAPA";
					};
					class CUP_I_PMC_ION
					{
						name = "@CUP - ION PMC";
						value = "CUP_I_PMC_ION";
					};
					class CUP_I_RACS
					{
						name = "@CUP - Royal Army Corps of Sahrani";
						value = "CUP_I_RACS";
					};					
					class CUP_I_TK_GUE
					{
						name = "@CUP - Takistani Locals";
						value = "CUP_I_TK_GUE";
					};
					class CUP_I_UN
					{
						name = "@CUP - United Nations";
						value = "CUP_I_UN";
					};											
					class LOP_IRAN
					{
						name = "@Project OPFOR - Iranian Armed Forces";
						value = "LOP_IRAN";
					};
					class LOP_NAPA
					{
						name = "@Project OPFOR - Chernarussian National Insurgents";
						value = "LOP_NAPA";
					};
					class LOP_PESH_IND
					{
						name = "@Project OPFOR - Kurdish Peshmerga Forces";
						value = "LOP_PESH_IND";
					};
					class LOP_PMC
					{
						name = "@Project OPFOR - Private Military Company";
						value = "LOP_PMC";
					};
					class LOP_RACS
					{
						name = "@Project OPFOR - Royal Army Corps of Sahrani";
						value = "LOP_RACS";
					};
					class LOP_UA
					{
						name = "@Project OPFOR - Ultranationalists";
						value = "LOP_UA";
					};
					class LOP_UKR
					{
						name = "@Project OPFOR - Ukrainian Armed Forces";
						value = "LOP_UKR";
					};	
					class LOP_UN
					{
						name = "@Project OPFOR - United Nations";
						value = "LOP_UN";
					};
					class LOP_UVF
					{
						name = "@Project OPFOR - Ulster Volunteer Force";
						value = "LOP_UVF";
					};
					class rhsgref_faction_cdf_ground
					{
						name = "@RHS GREF - Chernarus (Ground Forces)";
						value = "rhsgref_faction_cdf_ground";
					};
					class rhsgref_faction_chdkz_g
					{
						name = "@RHS GREF - ChDKZ Insurgents";
						value = "rhsgref_faction_chdkz_g";
					};	
					class rhsgref_faction_nationalist
					{
						name = "@RHS GREF - Nationalist Militia";
						value = "rhsgref_faction_nationalist";
					};
					class rhssaf_faction_army
					{
						name = "@RHS SAF - SAF (KOV)";
						value = "rhssaf_faction_army";
					};
					class rhssaf_faction_un
					{
						name = "@RHS SAF - SAF (UN Peacekeepers)";
						value = "rhssaf_faction_un";
					};																											
					class IND_F
					{
						name = "Vanilla - AAF";
						value = "IND_F";
					};
					class IND_C_F
					{
						name = "Vanilla - Syndikat";
						value = "IND_C_F";
					};																			
				};
				defaultValue = "IND_C_F";
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