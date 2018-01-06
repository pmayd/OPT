#define COMPONENT sectorcontrol
#define COMPONENT_BEAUTIFIED Sector_Control
#include "..\main\script_mission.hpp"

// #define DEBUG_MODE_MINIMAL
 #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_blankcomponent
    #define DEBUG_MODE_FULL
#endif

#include "..\main\script_macros.hpp"
#include "setup.hpp"

#define PLACE_WAITING -1
#define PLACE_CANCEL 0
#define PLACE_APPROVE 1
