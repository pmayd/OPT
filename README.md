# OPT
Github der Operation Pandora Trigger

## Maintainer
[3.Jgkp]James

## Version
Aktuelle Version ist 1.03 
Name: [J]OPT_v1_03

## Current Work

* Codebasis durchsehen, verstehen, wo veraltet ersetzen
* am liebsten die komplette Funktionssammlung net rausschmeißen und durch CBA Eventhandling ersetzen, wesentlich lesbarer und sauberer
* Features sichten, Liste neuer Features sammeln, alte Features, die nicht gebraucht werden löschen

## SITREP

### 2017-04-06
- Einbau eines neuen Reparatur-Systems für Auftanken und Reparieren via Aktionmenü
- Umbau der Draw3D-EH für Crewerkennung auf EH "Getin" beim Spawn

### 2017-04-03
- Umstellung auf Event Scripts abgeschlossen (initPlayerLocal.sqf und initServer.sqf)
- Respawn-Kosten implementiert. onPlayerRespawn.sqf regelt jetzt den Abzug von 5000 € pro Respawn. Einstellbar wie immer in der setup.sqf
- umfangreiche Änderungen an allen Skripten, Coderefactoring, einheitliche Benennung
- umfangreiche Änderungen an der onPlayerRespawn, das meiste ist in die init.sqf btw. i_client.sqf gewandert. TODO: Umstellen auf initPlayerLocal.sqf. In der onPlayerRespawn ist jetzt nur noch, was unbedingt nach einem Respawn erneuert werden muss -> AddAction Einträge. Alle MissionEH wie Draw3D sind persistent und müssen nicht erneuert werden.
- Zeitupdate jetzt auch auf der Karte dank MissionEH "Map"
- überarbeitete Killed-Log: Ab sofort wird bei einem zerstörten Fahrzeug auch der Zerstörer angezeigt
- Performanceoptimierung: Dauerabfrage durch AddAction Skript flipVehicle entfernt, dies jetzt beim spawn an Fahrzeug geheftet. 
- alle Setup-Dateien in einen neuen Unterordner setup verlegt. Einige Dateien werden noch dazukommen wie die vehicle.hpp
- Neue EH per CBA EH-System für Server-Logs und Budget Updates
- Überarbeitung des Bestell-Systems, jetzt mit Verkaufoption
- neue Optionen in der setup.sqf für das Verkaufsystem

### 2017-03-21
- description vereinheitlicht
- `init.sqf` umfangreich geändert, kompletten Anfangscode entsorgt, Parameterauslese deutlich verschlankt. TODO: Aufteilen in initServer und initLocalPlayer
- mission.sqm debinarisiert


### 2017-03-19
- ``setup.sqf`` überarbeitet, neue Parameter für HUD, kann jetzt ganz ausgestellt bzw. individuell angepasst werden (jedes Feld ein/ausblendbar). FPS per default aus
- Flaggen werden jetzt automatisch erkannt. Umfangreiche Änderungen an `setup_classnames.sqf`, `opt_flag.sqf`, `fn_setFlagOwner.sqf` und anderen beteiligten Skripts. Komplett überholt. Alle Flaggen, deren Variablenname mit `OPT_CSAT_FLAG` bzw mit `OPT_NATO_FLAG` beginnt, werden automatisch als Sektorflaggen erkannt und auf der Karte markiert (einstellbar in `setup.sqf`). Ebenso wird automatisch ein Actionmenüeintrag hinzugefügt, der es erlaubt, die Flagge zu ziehen. Eintrag ist nur sichtbar, wenn Mission gestartet (nach Waffenruhe) und wenn noch Spielzeit übrig (playTime > 0). Code stark refactored und vereinfacht.
- Timer-Anzeige im HUD-Display komplett überarbeitet. Statt im Hintergrund `playTime`, `truceTime` und was weiß ich nicht alles zu sync, wird jetzt `serverTime` verwendet, da bereits in der Engine synchron für alle Clients. Da `serverTime` den Start des Servers anzeigt (also nicht Missionsbeginn, sondern Zeitpunkt ab dem der Server läuft), wird einmalig zu Missionsbeginn die aktuelle Serverzeit als Public Variable `opt_startTime` synchronisiert. Jeder Client kann daraus die noch verbleibende Zeit wie folgt berechnen: 
```SQF
(OPT_PLAYTIME - (serverTime - opt_startTime)) 
```
#### TODO
- [x] JIP testen!
- player respawn komplett umgestellt. `fn_playerrespawn.sqf` gelöscht, ebenso irgendwelche dubiosen Eventhandler und jede Menge boiler plate code. Einfach eine `onPlayerResapwn.sqf` in root eingeführt und dort den Inhalt aus `jip.sqf` reingetan. Dazu in `description.ext` den Parameter respawnOnStart auf 0 gesetzt. Funktioniert bisher ohne Fehler.
