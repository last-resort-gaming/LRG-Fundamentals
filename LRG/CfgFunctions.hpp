class LR {

	tag = "LR";
	class Equipment {

		file = "LRG Fundamentals\LRG\Equipment";
		class AmmoBox {};
		class Arsenal {};
		class ConfigEquipment {};
		class Loadouts {};
	};

	class Explosives {

		file = "LRG Fundamentals\LRG\Explosives";
		class CrashSite {};
		class IEDVehicle {};
		class MakeIED {};
		class SpawnExplosives {};
	};

	class General {

		file = "LRG Fundamentals\LRG\General";
		class ConfigPlayer {};
		class ConfigZeus {};
		class fileExists {};
		class MedicalFacility {};
		class SafeZone {};
		class Sound3D {};
		class Sound3DFromPos {};
		class FindReplaceString {};
		class Patches {};
	};

	class Interaction {

		file = "LRG Fundamentals\LRG\Interaction";
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

		file = "LRG Fundamentals\LRG\PostInit";
		class AddCueCards {PostInit = 1;};
		class ArsenalLoadSave {PostInit = 1;};
		class Diary {PostInit = 1;};
		class DynamicSim {PostInit = 1;};
		class InitPlayerLocal {PostInit = 1;};
		class InitServer {PostInit = 1;};
		class Logs {PostInit = 1;};
		class PilotCheck {PostInit = 1;};
		class RealWeather {PostInit = 1;};
		class InitCreatorActions {PostInit = 1;};
	};

	class Training {

		file = "LRG Fundamentals\LRG\Training";
		class Casualty {};
		class ResetTargets {};
	};
};
