
// list all global variables used within the component
// define variable with default value!
// GVAR(...)
GVAR(box) = []; // contains all available beam positions defined in setup_beamOrte.sqf
GVAR(locations_west) = []; // contains all beam locations for west
GVAR(locations_east) = []; // contains all beam locations for east
GVAR(heavy_vehicles) = []; // contains all heavy vehicle classnames that are only allowed at lvl 3
GVAR(beam_trigger) = []; // contains all trigger variable names that allow player to open beam dialog

// hier bitte alle Variablen anlegen, die man in irgendeiner Weise
// einstellen können soll oder irgendwann mal ändern will
// Beispiele: Add-Action Texte, Variablen, Konstanten, Marker etc
/* IDD & IDC */
#define IDD_DLG_BEAM 444001
#define IDC_CTRL_LIST_BOX 10002

/* LISTBOX COLORS */
#define LB_COLOR_DEFAULT [ 0, 1, 0, 1 ]
#define LB_COLOR_LVL_ONE [ 1, 0.5, 0.5, 1 ]
#define LB_COLOR_LVL_TWO [ 1, 1, 0, 1 ]
