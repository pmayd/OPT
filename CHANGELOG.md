# Changelog

## 1.4.10

### Skript

- Radar: work on [#2](https://github.com/Jamesadamar/OPT/issues/2), Code-Überarbeitung der Komponente
- Beam: Umstellung auf CBA-Tastenzuweisung (default F2)

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