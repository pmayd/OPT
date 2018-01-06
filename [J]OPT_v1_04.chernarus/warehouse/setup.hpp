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