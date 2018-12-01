# Changelog

## 1.4.15

### Skript

- Neue Komponente serverclock (Missionsuhr): steuert die globale Zeit und händelt Freeze, Waffenruhe und Spielzeit sowie Endbildschirm
- HUD: Fehler zu fehlender startTime wird nicht mehr ausgegeben
- Freeze: Freeze nun wieder aktiv (war vorrübergehend wirkungslos)
- Intro: Fehler in Anzeige der Autoren behoben
- Revive: Marker für bewusstlose Einheiten werden jetzt vom GPS-System gehandhabt, d.h. in Echtzeit aktualisiert. Dadurch kommt es nicht mehr zu "Ghost"-Markern an falscher Stelle

### Editor


## 1.4.14

### Skript

- GPS und Revive: Löschskript für Marker im Falle von Disconnects überarbeitet
- Flagpositions (für die prologschlacht) -> setupflagpositions.sqf
- Beampositionen (für die prologschlacht) -> setupbeamorte.sqf
- Beamfix aus github dev-bereich (sollte in deiner letzten version ja schon mit drin sein)
- TFAR-settings für kanäle neu gesetzt 
- Addonsettings - sind glaub eh in der mission mit drin von daher zu vernachlässigen! check ich dann alles nochmal neu und speicher das profil! wenn dir da ein weg zufliegt, dass als ...settings.sqf direkt in die mission zu packen, wär super!
- cargosystem für modupdate angepasst -> setcargoandspace.sqf
- warehouse für modupdate angepasst -> setupvehiclepool.sqf
- MHQ tarnnetze aus komposition entfernt - aber immer noch scheisse aufzubauen!
- Warehouse: Ab sofort gibt es eine verbesserte Möglichkeit, für Wracks Garbage Collectoren (Trigger) zu platzieren. Somit sind ab sofort alle Basen und Flugfelder mit Triggern ausgestattet, die zerstörte Wracks automatische löschen. Früher gab es nur einen kreisrunden Bereich um die Basis, jetzt beliebige Flächen möglich
- ifrit hmg und gmg in waffenscript gefixt - erlaubte vehikelliste in der waffenconfig.hpp
- bewaffnungspads für extrabasen nachgetragen - in postinit.sqf

### Editor

- Neue Version mit je zwei diagonalen Basen
- loadoutanpassungen bei allen infern (mündungsfeuerbremse, handguns raus, primärwaffenmuni +2, SQLs nun mit 40mm HE etc, Recon-AT NATO wieder mit schalli)
- neue flaggenposi-baukram von oppa eingebaut
- marker in basen überprüft und angepasst (teleport csat, diverse verschiebungen)

## 1.4.13

### Skript

- Waffenwechsel: Log ist nun aussagekräftiger und enthält keine Leerstellen mehr
- Revive: Probleme mit Down-Marker behoben. Marker sollte nicht mehr länger sichtbar sein.
- GPS: Komponente sowie Skripte wurden überarbeitet. Probleme mit JIP sollten behoben sein. Performance verbessert

### Editor

- Port nach Lythium
- Kleine Fixes in diversen Triggern für korrekte Anzeige von Nachrichten

## 1.4.12

### Skript

