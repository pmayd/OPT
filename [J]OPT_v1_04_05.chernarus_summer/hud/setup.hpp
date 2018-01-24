// positions for info display which includes:
#define PLAYERSLABEL_X      0.02 	// number of players
#define FRAMELABEL_X        0.28 	// avg frames
#define HEADINGLABEL_X      0.25 	// score
#define TIMERLABEL_X        0.47 	// time remaining
#define FRAMELABEL_X        0.28 	// avg frames
#define BUDGETLABEL_X       0.38 	// budget

#define HEADINGLABEL_Y      0.95	// score
#define PLAYERSLABEL_Y      0.95	// number of players
#define TIMERLABEL_Y        0.95	// time remaining
#define FRAMELABEL_Y        0.95	// avg frames
#define BUDGETLABEL_Y       0.95	// budget


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
