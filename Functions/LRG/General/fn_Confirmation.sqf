/*
	LRG MISSION TEMPLATE
	fn_Confirmation.sqf
	Author: MitchJC
	Description: Displays a message on joining if LRG_Setup is not configured.
*/
If ((Confirmation) || (!hasInterface)) exitwith {};

 [{["<t color='#F52222' size = '0.8'>CONFIGURATION!<br />You need to configure LRG_Setup.sqf</t>",0.5,.8,10,2,0,789] spawn BIS_fnc_dynamicText;}, [], 5] call CBA_fnc_waitAndExecute;
 
 
 
 
 