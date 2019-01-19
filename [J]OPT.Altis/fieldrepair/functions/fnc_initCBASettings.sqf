/**
* Author: James
* initialize CBA settings
*
* Arguments:
* None
*
* Return Value:
* None
*
* Example:
* [] call fnc_initCBASettings.sqf;
*
*/
#include "script_component.hpp"

[
    QGVAR(on), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Aktiviert die Fieldrepair-Komponente", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Komponenten", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // Default value <BOOLEAN>
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

if (!GVAR(on)) exitWith{};

[
    "DEFAULT_FIELDREPAIR_EACH_PART_TIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für die Reparatur normaler Teile", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [10, 60, 15, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "DEFAULT_FIELDREPAIR_EACH_HARDPART_TIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für die Reparatur schwerer Teile", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [10, 120, 30, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
   "DEFAULT_FIELDREPAIR_MAX_REP_TIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Max. Zeit für die Reparatur", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [60, 600, 240, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "DEFAULT_FULLREPAIR_LENGTH", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit für komplette Reparatur", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [60, 300, 120, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "DEFAULT_REPAIR_TRUCK_USES", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anzahl Reparaturen pro Rep-LKW", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 10, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "DEFAULT_FREE_REPAIRS", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Anzahl freie Reparaturen pro Einheit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Feldreparatur", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [1, 5, 1, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;





