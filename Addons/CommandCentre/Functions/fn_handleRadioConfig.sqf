private _radio = uiNamespace getVariable "LRG_CC_currentRadioObject";

// read out values
private _ch1freq = ctrlText 1400;
private _ch2freq = ctrlText 1401;
private _vol = parseNumber (ctrlText 1402);

// update radio
[_radio, 1, _ch1freq] remoteExec ["TFAR_fnc_setChannelFrequency", 2];
[_radio, 2, _ch2freq] remoteExec ["TFAR_fnc_setChannelFrequency", 2];
[_radio, _vol - 1] remoteExec ["TFAR_fnc_setLrVolume", 2];

closeDialog 1;