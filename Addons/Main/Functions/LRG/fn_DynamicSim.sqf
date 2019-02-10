/*
	LRG MISSION TEMPLATE - @OpScripts
	LR_fnc_DynamicSim.sqf
	Author: MitchJC
	Description: If Dynamic Simulation isn't set, this function will auto config to LRG Defaults.
*/

if (!IsServer) exitwith {};

if (isNil "LRG_Main_Master") exitwith {};
if (not LRG_Main_Master) exitWith{};

if (isNil "LRG_Main_DynamicSim") exitwith {};
if (not LRG_Main_DynamicSim) exitWith{};

if !(dynamicSimulationSystemEnabled) exitwith {

	enableDynamicSimulationSystem true;

	"Group" setDynamicSimulationDistance 3000;
	"Vehicle" setDynamicSimulationDistance 3000;
	"EmptyVehicle" setDynamicSimulationDistance 250;
	"Prop" setDynamicSimulationDistance 50;
	"IsMoving" setDynamicSimulationDistanceCoef 3;

};