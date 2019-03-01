// hier bitte alle Variablen anlegen, die man in irgendeiner Weise
// einstellen können soll oder irgendwann mal ändern will
// Beispiele: Add-Action Texte, Variablen, Konstanten, Marker etc
// #define MEIN_MAKRO ...
#define TIME_ELAPSED (serverTime - GVAR(startTime))
#define PLAY_TIME_LEFT (PLAY_TIME_IN_SECONDS + FREEZE_TIME_IN_SECONDS - TIME_ELAPSED)
#define UPDATE_TIME estimatedTimeLeft (PLAY_TIME_LEFT)

#define MISSION_IS_RUNNING GVARMAIN(eastHasWon) == 0 and \
 GVARMAIN(westHasWon) == 0 and \
 GVARMAIN(draw) == 0 and \
 (PLAY_TIME_LEFT) > 59

#define FREEZE_TIME_IN_SECONDS EGVAR(freeze,freezeTime) * 60
#define TRUCE_TIME_IN_SECONDS GVAR(truceTime) * 60
#define PLAY_TIME_IN_SECONDS GVAR(playTime) * 60