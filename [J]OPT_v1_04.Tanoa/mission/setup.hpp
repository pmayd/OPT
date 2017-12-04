/**
* Gameplay 
*/
// wenn nicht auskommentiert mit // dann wird ein Lobbyparameter erzeugt, mit dem man Spielerklassen die keine Piloten sind daran hindern kann ein Flugzeug/Heli zu fliegen
// die Pilotenklassen können auch angepasst werden --> siehe setup_classnames.sqf
// wirkt sich global auf alle Vehicle des Typs "Air" aus
#define __ONLY_PILOTS_CAN_FLY__

// wenn nicht auskommentiert mit // dann wird ein Lobbyparameter erzeugt, mit dem man Spielerklassen die keine Crew sind daran hindern kann ein APC/Panzer zu fahren
// die Crewklassen können auch angepasst werden --> siehe setup_classnames.sqf
#define __ONLY_CREW_CAN_DRIVE__

// wenn nicht auskommentiert mit // dann wird ein Lobbyparameter erzeugt, mit dem man Spielerklassen die keine Crew sind daran hindern kann ein APC/Panzer zu fahren
// die Pioklassen können auch angepasst werden --> siehe setup_classnames.sqf
#define __ONLY_PIO_CAN_BUILD_FARPS__

// für den Fall, dass __ONLY_PILOTS_CAN_FLY__ oder __ONLY_PILOTS_CAN_FLY__ aktiv ist, wird dieser Slot gesperrt
#define __BLOCKED_VEHICLE_POSITIONS__ ["driver"]
