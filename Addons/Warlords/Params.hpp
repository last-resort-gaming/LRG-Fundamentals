class BIS_WLStartingDaytime
{
	title = $STR_A3_combatpatrol_params_1;
	values[] = {100, -6, 0, 6, -12};
	texts[] = {$STR_A3_WL_param37_value1, $STR_A3_combatpatrol_params_3, $STR_A3_MP_COOP_m03_noon, $STR_A3_MP_COOP_m03_evening, $STR_A3_combatpatrol_params_6};
	default = 100;
};
class BIS_WLTimeAcceleration
{
	title = $STR_A3_WL_param2_title;
	values[] = {1, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24};
	texts[] = {$STR_special_none, "x2", "x4", "x6", "x8", "x10", "x12", "x14", "x16", "x18", "x20", "x22", "x24"};
	default = 1;
};
class BIS_WLProgress
{
	title = $STR_A3_WL_param1_title;
	values[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13};
	texts[] = {$STR_special_none,$STR_A3_WL_forcedProgress_perc_1,$STR_A3_WL_forcedProgress_perc_2,$STR_A3_WL_forcedProgress_perc_3,$STR_A3_WL_forcedProgress_perc_4,$STR_A3_WL_forcedProgress_perc_5,$STR_A3_WL_forcedProgress_perc_6,$STR_A3_WL_forcedProgress_perc_7,$STR_A3_WL_forcedProgress_perc_8,$STR_A3_WL_forcedProgress_perc_9,$STR_A3_WL_forcedProgress_perc_10,$STR_A3_WL_forcedProgress_perc_11,$STR_A3_WL_forcedProgress_perc_12};
	default = 1;
};
class BIS_WLFTEnabled
{
	title = $STR_A3_fastravel1;
	values[] = {1, 0, 2, 3, 4};
	texts[] = {$STR_A3_WL_param3_value1, $STR_A3_WL_param3_value2, $STR_A3_WL_param3_value3, $STR_A3_WL_param3_value4, $STR_A3_WL_param3_value5};
	default = 1;
};
class BIS_WLScanEnabled
{
	title = $STR_A3_WL_param4_title;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLVotingResetEnabled
{
	title = $STR_A3_WL_menu_resetvoting;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLAIVoting
{
	title = $STR_A3_WL_param5_title;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 0;
};
class BIS_WLArsenalEnabled
{
	title = $STR_A3_Arsenal;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLMarkersTransparency
{
	title = $STR_A3_WL_param7_title;
	values[] = {4, 3, 2, 1, 0};
	texts[] = {$STR_A3_WL_param7_value1, $STR_A3_WL_markerAlpha_perc_1, $STR_A3_WL_markerAlpha_perc_2, $STR_A3_WL_markerAlpha_perc_3, $STR_A3_WL_param7_value2};
	default = 2;
};
class BIS_WLPlayersTransparency
{
	title = $STR_A3_WL_param8_title;
	values[] = {4, 3, 2, 1, 0};
	texts[] = {$STR_A3_WL_param7_value1, $STR_A3_WL_markerAlpha_perc_1, $STR_A3_WL_markerAlpha_perc_2, $STR_A3_WL_markerAlpha_perc_3, $STR_A3_WL_param7_value2};
	default = 2;
};
class BIS_WLFatigueEnabled
{
	title = $STR_A3_fatigue1;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLMusic
{
	title = $STR_A3_rscattributemusic_title;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLVoice
{
	title = $STR_A3_orange_faction_idap_cfgidentities_expo_name;
	values[] = {1, 0};
	texts[] = {$STR_DISP_OPT_ENABLED, $STR_DISP_OPT_DISABLED};
	default = 1;
};
class BIS_WLStartCP
{
	title = $STR_A3_WL_param12_title;
	values[] = {0, 100, 250, 500, 1000, 2500, 5000};
	texts[] = {"0", "100", "250", "500", "1000", "2500", "5000"};
	default = 500;
};
class BIS_WLCPMultiplier
{
	title = $STR_A3_WL_param13_title;
	values[] = {1, 2, 3, 4, 5};
	texts[] = {"1x", "2x", "3x", "4x", "5x"};
	default = 1;
};
class BIS_WLVotingTimeout
{
	title = $STR_A3_WL_param14_title;
	values[] = {5, 10, 15, 20, 25, 30};
	texts[] = {"5", "10", "15", "20", "25", "30"};
	default = 15;
};
class BIS_WLVehicleSpan
{
	title = $STR_A3_WL_param15_title;
	values[] = {900, 1800, 3600, 5400, 7200, 1000000};
	texts[] = {"15", "30", "60", "90", "120", $STR_A3_WL_param15_value1};
	default = 3600;
};
