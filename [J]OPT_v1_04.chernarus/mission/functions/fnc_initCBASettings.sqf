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
    "OPT_PARAM_PLAYTIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Spielzeit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [180, 10800, 9000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "OPT_PARAM_TRUCETIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Waffenruhe", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [30, 900, 300, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "OPT_PARAM_TEAMBALANCE", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Überhangregel", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 15, 5, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "OPT_PARAM_FREEZE_TIME", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    "Zeit, in der zu Beginn alle Einheiten eingeforen sind", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 300, 0, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    "OPT_PARAM_SHOW_INTRO", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Intro", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;


[
    QGVARMAIN(nato_budget), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Budget NATO", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "3000000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVARMAIN(nato_budget) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVARMAIN(csat_budget), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Budget CSAT", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "3000000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVARMAIN(csat_budget) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVARMAIN(dispo), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Dispokredit", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "100000", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVARMAIN(dispo) = parseNumber _value;
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
    QGVARMAIN(respawn_cost), // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Kosten für eine neue Einheit (Respawn)", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "OPT Mission", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "2500", // data for this setting: [min, max, default, number of shown trailing decimals]
    1, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        GVARMAIN(respawn_cost) = parseNumber _value;
    }  // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;