#define COMPONENT gui
#define COMPONENT_BEAUTIFIED GUI
#include "..\main\script_mission.hpp"

#define DEBUG_MODE_MINIMAL
// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

//#ifdef DEBUG_ENABLED_gui
    #define DEBUG_MODE_FULL
//#endif

#include "..\main\script_macros.hpp"
#include "setup.hpp"

#define RSC(VAR) TRIPLES(PREFIX,DLG,VAR)
#define APP(VAR) RSC(DOUBLES(COMPONENT,VAR))
#define QAPP(VAR) QUOTE(APP(VAR))
#define QRSC(VAR) QUOTE(RSC(VAR))
