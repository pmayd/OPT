#include "..\..\setup\setup.sqf"

//Disables automatic distribution of backpack radios to group leaders.
TFAR_giveLongRangeRadioToGroupLeaders = false;											//default: false
//Enables distribution of commander radios to squadmates.
TFAR_givePersonalRadioToRegularSoldier = false;				// default: false
//Determines whether or not MicroDAGR is issued.
TFAR_giveMicroDagrToSoldier = false;										// default: true

//------------------------------- RADIO CODE for each side ---------------------------------
//-------------WEST
if (OPT_TFAR_INTERCEPTION == 1) then {
	//Encryption code for BLUFOR side. default _bluefor
	tf_west_radio_code = "_bluefor";
	//Encryption code for OPFOR side default _opfor
	tf_east_radio_code = "_bluefor";
	//Encryption code for Independent side. default _independent
	tf_guer_radio_code = "_bluefor";

} else {
	//Encryption code for BLUFOR side. default _bluefor
	tf_west_radio_code = "_bluefor";
	//Encryption code for OPFOR side default _opfor
	tf_east_radio_code = "_opfor";
	//Encryption code for Independent side. default _independent
	tf_guer_radio_code = "_independent";
	
};
//------------------------------- TS Settings ---------------------------------------------------------------------------------------------
//The name of TS channel in "serious" mode.
tf_radio_channel_name = "TaskForceRadio";
//The password of TS channel in "serious" mode.
tf_radio_channel_password = "123";

//------------------------------- Frequencies and CLassnames ----------------------------------------------------------------
//    Generates identical long range radio settings for the entire faction.
tf_same_lr_frequencies_for_side = true;
//  Generates identical short range radio settings for the entire faction.
tf_same_sw_frequencies_for_side = true;
//  Sets the default frequencies for BLUFOR Short-Range Radios. Also sets <code>tf_same_sw_frequencies_for_side = true;
TFAR_defaultFrequencies_sr_west = ["101","102","103","104","105","106","107","108"];
// Sets the default frequencies for BLUFOR Long-Range Radios. Also sets <code>tf_same_sw_frequencies_for_side = true;
TFAR_defaultFrequencies_lr_west = ["31","32","33","34","35","36","37","38","39"];
// Sets the default frequencies for OPFOR Short-Range Radios.
TFAR_defaultFrequencies_sr_east = ["101","102","103","104","105","106","107","108"];
// Sets the default frequencies for OPFOR Long-Range Radios. Also sets <code>tf_same_sw_frequencies_for_side = true
TFAR_defaultFrequencies_lr_east = ["31","32","33","34","35","36","37","38","39"];
// 	Long range radio class for BLUFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Backpack_West = "OPT_tf_rt1523g_big_bwmod";
// Commander radio class for BLUFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Personal_West = "OPT_tf_anprc152";
// Squadmate radio class for BLUFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Rifleman_West = "OPT_tf_anprc152";
// Long range radio class for OPFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Backpack_East = "OPT_tf_mr3000_bwmod";
// Commander radio class for OPFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Personal_East = "OPT_tf_fadak";
// Squadmate radio class for OPFOR side — may be overwritten for a specific faction.
TFAR_DefaultRadio_Rifleman_East = "OPT_tf_fadak";


//------------------------------- General Transmission and speech settings ----------------------------------------------------------------
//The propagation distance of sound from radio speakers.
TF_speakerDistance = 20;
//A coefficient defining the level of radio signal interruption caused by terrain.
TF_terrain_interception_coefficient = 0.0;
//The maximum distance that direct speech travels. When using values over 60 ? this should be used together with TFAR_fnc_setVoiceVolume function. Values under 60 ? limit the propagation distance of player's speech to a specified radius.
TF_max_voice_volume = 60;