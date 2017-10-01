#define NATO_X_IDC 1400
#define NATO_Y_IDC 1401
#define CSAT_X_IDC 1402
#define CSAT_Y_IDC 1403

disableSerialization;

private _dialog = uiNamespace getVariable ['opt_flagDialog' , displayNull];
private _edit_nato_x = _dialog displayCtrl NATO_X_IDC;
private _edit_nato_y = _dialog displayCtrl NATO_Y_IDC;
private _edit_csat_x = _dialog displayCtrl CSAT_X_IDC;
private _edit_csat_y = _dialog displayCtrl CSAT_Y_IDC;

// read in coordinates
private _nato_flag = opt_nato_flags select 0;
private _csat_flag = opt_csat_flags select 0;

// set coordinates
_edit_nato_x ctrlSetText format["%1", getPos _nato_flag select 0];
_edit_nato_y ctrlSetText format["%1", getPos _nato_flag select 1];
_edit_csat_x ctrlSetText format["%1", getPos _csat_flag select 0];
_edit_csat_y ctrlSetText format["%1", getPos _csat_flag select 1];