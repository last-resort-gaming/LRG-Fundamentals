#define HIGHLIGHT_COLOR "#2eea54"
/*
Function: LR_MI_fnc_loadHelp

Description:
    Load the help text on the supplied ctrl

Arguments:
    _ctrlHelpText - The ctrl on which to load the help

Return Value:
    None

Example:
    Nothing to see here

Author:
	Gruppe Adler, modified by Mokka
*/

params ["_ctrlHelpText"];

_ctrlHelpText ctrlSetStructuredText parseText format ["<t size='0.8'>
Press <t color='%1'>[H]</t> to toggle help.<br/>
<br/>
<t color='%1'>select markers</t> - Drag with left mouse button to select markers.<br/>
<br/>
<t color='%1'>[ctrl + A]</t> - Select all markers.<br/>
<br/>
<t color='%1'>[ctrl]</t> - Hold while selecting to add to selection.<br/>
<br/>
<t color='%1'>[alt]</t> - Hold while selecting to enable selection of editor or script created markers.<br/>
<br/>
<t color='%1'>[shift]</t> - Hold while selecting to remove markers from selection.<br/>
</t>",HIGHLIGHT_COLOR];
