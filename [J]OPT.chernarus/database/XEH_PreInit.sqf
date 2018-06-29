#include "script_component.hpp"

#define SERVER_EH(var1) [QGVAR(var1), { \
    params ['_args', '_target']; \
    GVAR(var1) = _args call FUNC(var1); \
    (owner _target) publicVariableClient QGVAR(var1); \
}] call CBA_fnc_addEventHandler

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// define EH for server, client can use functions directly
/*
 (example) ["OPT_database_getVar", [["myVar"], player]] call CBA_fnc_serverEvent;
 -> content in OPT_database_getVar on client available
*/
SERVER_EH(delVar);
SERVER_EH(getVar);
SERVER_EH(pushVar);
SERVER_EH(remVar);
SERVER_EH(saveProfile);
SERVER_EH(setVar);

ADDON = true;
