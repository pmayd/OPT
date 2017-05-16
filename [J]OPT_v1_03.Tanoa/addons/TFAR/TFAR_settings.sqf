#include "..\..\setup\setup.sqf"

//Disables automatic distribution of backpack radios to group leaders.
tf_no_auto_long_range_radio = true;											//default: false
//Enables distribution of commander radios to squadmates.
TF_give_personal_radio_to_regular_soldier = false;				// default: false
//Determines whether or not MicroDAGR is issued.
TF_give_microdagr_to_soldier = false;										// default: true
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
//------------------------------- General Transmission and speech settings ----------------------------------------------------------------
//The propagation distance of sound from radio speakers.
TF_speakerDistance = 20;
//A coefficient defining the level of radio signal interruption caused by terrain.
TF_terrain_interception_coefficient = 0.0;
//The maximum distance that direct speech travels. When using values over 60 ? this should be used together with TFAR_fnc_setVoiceVolume function. Values under 60 ? limit the propagation distance of player's speech to a specified radius.
TF_max_voice_volume = 60;