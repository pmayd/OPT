/*
	Set position for ordered MT vehicle

	Author: schmingo (OPT MOD Team)

	v2014-11-02 | this script is part of OperationPandoraTrigger ArmA3 script collection
*/

//changed by psycho

#define mt_dialog 10000
#define mt_vehiclelist 10100

disableSerialization;

_display 		= findDisplay mt_dialog;
_list 			= _display displayCtrl mt_vehiclelist;
_selection 		= lbCurSel _list; 
_unitType 		= (opt_mt_Vehicles select _selection) select 0;
_displayName	= getText (configFile >> "CfgVehicles" >> _unitType >> "displayName");

openMap true;
closeDialog 0;
mapAnimAdd [0.5, 0.03, getPos player];
mapAnimCommit;
_unitType onMapSingleClick "['maintainer_vehicleOrder', [_this,_pos]] call tcb_fnc_NetCallEventCTS; onMapSingleClick ''; openMap false;";

hint parseText format ["%1<br/>wurde geliefert", _displayName];
