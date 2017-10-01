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
private _nato_flag_marker = _nato_flag getVariable ["opt_var_flag_marker", ""];
private _csat_flag_marker = _csat_flag getVariable ["opt_var_flag_marker", ""];
private _nato_flag_x = ctrlText NATO_X_IDC;
private _nato_flag_y = ctrlText NATO_Y_IDC;
private _csat_flag_x = ctrlText CSAT_X_IDC;
private _csat_flag_y = ctrlText CSAT_Y_IDC;

// set flag
call compile format["_nato_flag setPos [%1, %2, 0]", _nato_flag_x, _nato_flag_y];
call compile format["_csat_flag setPos [%1, %2, 0]", _csat_flag_x, _csat_flag_y];
call compile format["_nato_flag_marker setMarkerPos [%1, %2]", _nato_flag_x, _nato_flag_y];
call compile format["_csat_flag_marker setMarkerPos [%1, %2]", _csat_flag_x, _csat_flag_y];