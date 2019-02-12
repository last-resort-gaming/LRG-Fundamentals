/*
	LRG MISSION TEMPLATE
	fn_RealWeather.sqf
	Author: Code34
			MitchJC - Conversion to PFH & Function
	Description: Randomizes Weather
*/
if (isNil "LRG_Weather_Master") exitwith {};
if (not LRG_Weather_Master) exitWith{};

private _StartingWeather = call {
	if (LRG_Weather_StartWeather IsEqualTo 0) exitwith {SelectRandom ["CLEAR", "CLOUDY", "RAIN"]};
	if (LRG_Weather_StartWeather IsEqualTo 1) exitwith {"CLEAR"};
	if (LRG_Weather_StartWeather IsEqualTo 2) exitwith {"CLOUDY"};
	if (LRG_Weather_StartWeather IsEqualTo 3) exitwith {"RAIN"};
	"CLEAR";
};
///////////////////////////////////////////////////////////
// Do not edit below
/////////////////////////////////////////////////////////////////
	
if(LRG_Weather_MinTime > LRG_Weather_MaxTime) then {
	hint format["Min Time cannot be highter than max time. Min Time set to %1 ", LRG_Weather_MaxTime, LRG_Weather_MinTime];
	LRG_Weather_MinTime = LRG_Weather_MaxTime;
	};

//	setdate startingdate;

wcweather = call {
	if (_StartingWeather IsEqualTo "CLEAR") exitwith {[0, 0, 0, [random 3, random 3, true], date];};
	if (_StartingWeather IsEqualTo "CLOUDY") exitwith {[0, 0, 0.6, [random 3, random 3, true], date];};
	if (_StartingWeather IsEqualTo "RAIN") exitwith {[1, 0, 1, [random 3, random 3, true], date];};
	[0, 0, 0, [random 3, random 3, true], date];
};

	// add handler
if (local player) then {
	wcweatherstart = true;
	"wcweather" addPublicVariableEventHandler {
		// first JIP synchronization
		if(wcweatherstart) then {
			wcweatherstart = false;
			skipTime -24;
			86400 setRain (wcweather select 0);
			86400 setfog (wcweather select 1);
			86400 setOvercast (wcweather select 2);
			skipTime 24;
			simulweatherSync;
			setwind (wcweather select 3);
			setdate (wcweather select 4);
		}else{
			wcweather = _this select 1;
			60 setRain (wcweather select 0);
			60 setfog (wcweather select 1);
			60 setOvercast (wcweather select 2);
			setwind (wcweather select 3);
			setdate (wcweather select 4);
		};
	};
};

// SERVER SIDE SCRIPT
if (!isServer) exitWith{};

// apply weather
skipTime -24;
86400 setRain (wcweather select 0);
86400 setfog (wcweather select 1);
86400 setOvercast (wcweather select 2);
skipTime 24;
simulweatherSync;
setwind (wcweather select 3);
setdate (wcweather select 4);


// sync server & client weather & time
[
	{
		params ["_args", "_pfhID"];
		_args params [];

		wcweather set [4, date];
		publicvariable "wcweather";
		if(!LRG_Weather_RealTime) then { 
			if((date select 3 > 16) or (date select 3 <6)) then {
				setTimeMultiplier LRG_Weather_NightTimeAcc;
			} else {
				setTimeMultiplier LRG_Weather_DayTimeAcc;
			};
		};
	}, LRG_Weather_SyncTime, []
] call CBA_fnc_addPerFrameHandler;

private	_lastrain = 0;
private	_rain = 0;
private	_overcast = 0;

[
	{
		params ["_args", "_pfhID"];
		_args params ["_lastrain", "_rain", "_overcast"];
		
		_Overcast = random 1;
		if(_Overcast > 0.70) then {
			_Rain = random 1;
		} else {
			_Rain = 0;
		};
		if((date select 3 > 2) and (date select 3 <6)) then {
			if(random 1 > 0.9) then {
				_Fog = 0.1 + (random 0.4);
			} else {
				_Fog = 0.1 + (random 0.2);
			};
		} else {
			if((_lastrain > 0.6) and (_Rain < 0.2)) then {
				_Fog = random 0.2;
			} else {
				_Fog = 0;
			};
		};
		if(random 1 > 0.95) then {
			_wind = [random 7, random 7, true];
		} else {
			_wind = [random 3, random 3, true];
		};
		_lastrain = _Rain;

		wcweather = [_Rain, _Fog, _overcast, _wind, date];

		60 setRain (wcweather select 0);
		60 setfog (wcweather select 1);
		60 setOvercast (wcweather select 2);
		setwind (wcweather select 3);

	}, random (LRG_Weather_MaxTime - LRG_Weather_MinTime), [_lastrain, _rain, _overcast]
] call CBA_fnc_addPerFrameHandler;
	