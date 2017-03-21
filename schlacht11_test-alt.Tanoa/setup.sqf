#include "macros.sqf"
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
#define __MISSION_NAME__ "OPT - Schlacht Nr xx"
// Versionsnummer eintragen (nur die des Base Templates!!!)
#define __VERSION__ Build on version 1.028
// made by
#define __MADEBY__ "Psychobastard und X-one"
// short description
#define __MISSION_DESCRIPTION__ "This is a Operation Pandora Trigger Mission"

// festlegen des Respawn Typs:
// 0 = No Respawn (NONE)
// 1 = Respawn als Möwe/Rabe/Schmetterling (BIRD)
// 2 = Instant, also an der Stelle an der man stirbt
// 3 = Respawn an der Base (BASE)
// 4 = Respawn in der Gruppe, nur wenn noch KI da ist (GROUP)
// 5 = Respawn in eine KI der eigenen Seite, sofern vorhanden (SIDE)
#define __RESPAWN_TYPE__ 3

// Anzahl max. möglicher Spieler eingeben
#define __PLNUM__ 162

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
#define __DISABLE_CHAT_CHANNELS__ {0}


/**
* Umwelt und Grafik 
*/

// Wenn __STARTTIME__ definiert ist, wird die Zeit auf dem Server geskipt. Der Server synchronisiert die Zeit mit den Clients
// möglich sind Werte von 0-23, also ganze Zahlen mit den Stunden oder die Zahl 99 für "vorgegebene Uhrzeit" in Mission
// die hier angegebene Zeit ist dann der Default Wert der Mission, Schaltet den Lobbyparameter frei um die Zeit vor Missionsstart zu wählen
// ACHTUNG: Dafür muss die Missionszeit auf 0:00 Uhr gestellt werden
#define __STARTTIME__ 12

// wenn nicht auskommentiert mit // dann legt das die Viewdistance für die Spieler und den Server fest
#define __VIEWDISTANCE__ 3500

// wenn nicht auskommentiert mit // dann kann in der Lobby die Voreinstellung getroffen werden und der Spieler
// per Dialog ingame das Gras an/abschalten
//#define __GRASS_OFF__

// wenn nicht auskommentiert mit // dann sieht man bei allen spielbaren Einheiten den Atem
//#define __BREATH_VISIBLE__

// wenn nicht auskommentiert mit // dann kann der Spieler selbst die Sichtweite bestimmen und Gras an/abschalten
//#define __PLAYER_GRAPHIC_SETTINGS__

// wenn nicht auskommentiert mit // wird ein Intro mit autmoatischer Kamerafahrt gestartet
// benötigt 2x unsichtbares Heli-H ---> tcb_camstart & tcb_cam_dir
#define __INTRO_ENABLED__


/**
* Gameplay 
*/

// wenn nicht auskommentiert mit // kann an Servicepunkten keine Munition mehr aufgenommen werden (nur noch Repair / Refuel)
#define __OPT_SERVICE_NO_AMMO__

// wenn nicht auskommentiert mit // kann an FARP's keine Munition und Fuel mehr aufgenommen werden (nur noch Repair)
#define __OPT_FARP_NO_AMMO__

// wenn nicht auskommentiert, werden alle Sektor-Flaggen mit einem Marker versehen
#define __OPT_FLAG_MARKER__

// wenn nicht auskommentiert mit // wird eine Textnachricht angezeigt wenn eine Flagge gezogen wird und die Marker wechseln die Farbe
//#define __OPT_Sector_Message__

// wenn nicht auskommentiert mit // wird First Person ausserhalb von Vehikeln forciert
#define __FIRSTPERSON__

// wenn nicht auskommentiert mit // dann werden die Waffen und Ausrüstung des Spielers zum Todeszeitpunkt gespeichert
// macht nur Sinn wenn es einen Respawn gibt
#define __WEAPON_SAVER__

// wenn nicht auskommentiert mit // dann werden tote KI Einheiten und zerstörte KI Fahrzeuge nach einiger Zeit gelöscht
// ACHTUNG! in dem Array müßen die Seiten angegeben werden welche gelöscht werden sollen
#define __REMOVE_DEAD_AI_AND_VECS__ [east,resistance,west]

// wenn nicht auskommentiert mit // dann werden für definierte Spieler Marker auf der Karte erzeugt
// sollen alle Spieler einen Marker erhalten muß auch jeder einzeln unter dem Array tcb_p_entities definiert werden --> siehe setup_classnames.sqf
//#define __SHOW_CUSTOM_PLAYERMARKER__

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

#define __BLOOD_SCREEN__


/**
* Utilities
*/

// auskommentieren und weder der Spieler noch sonst eine KI Einheit hat ein NVG
//#define __NO_NVG__

// wenn nicht auskommentiert mit // spawnen alle Units (auch Spieler) ohne Map. Die Map muss explizit hinzugefügt werden (player/unit addWeapon "ACE_Map")
//#define __MAP__

// wenn nicht auskommentiert mit // verlieren die Spieler im Wasser nicht mehr ihre Austrüstung
#define __STOP_ITEMS_DROPPING__


#ifdef __DEBUG__
#define __TRACE(tmsg) diag_log format ["T%1,DT%2,F%3,%4,'%5'", time, diag_tickTime, diag_frameno, __LINE__, tmsg];
#define __TRACE_1(tmsg,parame1) diag_log format ["T%1,DT%2,F%3,%4,'%5',%6: %7", time, diag_tickTime, diag_frameno, __LINE__, tmsg, parame1, call compile format ["%1", parame1]];
#define __TRACE_2(tmsg,parame1,parame2) diag_log format ["T%1,DT%2,F%3,%4,%5,'%6',%7: %8,%9: %10", time, diag_tickTime, diag_frameno, THIS_FILE_, __LINE__, tmsg, parame1, call compile format ["%1", parame1], parame2, call compile format ["%1", parame2]];
#define __TRACE_3(tmsg,parame1,parame2,parame3) diag_log format ["T%1,DT%2,F%3,%4,%5,'%6',%7: %8,%9: %10,%11: %12", time, diag_tickTime, diag_frameno, THIS_FILE_, __LINE__, tmsg, parame1, call compile format ["%1", parame1], parame2, call compile format ["%1", parame2], parame3, call compile format ["%1", parame3]];
#else
#define __TRACE(tmsg)
#define __TRACE_1(tmsg,parame1)
#define __TRACE_2(tmsg,parame1,parame2)
#define __TRACE_3(tmsg,parame1,parame2,parame3)
#endif

/**
* Ingame HUD Overlay
*/
// alle Optionen können durch "//" auskommentiert werden
// nur nicht auskommentierte Optionen werden angezeigt.

// globale Option, schaltet das ganze HUD aus, wenn auskommentiert
#define __HUD_ON__

#define __HUD_NUMBER_PLAYERS__

//#define __HUD_FPS__

#define __HUD_BUDGET__

#define __HUD_SCORE__

#define __HUD_TIMER__