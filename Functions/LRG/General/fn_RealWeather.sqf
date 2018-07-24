/*
	LRG MISSION TEMPLATE
	fn_RealWeather.sqf
	Author: Code34
			MitchJC - Conversion to PFH & Function
	Description: Randomizes Weather
*/

if !(EnableDynamicWeather) exitwith {};
	
	// Real time vs fast time
	// true: Real time is more realistic weather conditions change slowly (ideal for persistent game)
	// false: fast time give more different weather conditions (ideal for non persistent game) 
	realtime = false;
	mintime = 60;								// Min time seconds (real time) before a new weather forecast
	maxtime = 3600; 							// Max time seconds (real time) before a new weather forecast
	daytimeratio = 1;							// Ratio 1 real time second for x game time seconds
	nighttimeratio = 1;							// Ratio 1 real time second for x game time seconds
	timesync = 60;								// send sync data across the network each xxx seconds
//	startingdate = [2015, 07, 01, 06, 30];		// Mission starting date
	
	if(StartingWeather == "RANDOM") then {StartingWeather = ["CLEAR", "CLOUDY", "RAIN"] call BIS_fnc_selectRandom;};
	
	/////////////////////////////////////////////////////////////////
	// Do not edit below
	/////////////////////////////////////////////////////////////////
	
	if(mintime > maxtime) exitwith {hint format["Real weather: Max time: %1 can no be higher than Min time: %2", maxtime, mintime];};
	timeforecast = mintime;

//	setdate startingdate;
	switch(startingweather) do {
		case "CLEAR": {wcweather = [0, 0, 0, [random 3, random 3, true], date];};
		case "CLOUDY": {wcweather = [0, 0, 0.6, [random 3, random 3, true], date];};
		case "RAIN": {wcweather = [1, 0, 1, [random 3, random 3, true], date];};
		default {wcweather = [0, 0, 0, [random 3, random 3, true], date];};
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
	_handle = [
	{
			wcweather set [4, date];
			publicvariable "wcweather";
			if(!realtime) then { 
				if((date select 3 > 16) or (date select 3 <6)) then {
					setTimeMultiplier nighttimeratio;
				} else {
					setTimeMultiplier daytimeratio;
				};
			};

	}, timesync, []] call CBA_fnc_addPerFrameHandler;

	
	lastrain = 0;
	Currentrain = 0;
	Currentovercast = 0;

	_handle = [
	{
		Currentovercast = random 1;
		if(Currentovercast > 0.70) then {
			Currentrain = random 1;
		} else {
			Currentrain = 0;
		};
		if((date select 3 > 2) and (date select 3 <6)) then {
			if(random 1 > 0.9) then {
				TheFog = 0.1 + (random 0.4);
			} else {
				TheFog = 0.1 + (random 0.2);
			};
		} else {
			if((lastrain > 0.6) and (Currentrain < 0.2)) then {
				TheFog = random 0.2;
			} else {
				TheFog = 0;
			};
		};
		if(random 1 > 0.95) then {
			TheWind = [random 7, random 7, true];
		} else {
			TheWind = [random 3, random 3, true];
		};
		lastrain = Currentrain;

		wcweather = [Currentrain, TheFog, Currentovercast, TheWind, date];
		60 setRain (wcweather select 0);
		60 setfog (wcweather select 1);
		60 setOvercast (wcweather select 2);
		setwind (wcweather select 3);

		timeforecast = mintime + (random (maxtime - mintime));
	}, timeforecast, []] call CBA_fnc_addPerFrameHandler;
	
	
	
	
	
	
	
	
	