/*
Function: LR_fnc_DynamicSim

Description:
    Globally enables or disables dynamic simulation and sets proper parameters.

Arguments:
    None

Return Value:
    None

Example:
    Nothing to see here

Author: MitchJC
*/

if (!IsServer) exitwith {};
private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_DynamicSim = uiNamespace getVariable ["LRG_Main_DynamicSim", false];
if (not _LRG_Main_DynamicSim) exitWith{};

if !(dynamicSimulationSystemEnabled) exitwith {

	enableDynamicSimulationSystem true;

	"Group" setDynamicSimulationDistance 3000;
	"Vehicle" setDynamicSimulationDistance 3000;
	"EmptyVehicle" setDynamicSimulationDistance 250;
	"Prop" setDynamicSimulationDistance 50;
	"IsMoving" setDynamicSimulationDistanceCoef 3;

};