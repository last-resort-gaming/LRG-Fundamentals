class LR {

			tag = "LR";
			class AI {
				file = "LRG Fundamentals\Functions\LRG\AI";
				class InfantryGarrison {};
				class SetUnitSkill {};
				class SpawnAI {};
			};
			
			class Equipment {

				file = "LRG Fundamentals\Functions\LRG\Equipment";
				class AmmoBox {};
				class Arsenal {};
				class Loadouts {};
			};
			
			class Explosives {

				file = "LRG Fundamentals\Functions\LRG\Explosives";
				class CrashSite {};
				class IEDVehicle {};
				class MakeIED {};
				class SpawnExplosives {};
			};

			class General {

				file = "LRG Fundamentals\Functions\LRG\General";
				class ConfigPlayer {};
				class ConfigZeus {};
				class fileExists {};
				class MedicalFacility {};
				class Sound3D {};
				class FindReplaceString {};
			};
			
			class Interaction {
				file = "LRG Fundamentals\Functions\LRG\Interaction";
				class DynamicText {};
				class InitInspectableIntel {};
				class LaptopHoldActions {};
				class PlayerAddActions {};
				class RunIntelAction {};
				class SetIntelAction {};
				class AddCreatorAction {};
				class AddAction {};
				class AddSelfAction {};
				class AddHoldAction {};
			};

			class PostInit {

				file = "LRG Fundamentals\Functions\LRG\PostInit";
				class AISpawns {postinit = 1;};
				class ArsenalLoadSave {postInit = 1;};
				class Diary {postInit = 1;};
				class DynamicSim { postInit = 1; };
				class InitPlayerLocal {postInit = 1;};
				class InitServer {postInit = 1;};
				class Logs {postInit = 1;};
				class PilotCheck {postInit = 1;};
				class RealWeather {postInit = 1;};
				class SafeZone {postInit = 1;};
				class SetInitialAI {postInit = 1;};
				class SideChat {postInit = 1;};
				class InitCreatorActions {postInit = 1;};
				class AddCueCards {postInit = 1;};
			};

			class PreInit {

				file = "LRG Fundamentals\Functions\LRG\PreInit";
				class PreInit {preInit = 1;};
			};
			
			class Training {

				file = "LRG Fundamentals\Functions\LRG\Training";
				class Casualty {};
				class ResetTargets {};
			};
};
