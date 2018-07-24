/*
	LRG MISSION TEMPLATE
	fn_globalhintsilent.sqf
	Author: MitchJC
	Description: Displays a silent hint via remote ex.
*/

_GHint = _this select 0;
hintSilent parseText format["%1", _GHint];