- Waffenwechsel: Neue Komponente hinzugefügt. Aufruf via Taste CBA Keyhandler, default "F3" (selbst wählen beim ersten Mal!).
- Letzte Änderungen an allen Komponenten zum Austausch von CBA Eventhandlersystem durch remoteExec
- MHQ: Bugfix: Aufbau-Message wird nicht mehr global angezeigt
- Fieldrepair: Funktioniert wieder für alle gespawnten Fahrzeuge. Umstieg von servercall auf clientcall
- Sectorcontrol: Bugfix: HL kann keine Feindflagge mehr wählen
- Beam: Abschalten der Komponente erlaubt noch Beamen zu Orten mit Level -1 (Marinebasen)
- Waffenwechsel: Ich habe das Modul etwas umgeschrieben , damit du alles in der fnc_waffenconfig.sqf einstellen kann. du brauchst nicht mehr in der fnc_onLoadDialog.sqf was bearbeiten. Das müssen wir erster machen wenn sich gurndlegen etwas ändert oder neue Fahrzeuge hinzugefügt werden müssen. Die Boxen werden nun dynamisch beschrifte, so das man weis was es für eine box ist. Die Textmeldung ist jetzt wieder lokal und die Offiziere bekommt es Extra Meldung wer was gekauft hat. Und ich habe eine möglichen Fehler durch die Umstellung von James behoben , das das Geld nicht abgezogen wird. Das muss noch mal auf dem Server getestet werden zu Sicherheit. 
- Service-Pad: Bugfix: Pad wieder funktionstüchtig. Neue Kosten für Repair und Refuel in den CBA Settings einstellbar. Neue Meldung, dass Motor abgestellt werden muss. Neue Prüfungen für die Aktionmenüeinträge, wird nur noch angezeigt, wenn Fahrzeug beschädigt oder nicht 100% Treibstoff.
- Beam: Bugfix: Aufruf des Beam-Dialog nicht mehr möglich, wenn Kisten gezogen oder getragen werden
- Sectorcontrol: Flaggen besitzen jetzt einen Marker für die Minensperrzone (per Skript)
- Service-Pad: Bugfix für falsche Preisanzeige
- Beam: Bugfix für Skriptfehler bei Mausradmenüeintrag an Fahne
- Composition: Ab sofort lässt sich das Radar nicht mehr aufbauen, wenn das Gelände nicht geeignet ist.

### Mission

- Waffenwechsel: Neue Trigger für Dialogöffnen hinzugefügt
- Ab sofort werden alle CBA Settings in der mission.sqm gespeichert, sonst kein JIP sicher!
- Änderungen an den Triggern für Service-Pad und Beam (Zahl am Ende durch Kopieren!)
- Änderungen an den Flaggen für Beam-Eintrag (Aufruf von opt_beam_function_openDialog)
- Änderungen an den Waffenwechsel-Triggern: Korrektur der lokalen Nachrichten, Entfernen von hint-Meldungen

## 1.4.11

### Skript

- umfangreiche Änderungen an allen Komponenten: Möglichkeit, optionale Komponenten an/aus zu stellen über CBA-Settings
- umfangreiche Änderungen an allen Komponenten: Performanceverbesserungen, Umstieg von CBA EventHandler auf remoteExec
- umfangreiche Änderungen an allen Komponenten: Performanceverbesserungen, Umstieg von onEachFrame Mission EH auf while-Schleifen
- Möglichkeit, Update-Intervall für GPS und RADAR in den CBA-Settings clientseitig einzustellen
- Log: Neur FPS-Log am Ende der Schlacht mit allen FPS-Werten sowie gemittelten Werten
- Log: Transportdistanz wird nun auch für Flugzeuge geloggt
- Persistence: Grundgerüst hinzugefügt
- MHQ: Alpha Version hinzugefügt
- Sectorcontrol: Flagge kann jetzt mit einer Taste gezogen werden (default: F)

## 1.4.10

### Skript

