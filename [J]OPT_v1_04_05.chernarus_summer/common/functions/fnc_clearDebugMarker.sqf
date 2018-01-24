/**
 * Author: Dorbedo
 * deletes all debug marker
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 */

#include "script_component.hpp"

ISNILS(GVARMAIN(debug_marker), []);

private _remove = GVARMAIN(debug_marker);
GVARMAIN(debug_marker) = [];

{
    deleteMarkerLocal _x;
    nil
} count _remove;
