//by psycho
params 	["_oldUnit", "_killer", "_respawn", "_respawnDelay"];

["opt_eh_server_log_player_killed", [_respawn, _killer]] call CBA_fnc_serverEvent;

_this execVM "common\client\killcam.sqf";
playMusic "";
sleep 20;

enableEndDialog;