/**
* Author: James
* add addAction menus to all buy pads as defined in editor
* all buy pad menus must have the variable opt_warehouse_data with 
* ["vehicletype", side] as data.
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_createMenu.sqf;
*
*/
#include "script_component.hpp"

// iteriere über alle Objekte und prüfe, ob die Varialbe opt_warehouse_data gesetzt ist.
{
    if (count (_x getVariable [QGVAR(data), []]) > 0) then {

        (_x getVariable QGVAR(data)) params ["_txt", "_type", "_side"];

        switch (_side) do {
            case west: {
                [
                    _x,
                    [
                        _txt call XBlueText,
                        compile format["['%1'] call %2", _type, QFUNC(vehicleOrder)],
                        [],
                        1, 
                        true, 
                        true, 
                        "", 
                        '((_target distance player) < 3) and vehicle player == player'
                    ]
                ] remoteExecCall ["addAction", 0, true];

            };
            case east: {                
                [
                    _x,
                    [
                        _txt call XRedText,
                        compile format["['%1'] call %2", _type, QFUNC(vehicleOrder)],
                        [],
                        1, 
                        true, 
                        true, 
                        "", 
                        '((_target distance player) < 3) and vehicle player == player'
                    ]
                ] remoteExecCall ["addAction", 0, true];

            };
            default {};
        };

        _x allowDamage false;
        _x enableSimulation false;
    }

} foreach entities "Thing";