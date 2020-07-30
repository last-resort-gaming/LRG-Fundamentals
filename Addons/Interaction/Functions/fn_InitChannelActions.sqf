if !(isServer && (isClass (configFile >> "CfgPatches" >> "ace_main"))) exitWith {};

[
	"ChannelActions",
	"Channel Actions",
	"",
	{diag_log "Running channel actions parent";},
	{true},
	[]
] call LR_fnc_AddCreatorAction;

{
	_channelID = _forEachIndex;
	_channelName = _x;

	_enableStatement = compile format ["[%1, [true, false]] remoteExec [""enablechannel"",0,true];", _channelID];
	_disableStatement = compile format ["[%1, [false, false]] remoteExec [""enablechannel"",0,true];", _channelID];

	_channelEnabled = compile format ["(channelEnabled %1) select 0", _channelID];
	_channelDisabled = compile format ["not ((channelEnabled %1) select 0)", _channelID];

	[
		format ["Enable%1", _channelID],
		format ["Enable %1", _channelName],
		"",
		_enableStatement,
		_channelDisabled,
		["ChannelActions"]
	] call LR_fnc_AddCreatorAction;

	[
		format ["Disable%1", _channelID],
		format ["Disable %1", _channelName],
		"",
		_disableStatement,
		_channelEnabled,
		["ChannelActions"]
	] call LR_fnc_AddCreatorAction;
} forEach [
	"Global",
	"Side",
	"Command",
	"Group",
	"Vehicle",
	"Direct"
];