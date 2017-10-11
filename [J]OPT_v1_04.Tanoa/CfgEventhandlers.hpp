#define EXCLUDE_CBA_MACROS
#include "main\script_component.hpp"

/* Example from CBA
class Extended_PreStart_EventHandlers {
    class My_event_on_game_start {
        init = "diag_log isClass (configFile >> 'CfgPatches' >> 'CBA_Keybinding')";
    };
};
*/

class Extended_PreInit_EventHandlers {
    class GVARMAIN(common) {
        init = QUOTE(call compile preProcessFileLineNumbers 'common\XEH_preInit.sqf');
    };
    class GVARMAIN(database) {
        init = QUOTE(call compile preProcessFileLineNumbers 'database\XEH_preInit.sqf'); //TODO: serverInit?
    };
    class GVARMAIN(gui) {
        init = QUOTE(call compile preProcessFileLineNumbers 'gui\XEH_preInit.sqf');
    };
     class GVARMAIN(hud) {
        init = QUOTE(call compile preProcessFileLineNumbers 'hud\XEH_preInit.sqf');
    };
    class GVARMAIN(log) {
        init = QUOTE(call compile preProcessFileLineNumbers 'log\XEH_preInit.sqf');
    };
    class GVARMAIN(main) {
        init = QUOTE(call compile preProcessFileLineNumbers 'main\XEH_preInit.sqf');
    };
    class GVARMAIN(mission) {
        init = QUOTE(call compile preProcessFileLineNumbers 'mission\XEH_preInit.sqf');
    };
    class GVARMAIN(ranking) {
        init = QUOTE(call compile preProcessFileLineNumbers 'ranking\XEH_preInit.sqf');
    };
    class GVARMAIN(warehouse) {
        init = QUOTE(call compile preProcessFileLineNumbers 'warehouse\XEH_preInit.sqf');
    };

};

class Extended_PostInit_EventHandlers {
    class GVARMAIN(database) {
        serverInit = QUOTE(call compile preprocessFileLineNumbers 'database\XEH_postInit.sqf');
    };
    class GVARMAIN(hud) {
        init = QUOTE(call compile preProcessFileLineNumbers 'hud\XEH_PostInit.sqf');
    };
    class GVARMAIN(mission) {
        init = QUOTE(call compile preProcessFileLineNumbers 'mission\XEH_PostInit.sqf');
    };

};
