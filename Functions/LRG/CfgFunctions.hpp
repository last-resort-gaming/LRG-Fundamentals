class LR {

			tag = "LR";
			class AI {
				file = "Functions\LRG\AI";
				class InfantryGarrison {};
				class SetUnitSkill {};
				class SpawnAI {};		
			};
			
			class AmmoBox {

				file = "Functions\LRG\AmmoBox";
				class AmmoBox {postInit = 1;};
			};
			
			class Arsenal {

				file = "Functions\LRG\Arsenal";
				class Arsenal {postInit = 1;};
				class TimedArsenal {postInit = 1;};
				class ArsenalLoadSave {postInit = 1;};
			};

			class General {

				file = "Functions\LRG\General";
				class Confirmation {postInit = 1;};
				class Diary { postInit = 1; };
				class initPlayerLocal {postInit = 1;};
				class initServer {postInit = 1;};
				class MedicalFacility {postInit = 1;};
				class PlayerAddActions {};
				class RealWeather {postInit = 1;};
				class SafeZone {postInit = 1;};
				class SideChat {postInit = 1;};
				class TFAR {postInit = 1;};
				class PilotCheck {postInit = 1;};
			};
			
			class Messages {

				file = "Functions\LRG\Messages";
				class globalhint {};
				class globalhintc {};
				class globalhintsilent {};
			};
			
			class PreInit {

				file = "Functions\LRG\PreInit";
				class PreInit {preInit = 1;};
			};
			
			class UsefulFuncs {

				file = "Functions\LRG\UsefulFuncs";
				class CrashSite {};
				class InitInspectableIntel {};
				class LaptopHoldActions {};
				class RunIntelAction {};
				class SetIntelAction {};
				class IEDVehicle {};
				class SpawnExplosives {};
			};
};