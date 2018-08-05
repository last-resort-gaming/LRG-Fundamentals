/*
	LRG MISSION TEMPLATE
	fn_Logs.sqf
	Author: MitchJC
	Description: Starts Logging and handles DeathLogs.
*/
if ((not LR_start) || {(!isserver)}) exitWith{};

if (isClass (configFile >> "CfgPatches" >> "a3log")) then {
	
	[
		"ace_unconscious", {
   			if (_this select 1) then {
      			// Get player object
      			_player = _this select 0;
      
      			// Increment death count
      			_deathCount = _player getVariable ["deathCount", 0];
      			_deathCount = _deathCount + 1;
      			_player setVariable ["deathCount", _deathCount];
      
      			// Logging
  				_log = format ["--- %1 --- is Unconscious. (Total: %2)", name _player, _deathCount];	
				[_log,"LRG_DEATHLOG"] call A3Log;
			};
		}
	] call CBAP_fnc_addEventHandler;
	
	_log = format ["********************* %1 *********************",briefingName];	
	[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	[_log,"LRG_DEATHLOG"] remoteExecCall ["A3Log", 2];	
};