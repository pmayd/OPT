#include "script_component.hpp"

/*
_subject = player createDiarySubject ["made", "Credits"];
_log_briefing = player createDiaryRecord ["made", ["Mapbuilding", "
-------------------------------------------------------------------------------------<br/>
    <img image='pics\psy_logo.paa' width='128' height='128' /><br/>
-------------------------------------------------------------------------------------<br/>
by Psychobastard in 2014 (v1.00), based Mission idea from Blackmail"]];
_log_briefing = player createDiaryRecord ["made", ["build on", "
Build on Mission and Script Template from Psychobastard (v2.05)"]];

_log_briefing = player createDiaryRecord ["made", ["External", "
External Scripts:<br/>
Netcode Function by Xeno<br/>
Spectating Script by Kegetys<br/>
Death-Dialog by Psychobastard<br/>
"]];
*/

//////////////////////////////////////////////////Notizen//////////////////////////////////////////////////////
_subject = player createDiarySubject ["keys", "OPT Eigenschaften"];
_log_briefing = player createDiaryRecord ["keys", ["Tastenbelegung","
	OPT HUD ein-/ausblenden	- F1 (konfigurierbare Tastenbelegung unter OPT)<br/><br/>
"]];
_log_briefing = player createDiaryRecord ["keys", ["Feldreperatur", "
	Realistisches Feldreperatur script von Zealot: <br/> Das Script erlaubt es jedem Spieler, beschädigte Fahrzeuge einmalig mit Ersatzteilen zu reparieren. <br/>- Die Reparatur dauert je nach Schweregrad des Schadens zwischen 30 und 240 Sekunden. Die Reparatur kann abgebrochen und an der gleichen Stelle wieder aufgenommen werden. <br/>- Jedes Fahrzeug kann einmalig mit vorhandenen Ersatzteilen repariert werden. Danach benötigt man eine Werkzeugbox im Rucksack (nur Pio-Slots). <br/>- Reparaturen stellen das Fahrzeug nicht immer wieder komplett her (manche Teile bleiben gelb).<br/>- Reparaturen an Rep-LKW dauern 3 Minuten und stellen die Fahrzeuge komplett wieder her. Ein Rep-LKW kann 5 mal für Reparaturen genutzt werden, danach sind die Ersatzteile in ihm erschöpft.<br/>- Um den Rep-LKW zu nutzen, einfach auf den Fahrersitz setzen und mit Blick auf das beschädigte Fahrzeug und Komplettreparatur auswählen!
"]];
_log_briefing = player createDiaryRecord ["keys", ["Fahrzeug Bestellung", "
	Die Bestellung spezifischer Fahrzeuge ist nur durch Fachkräfte möglich.<br/><br/>
	D.h. nur Piloten können Helis bestellen und nur Besatzungsmitglieder können schwere Fahrzeuge ordern. Offiziere und Gruppenführer können jedes Fahrzeug anfordern.
"]];
_log_briefing = player createDiaryRecord ["keys", ["Fahrzeug Nutzung", "
	Spezielle Fahrzeuge können nur mit der entsprechenden Ausbildung bewegt werden.<br/><br/>
	D.h. nur die spezifische Spielerklasse kann bestimmte Fahrzeuge bewegen. Beispielsweise nur Piloten können fliegen und nur Besatzungsmitglieder können schwere Fahrzeuge fahren oder deren geschütze verwenden.
"]];

// call OPT specific items
if (OPT_PARAM_TFAR_INTERCEPTION) then {
	_log_briefing = player createDiaryRecord 
    [
        "keys", 
        [
            "gegnerischer Funk", 
            "Die Option um gegnerischen Funk (Vehicle Radios) abhören zu können ist aktiv! Die eingestellte gegnerische Frequenz kann beim Entern eines gegnerischen Fahrzeuges jedoch nicht direkt abgelesen werden sondern muss selber gefunden werden."
        ]
    ];
};

if (EGVAR(training,on)) then {
	player createDiarySubject ["Training", "Training"];
	player createDiaryRecord ["Training", ["Flaggen verschieben", "
	Im Trainingsmodus kann jeder Spieler die CSAT und NATO Flagge verschieben. Dazu einfach auf der Karte ALT + Linksklick auf die Flaggenmarkierung. Unten links erscheint ein Text, wenn die Aktion erfolgreich war. Wurde die Flagge ausgewählt, so kann mit erneutem ALT + Linksklick die neue Position gewählt werden.
	"]];

	player createDiaryRecord ["Training", ["Zeus", "
	Im Trainingsmodus hat jeder Gruppenführer Zugriff auf Zeus und kann so das Training für seine Gruppe gestalten.
	"]];

	player createDiaryRecord ["Training", ["Teleport", "
	Im Trainingsmodus kann jeder Spieler den Teleport benutzen. Dieser findet sich im Mausradmenü unter Teleport. Einfach auf der Karte den gewünschten Zielort auswählen. Innerhalb von Fahrzeugen wird auch das Fahrzeug teleportiert.
	"]];
};
