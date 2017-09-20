/*
	Drop Big Bomb

	Author: Phantom (OPT MOD Team)
		Modified by schmingo (OPT MOD Team)

	v2014-10-06 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

if (local player) then {
	
	private ["_position", "_posY", "_posX", "_bomb"];

	_position = _this select 0;

	onMapSingleClick "";
	openMap false;
	sleep 0.1;

	_posX = (_position select 0);
	_posY = (_position select 1);
	sleep 0.1;

	_bomb = "Bo_GBU12_LGB" createVehicle [_posX, _posY, 1000];
	sleep 0.1;
	_bomb setPosATL [_posX, _posY, 50];
};