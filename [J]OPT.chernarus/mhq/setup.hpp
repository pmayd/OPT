// hier bitte alle Variablen anlegen, die man in irgendeiner Weise
// einstellen können soll oder irgendwann mal ändern will
// Beispiele: Add-Action Texte, Variablen, Konstanten, Marker etc
#define MHQ_TELEPORT_ACTION_DISTANCE 8

#define MHQ_NOTIFICATION_TEMPLATE "RespawnAdded"
#define MHQ_NOTIFICATION_TITLE "Nachschubpunkt"
#define MHQ_NOTIFICATION_DESC(val1) format ["Mobiles HQ errichtet bei %1", mapGridPosition (getPos val1)]
#define MHQ_NOTIFICATION_ICON "\A3\ui_f\data\map\markers\nato\b_hq.paa"

#define MHQ_ACTION_DEPLOY "Mobiles HQ aufbauen"
#define MHQ_ACTION_UNDEPLOY "HQ abbauen"

#define MHQ_ACTION_TELEPORT_MANY(val1) format ["Zu HQ-%1 verlegen", val1]
#define MHQ_ACTION_TELEPORT_ONE "Zu HQ verlegen"