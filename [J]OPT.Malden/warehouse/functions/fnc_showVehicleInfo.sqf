/**
* Author: James
* called from orderDialog. Shows vehicle info from config_/_name
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_showVehicleInfo.sqf;
*
*/
#include "script_component.hpp"

#define IDD_DLG_ORDER 20000
#define IDC_CTRL_VEHICLE_LIST 20100
#define IDC_CTRL_VEHICLE_INFO 20101

private _display = findDisplay IDD_DLG_ORDER;
private _listbox_vehicles = _display displayCtrl IDC_CTRL_VEHICLE_LIST;
private _editbox_info = _display displayCtrl IDC_CTRL_VEHICLE_INFO;

private _sel_class = lbCurSel _listbox_vehicles;
private _class = _listbox_vehicles lbData _sel_class;

_editbox_info ctrlSetStructuredText parseText ([_class] call FUNC(getVehicleInfo));
