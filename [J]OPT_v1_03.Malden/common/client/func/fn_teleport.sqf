/*
	Teleport Script

	Author: schmingo (OPT MOD Team)

	v2015-03-16 | this script is part of OperationPandoraTrigger3 ArmA3 script collection

	Description:
	compile_client.sqf -> 	teleport = compileFinal preprocessFileLineNumbers "addons\opt3_teleport\teleport.sqf";
	onPlayerRespawn.sqf -> 	[] spawn teleport;
*/

titleText ["Position zum Teleport auswaehlen", "PLAIN"];
openMap true;

["OPT_PLAYER_TELEPORT", "onMapSingleClick", {
    /*
    units: Array - leader selected units, same as groupSelectedUnits (same as _units param)
    pos: Array - world Position3D of the click in format [x,y,0] (same as _pos param)
    alt: Boolean - true if Alt key was pressed (same as _alt param)
    shift: Boolean - true if Shift key was pressed (same as _shift param)
    */
    _height = getPosATL player select 2;
    if ((vehicle player isKindOf "Air") and (_height > 2)) then {
        vehicle player setPosATL (_pos vectorAdd [0, 0, 30]);
    } else {
        vehicle player setPos _pos; 
    };
    ["OPT_PLAYER_TELEPORT", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
    
}] call BIS_fnc_addStackedEventHandler;
