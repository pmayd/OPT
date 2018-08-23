/**
* Author: James
* open map and choose teleport
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_teleport.sqf;
*
*/
#include "script_component.hpp"

["Teleport", "Position zum Teleport mit Linksklick auswählen.", "blue"] call EFUNC(gui,message);
openMap true;

[QGVAR(onMapSingleClick), "onMapSingleClick", {
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
    [QGVAR(onMapSingleClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

    openMap false;
    
}] call BIS_fnc_addStackedEventHandler;
