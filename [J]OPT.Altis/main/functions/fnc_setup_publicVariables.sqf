// setup PublicVariable
// executed only from the Server one time
// define all public variables here
#include "script_component.hpp"

GVARMAIN(csat_points) = 0;
publicVariable QGVARMAIN(csat_points);
GVARMAIN(nato_points) = 0;
publicVariable QGVARMAIN(nato_points);
GVARMAIN(draw) = 0;
publicVariable QGVARMAIN(draw);
GVARMAIN(csat_win)= 0;
publicVariable QGVARMAIN(csat_win);
GVARMAIN(nato_win) = 0;
publicVariable QGVARMAIN(nato_win);
GVARMAIN(dominator) = sideUnknown;
publicVariable QGVARMAIN(dominator);

GVARMAIN(nato_flags) = [];
GVARMAIN(csat_flags) = [];

publicVariable QGVARMAIN(nato_flags);
publicVariable QGVARMAIN(csat_flags);