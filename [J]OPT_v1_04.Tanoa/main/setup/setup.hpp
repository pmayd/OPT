/**
* SETUP FILE
*/
// -------- setup all stuff in this file
// #define __DEBUG__

/**
* Allgemeine Einstellungen
* wird in descprition.ext verwendet
*/
// hier den Missionsnamen festlegen
#define __MISSION_NAME__ "OPT - Schlacht Nr. xx"
// Versionsnummer eintragen (nur die des Base Templates!!!)
#define __VERSION__ Build on version 1.04
// made by
#define __MADE_BY__ "James"
// short description
#define __MISSION_DESCRIPTION__ "This is an Operation Pandora Trigger Mission"

// festlegen des Respawn Typs:
// 0 = No Respawn (NONE)
// 1 = Respawn als Möwe/Rabe/Schmetterling (BIRD)
// 2 = Instant, also an der Stelle an der man stirbt
// 3 = Respawn an der Base (BASE)
// 4 = Respawn in der Gruppe, nur wenn noch KI da ist (GROUP)
// 5 = Respawn in eine KI der eigenen Seite, sofern vorhanden (SIDE)
#define __RESPAWN_TYPE__ 3

// Anzahl max. möglicher Spieler eingeben
#define __PLNUM__ 106

// falls die Mission respawn haben soll, dann die folgende Zeile auskommentieren und respawn Zeit festlegen
// wenn das Respawndelay größer als 10 Sekunden ist erscheint ein berühmtes Zitat während die Kamera den leblosen Körper zeigt
#define __RESPAWN_DELAY__ 12

// wenn nicht auskommentiert mit // dann verdoppelt sich das Respawndelay des Spielers mit jedem Respawn
// Beispiel: Delay am Anfang, 30 Sekunden, der 3. Respawn dauert dann schon 4 Minuten!
// Die Zahl gibt das maximale Delay an (in Sekunden)
//#define __FLEXIBLE_RESPAWNTIME__ 300

// DM - Death Match
// CTF - Capture the Flag
// FF - Flag Fight
// Coop / ZCoop -Cooperative Mission
// Team - Team Mission
// SC - Sector Control
// Hold - Hold Location
#define __GAMETYPE__ SC

// wenn nicht auskommentiert mit // dann werden die in der Klammer definierten Channels blockiert und sind nur für den Admin frei
// 	0 = 	Global
// 	1 = 	Side
// 	2 = 	Command
// 	3 = 	Group
// 	4 = 	Vehicle
// 	5 = 	Direct
// 	6 = 	System
//#define __DISABLE_CHAT_CHANNELS__ {0}

/**
* Umwelt und Grafik 
*/



/**
* Markersystem
*/

// wenn nicht auskommentiert, werden alle Sektor-Flaggen mit einem Marker versehen
#define __OPT_PARAM_FLAG_MARKER__

// wenn nicht auskommentiert mit // dann werden für definierte Spieler Marker auf der Karte erzeugt
#define __SHOW_CUSTOM_PLAYERMARKER__

// wenn nicht auskommentiert, kann in den Parametern eingestellt werden, ob HL alle Einheiten auf der Kate sieht oder nur Gruppenführer.
#define __SHOW_ALL_UNITS__


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

// Aktiviert eine Minensperrzone um die Flagge
#define __MINE_FREE_FLAG__

// Größe der Minensperrzone in Meter
#define __MINE_FREE_FLAG_RADIUS__ 20


/**
* Utilities
*/

/**
* Ingame HUD Overlay
*/
// alle Optionen können durch "//" auskommentiert werden
// nur nicht auskommentierte Optionen werden angezeigt.

// globale Option, schaltet das ganze HUD aus, wenn auskommentiert
#define __HUD_ON__

// aktiviert Anzeige der Spieleranzahl
#define __HUD_NUMBER_PLAYERS__

// aktiviert lokale FPS-Anzeige für Client
//#define __HUD_FPS__

// aktiviert Budget-Anzeige der eigenen Seite
#define __HUD_BUDGET__

// aktiviert Anzeige Punktestand
#define __HUD_SCORE__

// aktiviert Anzeige der Waffenruhe + Spielzeit
#define __HUD_TIMER__

/**
* Bestellsystem ORDER DIALOG
*/

// überprüft, ob noch ein freier Platz in x m um Spawnplatz existiert
#define __ORDER_SPAWN_RADIUS__ 15

// zeigt alle möglichen Fahrzeuge für den Verkauf in x m um das Verkaufspad
#define __ORDER_SELL_RADIUS__ 15

// aktiviert eine Verkauf-Option am Bestell-Pad
#define __ORDER_CAN_SELL__

// wenn __ORDER_CAN_SELL__ aktiv, legt __ORDER_SELL_RETURN_VALUE__ den Rückgewinnungswert fest
// sprich, Fahrzeug bringt beim Verkauf Einkaufspreis * __ORDER_SELL_RETURN_VALUE__
#define __ORDER_SELL_RETURN_VALUE__ 0.75

// wenn __ORDER_CAN_SELL__ aktiv, legt __ORDER_SELL_WITH_DAMAGE__ fest, ob beim Verkauf Schaden berücksichtigt wird
// wenn aktiv, wird der Verkaufspreis um den Schaden reduziert
//#define __ORDER_SELL_WITH_DAMAGE__

/**
* KOSTEN
*/

// Startbudget NATO
#define __BUDGET_NATO__ 4847250

// Startbudget CSAT
#define __BUDGET_CSAT__ 4413720

// Dispo-Kredit für beide Seiten, falls Budget < 0
#define __BUDGET_DISPO__ 1e5

// wie viel ist eine Einheit wert? Wird für jeden Respawn vom Budget abgezogen.
#define __RESPAWN_COST__ 2500