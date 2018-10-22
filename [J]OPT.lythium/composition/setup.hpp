// hier bitte alle Variablen anlegen, die man in irgendeiner Weise
// einstellen können soll oder irgendwann mal ändern will
// Beispiele: Add-Action Texte, Variablen, Konstanten, Marker etc

#define COMPOSITION_DEPLOY_ERROR_MESSAGE(val1) format["Aufbau nicht möglich! Bitte einen freien Platz (%1m) ohne Häuser und Bäume finden.", round val1]

#define COMPOSITION_DEPLOY_BLACKOUT_TEXT "Aufbau der Komposition..."
#define COMPOSITION_UNDEPLOY_BLACKOUT_TEXT "Abbau der Komposition..."

#define COMPOSITION_DEPLOY_TEMPLATE_NAME "RespawnAdded"
#define COMPOSITION_DEPLOY_TEMPLATE_TITLE "Mobiles HQ"
#define COMPOSITION_DEPLOY_TEMPLATE_DESC(val1) format ["Mobiles HQ aufgebaut im Planquadrat %1", mapGridPosition (getPos val1)]
#define COMPOSITION_DEPLOY_TEMPLATE_ICON "\A3\ui_f\data\map\markers\nato\n_hq.paa"

#define COMPOSITION_RADIUS_NEARBY_PLAYER 25