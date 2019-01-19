/**
 * Author: Dorbedo
 * recompile the functions
 *
 * Arguments:
 * 0: <STRING> Component name, if only one component should be renamed
 *
 * Return Value:
 * none
 *
 * Example:
 * ["dmc_mission"] call dmc_fnc_recompile;
 *
 */

#include "script_component.hpp"

If (isNil "DMC_RECOMPILECACHE") exitWith {};

params [["_component","",[""]]];

private _index = if (_component isEqualTo "") then {
    -1
} else {
    (DMC_RECOMPILECACHE select 0) find (tolower _component);
};
systemChat format ["index = %1",_index];
If (_index >= 0) then {
    [] call ((DMC_RECOMPILECACHE select 1) select _index);
}else{
    {
        call _x;
        hintSilent format["%1",_x];
        nil;
    } count (DMC_RECOMPILECACHE select 1);
};
