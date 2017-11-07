#define EXCLUDE_CBA_MACROS
#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(msg_waiting) = [];
GVAR(msg_cur) = [];

[QGVAR(message), LINKFUNC(message)] call CBA_fnc_addEventHandler;
