private _radio = uiNamespace getVariable "LRG_CC_currentRadioObject";

// read out values
private _ch1freq = ctrlText 1400;
private _ch2freq = ctrlText 1401;
private _vol = sliderPosition 1900;

// update radio
[[_radio, "radio_settings"], 1, (str _ch1freq)] remoteExec ["TFAR_fnc_setChannelFrequency", 2];
[[_radio, "radio_settings"], 2, (str _ch2freq)] remoteExec ["TFAR_fnc_setChannelFrequency", 2];

// Set radio volume
[[_radio, "radio_settings"], _vol-1] remoteExec ["TFAR_fnc_setLrVolume", 2];

closeDialog 1;