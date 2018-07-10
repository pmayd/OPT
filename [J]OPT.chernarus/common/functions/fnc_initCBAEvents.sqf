/**
* Author: James
* initialize CBA Event Handlers
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBAEvents.sqf;
*
*/
#include "script_component.hpp"

// Zeus neu vergeben
[QGVAR(renewCurator), {

    params ["_operator"];

    if (_operator in (allCurators apply {getAssignedCuratorUnit _x})) then {
        _id = (allCurators apply {getAssignedCuratorUnit _x}) find _operator;
        _module = allCurators select _id;
        unassignCurator _module;
        _operator assignCurator _module;
    };
    
}] call CBA_fnc_addEventHandler;


[QGVAR(setVariable), {

    params ["_var", "_value"];

    call compile format["%1 = %2", _var, _value];

}] call CBA_fnc_addEventHandler;

[QGVAR(addToCurator), {
    params ["_unit"];

    {
        _x addCuratorEditableObjects [[_unit] - [zeus_ziv1, zeus_ziv2, zeus_ziv3], false];
    } forEach [zeus_ziv1, zeus_ziv2, zeus_ziv3];
}] call CBA_fnc_addEventHandler;