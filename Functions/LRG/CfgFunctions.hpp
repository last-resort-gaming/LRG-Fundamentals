class LR {

			tag = "LR";
			class AI {
				file = "LRG Fundamentals\Functions\LRG\AI";
				class InfantryGarrison {};
				class SetUnitSkill {};
				class SpawnAI {};		
			};
			
			class AmmoBox {

				file = "LRG Fundamentals\Functions\LRG\AmmoBox";
				class AmmoBox {};
			};
			
			class Arsenal {

				file = "LRG Fundamentals\Functions\LRG\Arsenal";
				class Arsenal {};
				class ArsenalLoadSave {postInit = 1;};
			};

			class General {

				file = "LRG Fundamentals\Functions\LRG\General";
				class Confirmation {postInit = 1;};
				class Diary { postInit = 1; };
				class initPlayerLocal {postInit = 1;};
				class initServer {postInit = 1;};
				class MedicalFacility {};
				class PlayerAddActions {};
				class RealWeather {postInit = 1;};
				class SafeZone {postInit = 1;};
				class SideChat {postInit = 1;};
				class TFAR {postInit = 1;};
				class PilotCheck {postInit = 1;};
				class AISpawns {postInit = 1;};
			};
			
			class Messages {

				file = "LRG Fundamentals\Functions\LRG\Messages";
				class globalhint {};
				class globalhintc {};
				class globalhintsilent {};
			};
			
			class PreInit {

				file = "LRG Fundamentals\Functions\LRG\PreInit";
				class PreInit {preInit = 1;};
				class fileExists {};
			};
			
			class Training {

				file = "LRG Fundamentals\Functions\LRG\Training";
				class Casualty {};	
				class ResetTargets {};
			};	
			
			class UsefulFuncs {

				file = "LRG Fundamentals\Functions\LRG\UsefulFuncs";
				class CrashSite {};
				class InitInspectableIntel {};
				class LaptopHoldActions {};
				class RunIntelAction {};
				class SetIntelAction {};
				class IEDVehicle {};
				class SpawnExplosives {};
			};
};