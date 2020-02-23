class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};

		class ModuleDescription
		{
			class AnyPlayer;
			class AnyBrain;
			class EmptyDetector;
		};
	};

	#include "AISpawnsEastModule.hpp"
	#include "AISpawnsIndependentModule.hpp"
	#include "AISpawnsWestModule.hpp"
	#include "CivilianSpawnsModule.hpp"
};