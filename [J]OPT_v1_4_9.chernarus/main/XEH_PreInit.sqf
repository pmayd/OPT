#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

/* execute setup_classnames und setup_publicVariables */
[] call FUNC(setup_classnames);

if (isServer) then {
    [] call FUNC(preInit);
    [] call FUNC(setup_publicVariables);
};