// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
#define FAR_REVIVE_BLEEDOUT 600
// Show killer's name (only local to the killed)
#define FAR_REVIVE_DEATH_MESSAGE true
// Enable 3D icons
#define FAR_REVIVE_3D_ICONS true
// Enable markers
#define FAR_REVIVE_DOWN_MARKER true
// Enable hint to show distance of next medic
#define FAR_REVIVE_CALL_NEARBY_MEDICS false
// how much damage the player can take before he gets unconscious
#define FAR_REVIVE_MAX_DAMAGE 0.95
// player will be informed about medics within this radius
#define FAR_REVIVE_NEARBY_MEDIC_DISTANCE 300

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
	3 = Same as 0 but a medikit is required to revive
*/
#define FAR_REVIVE_MODE 3

#define FAR_REVIVE_ACTION_REVIVE "Wiederbeleben"
#define FAR_REVIVE_ACTION_STABILIZE "Stabilisieren"
#define FAR_REVIVE_ACTION_SUICIDE "Aufgeben"
#define FAR_REVIVE_ACTION_DRAG "Ziehen"
#define FAR_REVIVE_ACTION_DROP "Ablegen"
#define FAR_REVIVE_ACTION_REVIVE_MENU_TEXT 

#define FAR_REVIVE_ACTION_REVIVE_BAR_TEXT "Erstversorgung wird %1 s in Anspruch nehmen..."
#define FAR_REVIVE_ACTION_REVIVE_PATIENT_DIED "Für diesen Kameraden kommt jede Hilfe zu spät."
#define FAR_REVIVE_ACTION_REVIVE_CANCLED "Du hast den Vorgang abgebrochen."

#define FAR_REVIVE_MARKER_TYPE "loc_Hospital"
#define FAR_REVIVE_MARKER_COLOR "ColorRed"
#define FAR_REVIVE_MARKER_ALPHA 0.7

#define FAR_REVIVE_ACTION_STABILIZE_BAR_TEXT "Stabilisieren wird %1 s in Anspruch nehmen..."