- Radar: work on [#2](https://github.com/Jamesadamar/OPT/issues/2), [#14](https://github.com/Jamesadamar/OPT/issues/14), Code-Überarbeitung der Komponente
- Beam: Umstellung auf CBA-Tastenzuweisung (default F2)
- Mission: work on [#15](https://github.com/Jamesadamar/OPT/issues/15), Bugfix Backpack on Chest, Rucksack wird jetzt nach Respawn wieder zugeteilt
- Revive: work on [#7](https://github.com/Jamesadamar/OPT/issues/7), Schaden wird nun noch genauer geprüft
- Warehouse: work on [#19](https://github.com/Jamesadamar/OPT/issues/19). "Any" Budgetproblem beim Verkauf behoben. Gegenstände mit Verkaufspreis 0 werden nicht mehr angezeigt.
- Deadmanswitch: work on [#18](https://github.com/Jamesadamar/OPT/issues/17): Bei Bewusstlosigkeit werden alle Sprengladungen mit Deadmanswitch gezündet und der Trigger aus dem Inventar gelöscht
- Log: work on [#17](https://github.com/Jamesadamar/OPT/issues/18) Kill-Log überarbeitet, nun mit Angabe des Magazines sowie Anpassung der Log-Zeile auf neuen Standard (vehicle:)(side:)(magazine:)(category:)
- Log: work on [#17](https://github.com/Jamesadamar/OPT/issues/18) Kill-Log überarbeitet für den Fall Fahrzeugabschuss durch Fahrzeug: Jetzt wird der gesamten Besatzung ein Kill angerechnet.
- Merge mit Schlachtversion #9, Anpassung an diversen Skripten wie setupbeamorte, setupflagpositons, setupcargosizeandspace 
- Radar: work on [#27](https://github.com/Jamesadamar/OPT/issues/27) Bugfix im Radar-Modul, jetzt ist es wieder möglich, mit dem Feindradar zu interagieren 

## 1.4.9

### Skript

- fix [#5](https://github.com/Jamesadamar/OPT/issues/5)
- Sortierfunktion für Kaufpads wieder deaktiviert
- fix [#9](https://github.com/Jamesadamar/OPT/issues/9)
- fix [#10](https://github.com/Jamesadamar/OPT/issues/10)
- first version for #12
- fix for #13

## 1.4.8

### Skript

- Radarscript: Radar zeigt keine HuntIR mehr (Lord)
- Warehouse: Platzabfrage wird nun vom Server vorgenommen
- GPS: Bugfix für "False"-Marker (Lord)
- tfar anpassungen wegen neuer version und neuer kanäle
- Warehouse: neue Option zum Räumen des Bestell-Pads. Achtung: KEIN GELD ZURÜCK!
- San-System: Nächster Medic wird nun korrekt angezeigt
- Main: Lösche Funkgeräte von Leichen
- Bugfix: Take EH für Einheiten überarbeitet
- Fahrzeugkills werden nun mit Klasse Leicht, Schwer, Flug geloggt
- Log: Kauflog nun mit Käufer und Fahrzeugtyp
- Sektorcontrol: Verbesserte Abfrage bei Minenplatzierung. Minensperre greift nicht mehr bei Satchel und Charge
- Bugfix: Fehler im Respawn-Log. Kosten werden wieder korrekt berechnet.
- Bugfix: Anpassung im Respawn-Log. Keine Kosten mehr, dafür korrekter Log bei Budget-Meldung
- Bugfix: Respawn-Counter wieder aktiv
- Bugfix: Marine-Basis: Fahrzeuge können wieder gekauft werden

### Editor

- TFAR-Module angepasst
- sämtliche Einheiten wegen Classnames (Waffen und Funken) überprüft und bearbeitet
- 5 fehlerhafte Dekoobjekte (SAM-Stellungen) entfernt
- Spawnpunkt am NATO-Marinepunkt verschoben wegen spawn im Wasser

## 1.4.7

### Skript

- offestpunkte in cargo/initcbaevents erneut angepasst
- offestpunkte in cargo/setupcargoand size erneut angepasst
- verkaufspreise bei kisten in warehouse/setupvehiclepool eingetragen
- Bugfix: Fahrzeugkills wieder verfügbar im Log + Fix für Spielerseite bei Fahrzeugkill
- Versuch, Leiche bei disconnect zu löschen
- Bugfix: Revive hängt nicht mehr in Animationen fest, nach Revive kein Auf-den-Rückenliegen mehr
- Marker: Zeitstempel jetzt optional an/aus
- preislisten in setupVehiclePool angepasst
- radarcontainer NEU in setupcargoandsize nachgetragen
- ausbaustufen der sektoren gesetzt
- TFAR->setfrequencies - csat-frequenzen aktualisiert (20.3.)
- beam und flaggenposis aktualisiert und alphabetisch sortiert + staroye an csat lvl1 (20.3.)
- setupvehiclepool angepasst - preise stand-AT, khs und xian (20.3.)

### Editor

- radarcontainer nato und csat ausgetauscht
- basenänderungen der fraktionen implementiert
- infslots neu gesetzt und gruppiert
- basenbilchen repariert und als paa verlinkt
- ghillies der grossen sniper getauscht (20.3.)
- tfar-modul auf karte gesetzt und eingestellt (29.3.)

#### Settings

TODO!

- classnames für sprengstoffexperten (leider nicht mehr gefunden)
- neue bilder als paa in mod einbauen

## 1.4.6

### Skript

- Bugfix Classnames in GPS + UAV Komponente
- neue Classnames in setupVehiclePool (Vanilla)
- Bugfix: Bestellpad liefert jetzt auch beim Sortieren korrektes Fahrzeug
- Bugfix: Hellcat und andere Fahrzeuge wurden beim spawn beschädigt
- Bugfix: Crew und Pilotenplätze werden wieder gesperrt
- Ohrstöpsel eingefügt
- Bugfix: GPS aktualisiert nun korrekt
- Bugfix: Spieler wurden als Fahrzeuge gewertet
- Bugfix CSAT Flagge wurde falsch erkannt
- Bugfix: CBA Settings jetzt korrekt für client verfügbar bzw. nicht überschreibbar
- Respawnkosten eingefügt, neue CBA settings für min und max Kosten, Respawn-Button zeigt nun Kosten, Log korrigiert
- Bugfix: Spawn von gewissen Fahrzeugen verursacht Schaden. Gelöst durch neue Spawnlogik. Unverwundbar-Bug ebenfalls behoben
- Bugfix: Transport wird wieder korrekt geloggt
- Change: Fieldrepair repariert jetzt grundsätzlich alle Teile zu 90%. Pios werden jetzt anhand der Klasse erkannt und nicht mehr der Toolbox.
- Feature: Fieldrepair merkt sich jetzt die Zeit, die bereits mit der Reparatur verbracht wurde
- Beam: Beam jetzt immer verfügbar und Liste wird nach Waffenruhe bereinigt, nur Marinebasis bleibt verfügbar. Keine Fehlermeldung mehr. Log eingebaut.
- Bugfix: log für captureFlag
- critical Bugfix: missionEH sind global, lösen daher bei jedem client aus -> massives MP Problem. alle missionEH auf Server übertragen!
- Bugfix: Transport log mehrfach vorhanden
- Revive: Sanitäter stabilisieren nun erst, wenn Patient noch instabil. Restschaden einheitlich auf 25% sowie Beinschaden auf 50% (verhindert schnelles Laufen). Animationshandler entfernt.
- Feature: Neue Möglichkeit der Erstversorgung für alle Einheiten über ACE Eigenmenü. Beginnt bei 15% Schaden (CBA Settings) und wird mit jedem Heilvorgang schlechter (CBA Settings)
- neue Komponente marker: Versieht Kartenmarker mit automatische Zeitstempel
- Bugfix Marker: missionEH muss bei jedem Player sein, dadurch Umbau auf lokalen Funktionsaufruf. Einbau einer "0" bei Zahlen kleiner 10.
- Bugfix Beam: Zahlfeld entfernt, Schrift weiß plus größer
- Bugfix Earplugs: Bei Respawn wieder raus
- Bugfix Verkauf: Budget wird korrekt aktualisiert
- Verkaufsystem: Verkauf fremder Fahrzeuge für 150% des Kaufpreises
- Bugfix Teleport: Teleport nach Respawn aus Fahrzeugen wieder möglich

### Editor

- Garbage-Collector: Eingestellt auf 3-5 Minuten für Personen und 10-15 für Fahrzeuge
