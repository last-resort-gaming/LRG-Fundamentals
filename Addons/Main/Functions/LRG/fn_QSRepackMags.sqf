// not documented: postInit

if (!hasInterface) exitwith {};

player addAction ["Repack Magazines", "player spawn LR_fnc_clientRepackMagazines","",-98,false,true];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	_unit addAction ["Repack Magazines", "player spawn LR_fnc_clientRepackMagazines","",-98,false,true];
}];


