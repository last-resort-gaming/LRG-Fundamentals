// not documented: postInit

if (isNil "LRG_Main_Logging") exitwith {};
if (not LRG_Main_Logging) exitwith {};

//Server Log Check
if (isserver) then {

	_A3ServerLogsEnabled = false;

	if (isClass (configFile >> "CfgPatches" >> "a3log")) exitwith {
		_A3ServerLogsEnabled = true;
	};
};

if (isNil "_A3ServerLogsEnabled") exitwith {};
if (not _A3ServerLogsEnabled) exitwith {};


// Client Called Logs
if (hasinterface) then {
	_log = format ["%1 attended as %2.",name player, roleDescription player ];
	[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
};

// Server Called Logs
if (isserver) then {
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
	] call CBA_fnc_addEventHandler;

	_log = format ["********************* %1 *********************",briefingName];
	[_log,"LRG_CONNECTLOG"] remoteExecCall ["A3Log", 2];
	[_log,"LRG_DEATHLOG"] remoteExecCall ["A3Log", 2];
};