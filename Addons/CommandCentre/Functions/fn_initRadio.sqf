/*
Function: LR_fnc_initRadio

Description:
	Initializes a Stationary Radio for use with the Command Centre.

Arguments:
	_object - Radio object
	_radioOn - Turn radio on by default?
	_radioCh1 - Default frequency of Channel 1
	_radioCh2 - Default frequency of Channel 2
	_radioVol - Default Radio Volume

Return Values:
	Nothing.

Examples:
    Nothing to see here

Author:
	Mokka
*/

params [
	"_object",
	["_radioClass", "TFAR_anarc210"],
	["_radioOn", true],
	["_radioCh1", 30],
	["_radioCh2", 40],
	["_radioVol", 7],
	["_radioCode", "_bluefor"]
];

if !(isServer) exitWith {};
if !(isClass (configFile >> "CfgPatches" >> "task_force_radio")) exitWith {};

// Create new radio object at 0,0 for setup
private _radioContainer = createVehicle ["GroundWeaponHolder_Scripted", (getPosATL _object), [], 0, "CAN_COLLIDE"];
_radioContainer allowDamage false;
hideObjectGlobal _radioContainer;

_radioContainer addBackpackCargoGlobal [_radioClass, 1];

// Instanciate radio
private _radio = _radioContainer call TFAR_static_radios_fnc_instanciatedRadio;
_radio = [_radio, "radio_settings"];

// Set up TFAR settings for the radio
private _settings = [0,(_radioVol - 1),[(str _radioCh1),(str _radioCh2)],0,_radioCode,1,0,nil,_radioOn,true];
//_radio setVariable ["radio_settings", _settings, true];
[_radio, _settings] call TFAR_fnc_setLrSettings;

(_radio select 0) setVariable ["TFAR_LRSpeakersEnabled", _radioOn, true];

_object setVariable ["LRG_CC_radioObject", _radio, true];

// Done setting up, now add the actions for channel switching etc.
[_object, _radio] remoteExec ["LR_fnc_addRadioActions", 0, true];