/*
	LRG MISSION TEMPLATE
	AISpawns.sqf
	Author: MitchJC
	
	Guide: Copy and Paste the Example into any of the Spawn areas below. You can create as 
	many spawns as you wish. They're just there to guide you. The Example shows you every
	spawn type available. Update the Positon and select an army. From there tweak the AI
	numbers to your liking.
	
	========================================================================================
	======================================== Armies ========================================
	========================================================================================
	
	// Vanilla
	"CSAT"
	"CSAT Pacific"
	"AAF"
	"Syndikat"

	// CUP
	"TM"			Takistani Militia
	"CRS"			Chernarussian Movement of the Red Star
	"CUP AFRF"		Armed Forces of the Russian Federation
	"SLA"			Sahrani Liberation Army
	"TA" 			Takistani Army	
	
	========================================================================================
	======================================= EXAMPLE ========================================
	========================================================================================

	[
		"Objective Bravo",						// Group Prefix as seen in Zeus
		[2955.43,6010.11,0],					// Center Position, can be an array or a Marker name.
		500,									// Radius
		"SLA",									// Army from _army list above.
		[5, 0, 200],							// Garrisoned troops	[Number of Groups, Min radius, Max Radius]
		[3, 5],									// Infantry Patrols		[Min, Max]
		[1, 2],									// AA Infantry			[Min, Max]
		[1, 2],									// AT Infantry			[Min, Max]
		[0, 0],									// AA Vehicle			[Min, Max]
		[0, 0],									// MRAP Vehicle			[Min, Max]
		[0, 0], 								// Random Vehicle		[Min, Max]
		[0, 0],									// Light vehicle		[Min, Max]
		[0, 0]									// Heavy vehicle		[Min, Max]
	] call LR_fnc_SpawnAI;
	
	
	//================================= Spawn 1 ==================================*/
	
	
	//================================= Spawn 2 ==================================
	
	
	//================================= Spawn 3 ==================================
	
	
	//================================= Spawn 4 ==================================
	
	
	//================================= Spawn 5 ==================================	