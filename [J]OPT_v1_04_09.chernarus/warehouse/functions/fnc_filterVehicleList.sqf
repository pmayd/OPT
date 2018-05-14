/**
* Author: James
* filter available vehicle list according to string in search line
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_searchVehicleList.sqf;
*
*/
#include "script_component.hpp"

#define IDD_DLG_ORDER 20000
#define IDC_CTRL_VEHICLE_LIST 20100

private _display = findDisplay IDD_DLG_ORDER;
private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _edit_search = _display displayCtrl 1400;

private _searchStr = ctrlText _edit_search;

// otherwise filter _listbox

// find all vehicle names with searchStr in it
GVAR(filteredPool) = [];
if (_searchStr isEqualTo "" or ((toLower _searchStr) find "such") != -1 or ({_x == 32} count (toArray _searchStr
) == count _searchStr) ) then {
    GVAR(filteredPool) = GVAR(orderDialogObjects);
    
} else {
    GVAR(filteredPool) = GVAR(orderDialogObjects) select {
        _class = _x select 0;
        _displayName = getText (configFile >> "CfgVehicles" >> _class >> "displayName");
        (toLower _displayName) find (toLower _searchStr) != -1;
    };

};

// if list is empty, nothing to do
if (count GVAR(filteredPool) == 0) exitWith{ lbClear _listbox_vehicles };

// otherwise, clear LB and fill with filtered vehicles
lbClear _listbox_vehicles;

private _txtToAdd = GVAR(filteredPool) apply {getText (configFile >> "CfgVehicles" >> (_x select 0) >> "displayName")};
private _picToAdd = GVAR(filteredPool) apply {
    if (getText(configFile >> "cfgVehicles" >> (_x select 0) >> "picture") find ".paa" != -1) then {
        getText (configFile >> "cfgVehicles" >> (_x select 0) >> "picture");
    } else {
        getText (configFile >> "cfgVehicles" >> (_x select 0) >> "editorPreview");
    };
};
private _dataToAdd = GVAR(filteredPool) apply {_x select 0};

[IDD_DLG_ORDER, IDC_CTRL_VEHICLE_LIST, _txtToAdd, _picToAdd, _dataToAdd] call EFUNC(common,fillLB);






