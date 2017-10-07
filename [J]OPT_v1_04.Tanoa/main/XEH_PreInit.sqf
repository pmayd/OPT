#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

/* execute setup_classnames und setup_publicVariables */
call compile preprocessFileLineNumbers "setup\setup_classnames.sqf";

if (isServer) then {
    call compile preprocessFileLineNumbers "setup\setup_flagPositions.sqf";
    call compile preprocessFileLineNumbers "setup\setup_publicVariables.sqf";
};