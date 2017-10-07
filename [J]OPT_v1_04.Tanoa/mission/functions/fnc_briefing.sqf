#include "script_component.hpp"

if (isDedicated) exitWith {};
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
	Dynamisches Gruppen System	-	Teamwechsel Taste ('U')<br/><br/>
	Ohrstöpsel Rein/Raus  -	 Linke Windows Taste<br/><br/>
	Maintainer Menü  -  Rechte Windows Taste (nur für MT)<br/><br/>
	Magazine Neupacken  -  Strg + R (CTRL + R)
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

/////////////////////////////////////////////////Missionsziele/////////////////////////////////////////////////
/*
[
	true,																			//	0: BOOL or OBJECT or GROUP or SIDE or ARRAY - Task owner(s)
	"tcb_task_example",															//	1: STRING or ARRAY - Task name or array in the format [task name, parent task name]
	["Wait in <marker name=""Gov"">Gov. Parking</marker> for orders.", "Wait here", "Wait"],		//	2: ARRAY - Task description in the format ["description", "title", "marker"]
	"Gov",																		//	3: OBJECT or ARRAY or STRING - Task destina
	true,																			//	4: BOOL or NUMBER or STRING - Task state (or true to set as current)
	0																			//	5: NUMBER - Task priority (when automatically selecting a new current task, higher priority is selected first)
] spawn BIS_fnc_taskCreate;
*/