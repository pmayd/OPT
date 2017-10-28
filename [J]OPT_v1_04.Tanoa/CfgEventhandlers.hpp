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
        init = QUOTE(call compile preProcessFileLineNumbers 'common\XEH_PreInit.sqf');
    };
    class GVARMAIN(database) {
        init = QUOTE(call compile preProcessFileLineNumbers 'database\XEH_PreInit.sqf'); //TODO: serverInit?
    };
    class GVARMAIN(gui) {
        init = QUOTE(call compile preProcessFileLineNumbers 'gui\XEH_PreInit.sqf');
    };
    class GVARMAIN(hud) {
        init = QUOTE(call compile preProcessFileLineNumbers 'hud\XEH_PreInit.sqf');
    };
    class GVARMAIN(log) {
        init = QUOTE(call compile preProcessFileLineNumbers 'log\XEH_PreInit.sqf');
    };
    class GVARMAIN(main) {
        init = QUOTE(call compile preProcessFileLineNumbers 'main\XEH_PreInit.sqf');
    };
    class GVARMAIN(mission) {
        init = QUOTE(call compile preProcessFileLineNumbers 'mission\XEH_PreInit.sqf');
    };
    class GVARMAIN(radar) {
        init = QUOTE(call compile preProcessFileLineNumbers 'radar\XEH_PreInit.sqf');
    };
    class GVARMAIN(ranking) {
        init = QUOTE(call compile preProcessFileLineNumbers 'ranking\XEH_PreInit.sqf');
    };
    class GVARMAIN(sectorcontrol) {
        init = QUOTE(call compile preProcessFileLineNumbers 'sectorcontrol\XEH_PreInit.sqf');
    };
    class GVARMAIN(tfar) {
        init = QUOTE(call compile preProcessFileLineNumbers 'tfar\XEH_PreInit.sqf');
    };
    class GVARMAIN(warehouse) {
        init = QUOTE(call compile preProcessFileLineNumbers 'warehouse\XEH_PreInit.sqf');
    };

};

class Extended_PostInit_EventHandlers {
    class GVARMAIN(common) {
        init = QUOTE(call compile preProcessFileLineNumbers 'common\XEH_PostInit.sqf');
    };
    class GVARMAIN(database) {
        serverInit = QUOTE(call compile preprocessFileLineNumbers 'database\XEH_PostInit.sqf');
    };
    class GVARMAIN(hud) {
        init = QUOTE(call compile preProcessFileLineNumbers 'hud\XEH_PostInit.sqf');
    };
    class GVARMAIN(log) {
        serverinit = QUOTE(call compile preProcessFileLineNumbers 'log\XEH_PostInit.sqf');
    };
    class GVARMAIN(mission) {
        init = QUOTE(call compile preProcessFileLineNumbers 'mission\XEH_PostInit.sqf');
    };
    class GVARMAIN(radar) {
        init = QUOTE(call compile preProcessFileLineNumbers 'radar\XEH_PostInit.sqf');
    };
    class GVARMAIN(ranking) {
        init = QUOTE(call compile preProcessFileLineNumbers 'ranking\XEH_PostInit.sqf');
    };
    class GVARMAIN(sectorcontrol) {
        init = QUOTE(call compile preProcessFileLineNumbers 'sectorcontrol\XEH_PostInit.sqf');
    };
    class GVARMAIN(tfar) {
        init = QUOTE(call compile preProcessFileLineNumbers 'tfar\XEH_PostInit.sqf');
    };
    class GVARMAIN(warehouse) {
        init = QUOTE(call compile preProcessFileLineNumbers 'warehouse\XEH_PostInit.sqf');
    };

};
