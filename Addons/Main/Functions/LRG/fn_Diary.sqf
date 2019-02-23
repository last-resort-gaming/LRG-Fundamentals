// not documented: postInit
private _LRG_Main_Master = uiNamespace getVariable ["LRG_Main_Master", false];
if (not _LRG_Main_Master) exitWith{};

private _LRG_Main_Diary = uiNamespace getVariable ["LRG_Main_Diary", false];
if (not _LRG_Main_Diary) exitWith{};

if (!hasInterface) exitWith {};

player createDiaryRecord ["Diary", ["Long Range Frequencies",
"
<br/><font face='PuristaLight' color='#ffcc00' font size='20' >**LISTENING ON AN UNAUTHORISED FREQUENCY IS STRICTLY PROHIBITED.**</font>
<br/>
<br/>Below is a list of the default Long Range Frequencies. Your role specific frequencies are set on your radio automatically. Ensure you're on the correct frequencies at all times.
<br/>
<br/><font face='PuristaLight' color='#B85450'>Platoon Frequency: 30MHz</font>
<br/><font face='PuristaLight' color='#6C8EBF'>Command Frequency: 40MHz</font>
<br/><font face='PuristaLight' color='#D3D3D3'>Pilot Frequency:	 50MHz</font>
<br/><font face='PuristaLight' color='#D79B00'>FAC Frequency: 60MHz</font>
"
]];

player createDiaryRecord ["Diary", ["Short Range Frequencies",
"
<br/><font face='PuristaLight' color='#ffcc00' font size='20' >**LISTENING ON AN UNAUTHORISED FREQUENCY IS STRICTLY PROHIBITED.**</font>
<br/>
<br/>Below is a list of the default Short Range Frequencies. Your role specific frequencies are set on your radio automatically. Ensure you're on the correct frequencies at all times. Don't forget the MERT Frequency!
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Command: 				475MHz</font>
<br/><font face='PuristaLight' color='#6C8EBF'>Command Additional: 		500MHz</font>
<br/>
<br/><font face='PuristaLight' color='#80BF00'>1 Section: 				100MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>1 Section Charlie: 		125MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>1 Section Delta: 		150MHz</font>
<br/>
<br/><font face='PuristaLight' color='#80BF00'>2 Section: 				200MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>2 Section Charlie: 		225MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>2 Section Delta: 		250MHz</font>
<br/>
<br/><font face='PuristaLight' color='#80BF00'>3 Section: 				300MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>3 Section Charlie: 		325MHz</font>
<br/><font face='PuristaLight' color='#80BF00'>3 Section Delta: 		350MHz</font>
<br/>
<br/><font face='PuristaLight' color='#D3D3D3'>909 EAW: 				400MHz</font>
<br/><font face='PuristaLight' color='#D60025' font size='20' >909 EAW MERT:	 		425MHz</font>
"
]];

_PlayerGroup =  group player getVariable ["LRG_section","null"];
if !(_PlayerGroup == "Command") exitwith {};

player createDiarySubject ["LRG Commands","LRG Commands"];

player createDiaryRecord ["LRG Commands", ["TFAR",
"
<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Sending Distance Multiplicator</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to increase or decrease maximum transmission range of TFAR.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can be used repeatedly and takes effect immediately. </font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Higher means longer range. A setting of 3.5 covers all of Altis.</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Example:</font>
<br/><execute expression=""copyToClipboard '!tfar_distanceMultiplier 3.5'"">!tfar_distanceMultiplier 3.5</execute>

<br/>



<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Terrain Interception Coefficient</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to increase or decrease how much Terrain effects Radio Range.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can be used repeatedly and take effect immediately. </font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Higher means Terrain has a greater impact on reducing radio range.</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Examples:</font>
<br/><execute expression=""copyToClipboard '!tfar_interceptionCoefficient 0.1'"">!tfar_interceptionCoefficient 0.1</execute>

"
]];


player createDiaryRecord ["LRG Commands", ["Side Chat",
"
<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Side Chat Duration</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to set the maximum time in minutes Side Chat can be used for.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- If set to '0' SideChat will remain on permanently.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- As long as side chat hasn't expired, the time can be changed.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Time is from the Server Start time..</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Examples:</font>
<br/><execute expression=""copyToClipboard '!sideChatDuration 60'"">!sideChatDuration 60</execute>
<br/><execute expression=""copyToClipboard '!sideChatDuration 0'"">!sideChatDuration 0</execute>
"
]];

player createDiaryRecord ["LRG Commands", ["Safe Zone",
"
<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Safe Zone Enabled</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to turn the Safe Zone on and off.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can be used infinitely. </font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can take a maximum of 60 seconds for the Safe Zone to change state.</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Examples:</font>
<br/><execute expression=""copyToClipboard '!safeZoneEnabled True'"">!safeZoneEnabled True</execute>
<br/><execute expression=""copyToClipboard '!safeZoneEnabled False'"">!safeZoneEnabled False</execute>
<br/>



<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Safe Zone Position</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to set the center position of the Safe Zone.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Must be in this format x,y </font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can take a maximum of 60 seconds for the Safe Zone to move.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Hint - If you know where the Safe Zone needs to be moved before mission start, it's much easier to get the x,y in the editor beforehand.</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Example:</font>
<br/><execute expression=""copyToClipboard '!safeZonePosition 1500,2500'"">!safeZonePosition 1500,2500</execute>
<br/>



<br/><font face='PuristaLight' color='#40FFFF' font size='20'>Safe Zone Area</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>- Used to set the size of the Safe Zone in Meters.</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Uses 2D distance from SafeZonePosition</font>
<br/><font face='PuristaLight' color='#6C8EBF'>- Can take a maximum of 60 seconds for the Safe Zone Area to change.</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Example:</font>
<br/><execute expression=""copyToClipboard '!safeZoneArea 250'"">!safeZoneArea 250</execute>
"
]];

player createDiaryRecord ["LRG Commands", ["Introduction",
"
<br/><font face='PuristaLight' color='#40FFFF' font size='20'>LRG Commands</font>
<br/>
<br/><font face='PuristaLight' color='#6C8EBF'>Welcome to the LRG Commands Area. In this Section I'll explain how the system works.

<br/>First off, for these commands to work you need to be set as a mission creator.
<br/>The commands need to be entered to the chat (like admin commands on EU1), they start with an exclamation mark (!).
<br/>The commands can be entered in any chat channel, they do not show up in the actual chat, so entered commands are invisible to normal player.
<br/>
<br/>In the following pages of this Section you'll see various commands.
<br/>For each there's examples for you to use.
<br/>Copy the example into the debug console and adjust as required.
<br/>
<br/>As a general rule the server runs a check every 60 seconds for changes to these commands.
<br/>That means from execution of your command till it being action there will be a delay. Ensure you plan for this if required.

"
]];














