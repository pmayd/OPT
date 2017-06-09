# OPT
Github der Operation Pandora Trigger

## Maintainer
[3.Jgkp]James

## Version
Aktuelle Version ist 1.03_06

Name: [J]OPT_v1_03_06

## Current Work

* Nicht mehr gebrauchte Skripte löschen
* Fehler beheben, gewünschte Verbesserungen durchführen

## SITREP

### 2017-06-09
- Log System überarbeitet: Neuer Serverlog für Punktestand und Endstand, Ziehen von Flaggen
- Intro Synchronization entfernt, spielt nun wieder zu Beginn
- Fahrzeugabschusslog nicht mehr MPKilled, wodurch Mehrfachlog ausgelöst wurde für jeden Client
- Spielerabschusslog jetzt in FAR revive enthalten, dadurch wieder korrekter Log
- Log aus killed EH entfernt
- Handle Damage EH in FAR Revive komplett überarbeitet -> Bug in Vanilla, der bei Beinschuss Schaden abnorm hoch setzt. Aktuell wird Gesamtschaden (hitSelection "") ignoriert, so dass nur der Schaden der einzelnen Teile zählt. TODO: TESTEN
- eigener DamageHandler, der Kopfschüsse mit 1.3 verstärkt, Arm- und Beintreffer mit 1.2, Rest unverändert. TODO: TESTEN
- Bugfix Schaden in Fahrzeugen wurde nicht auf Spieler übertragen, jetzt wird der Spieler wieder unmächtig und automatisch ausgeladen
- Bugfix: Manchmal Unmächtigkeit ohne Bleedout Timer. Denke ich habe es behoben
- Radarfix
- Uhrzeit Parameter entfernt
- Garbage Collector wieder eingestellt....
- GPS Drohnenanzeige korrigiert, statt KI jetzt UAV (operator)
- Überarbeitung GPS: Spieler in Fahrzeugen werden jetzt mit Fahrzeugnamen angezeigt. TODO: Löse Anzeige bei mehreren Insassen

### 2017-06-05
### Kalle
- Anpassung der Basen
- Preisanpassungen an vehiclePool_War.hpp
- Neue Heliklassen in setup_classnames.sqf
- Korrekturen an R3F config.sqf

### James
- Fehler im revive Script behoben: Animationen werden jetzt korrekt beendet und laufen nicht weiter
- revive Script übersetzt
- MQ-12 Falcon wurde als Drohne ohne Crew gespawnt, daher nicht im UAV Terminal erschienen. Behoben
- Refactoring der UAV classnames -> jetzt in setup_classnames für alle Skripte, nicht einmal im UAV addon und einmal im Kaufendialog getrennt
- erweiterte Sicherheitszone als Border Marker eingefügt + HInweistext für Spieler. Keine Aktion bisher
- NATO Montior des UAV Terminals enableSimulation false, um Umfallen zu vermeiden
- neue Reparaturanimation
- Änderung an den LKW-Positionen
- Verkaufsbutton in allen Dialogen außer dem Verkaufsdialog entfernt
- Verkaufspad CSAT rote Schrift und rotes Bild
- Bugfix: Funk sobald man stabilisiert war -> entfernt

### 2017-06-03
- Radar Container von Lord eingebaut
- neuer Lobby Parameter für Radar Container

### 2017-06-01
- umfangreiche Änderungen an der Codebasis in den init-Skripten, hauptsächlich weiteres Ausmisten
- Beheben 64bit Problem durch Löschen einer veralteten Zeile __ccppfln(common\client\func\x_perframe.sqf); Warum das Problem auftritt, unklar, aber die Ressource hat das Problem verursacht
- Doppelte Marker entfernt

### 2017-05-31
#### Kalle
- neue reconslots auf karte platziert und gruppiert und mit tfar gesynct (recon-FTL, recon-grenadier, recon-pionier, recon-AT, recon-aufklärungsscharfschütze)
- mg-slots gegen neue lmgs ausgetauscht
- hmg-slots gegen neue mg-slots getauscht
- AT-schützen wieder auf rpg-schützen getauscht
- safezones um basen auf 3km erhöht und so verschoben, dass bis zum brückenkopf alles im sicheren bereich ist nicht aber die uferstrasse
- hunter aus natobasis entfernt (keine ahnung warum der da stand?! vielleicht noch vom beamscript?)

#### James
- Bugfix Reparatur-Pad war global, jetzt lokal nur noch für den aktuellen Fahrer, der drauffährt
- Scoreboard deaktiviert
- Platzbeschränkung auf Fahrer beschränkt -> Schütze und Kommander wieder frei, Fahrer auf Besatzung beschränkt
- Minensperrzone eingefügt. Radius einstellbar. Aktuell default 20 m. Alle Minen um die Flagge herum können damit nicht gelegt werden.
- Ragdollfehler behoben, Animation "Down" wird nicht mehr abgespielt.

### 2017-05-23
- neues GPS-System von Lord-MDB eingebaut
- Parameter für HL, alle oder nur GrpFhr zu sehen
- TFAR Optimierungen (nach wie vor bugggy)
- Anpassung der HUD Schrift, leicht verkleinert
- Verschieben der Basen sowie neue Brücken und Marine Basis (danke oppa)
- Korrektur an der R3F config. Rpg Kiste und Ausrüstungskiste wieder ziehbar, RPG zudem auch verladbar
- Änderung am Verkaufspad, Rausnahme von Kisten und statischen Waffen wegen leichter Manipulierbarkeit (leere Kiste verkaufen)

### 2017-05-21

- Intro eingebaut, dass nur bei Missiosstart lädt (nicht für JIP)
- Freeze Time eingebaut, die Spieler einfriert. Addiert zur Waffenruhe.
- Beides über neue Paremeter in setup.sqf und in der Lobby einstellbar
- Bugfix mit dem Fahrzeugdialog: Verkaufenbutton war aktiv, Schließen inaktiv
- Parameter werden nun in der preInit ausgeführt, allerdings nur vom Server und an den Client übertragen, da dieser in der preInit keinen Zugriff auf die Parameter hat.
- Brücke eingebaut -> TODO: Leitplanken entfernen?


### 2017-05-20

- Sehr viele kleine Änderungen und Verbesserungen
- R3F config angepasst
- vehiclePool_war von aktueller Schlacht übernommen, damit Preise und Fahrzeuge aktuell
- attach_exp Skript überarbeitet, nun nach Respawn keine alten Einträge mehr zum Sprengen
- Verkaufspad extra, jetzt werden in der Liste alle verfügbaren Fahrzeuge und Verkaufspreise angezeigt
- alle Menüs bleiben offen (bestellen wie verkaufen)
- CSAT Teleport Fehler von Airfield zur Basis behoben
- globaler Chat wieder freigegeben
- ViewDistance aus init.sqf entfernt, dafür Settings-Menü für Spieler wieder aktiviert. Graseinstellungen entfernt, aber individuelle ViewDistance möglich
- TFAR Module neu gesetzt, nach wie vor Probleme -> TODO
- Schrift im HUD vergrößert und verkürzt
- TODO: Animation für Pionier beim Reparieren ersetzen! (aktuell Medic)
- wallChain in initServer.sqf verschoben -> TODO: Testen ob Basisschutz noch aktiv
- weitere nicht benötigte Teile entfernt
- Budget wird in drei Stufen angezeigt: weiß: > 4e5, orange: zwischen 0 und 4e5, rot: im Negativen (Dispo)
- Budget wird nun auch im Bestelldialog aktualisiert, ohne ihn zu schließen
- neue Parameter in der setup.sqf für Bestellvorgang. __ORDER_SPAWN_RADIUS__ und __ORDER_SELL_RADIUS__ legen Prüfradius um Spawnplatz fest. 
- magRepack gefixt

### 2017-05-16
- Umbau auf respawnOnStart = 0, dadurch wieder Ausführung von onPlayerRespawn.sqf zu Beginn, hier waren wichtige Skripte, die sonst nicht laden. Budgetabzug von 5000 pro Player dennoch erst ab 2. Respawn
- Einbau eines SeatSwitchedMan EH, der verhindert, dass Spieler in Fahrzeugen auf Besatzungsslots wechseln, die eigentlich gesperrt sind
- Timer geht nun auch auf Karte auf Anhieb
- Korrektur HUD y-Koordinate, Neuberechnung mit safeZoneH.
- neue Log-Funktion für Spielerabschüsse (killkam.sqf ruft auf, Event in i_events.sqf für Server)
- TFAR neu eingebaut, Modulsettings dank: https://armaworld.de/index.php?thread/2739-arma-3-task-force-radio-installation-auf-dem-server/. Alle eigenen Funktionen auskommentiert
- GarbageCollector entfernt, dafür EDEN Garbage Collector aktiviert
- kleine Anpassungen wie unnötige Variablen und Codeabschnitte enfernt (Intro, etc.)

### 2017-04-07
- Performanceupdate: Umbau auf neuen GetInMan-EH, kein Polling mehr, auch nicht an Fahrzeugen

### 2017-04-06
- Einbau eines neuen Reparatur-Systems für Auftanken und Reparieren via Aktionmenü
- Performanceoptimierung: Umbau der Draw3D-EH für Crewerkennung auf EH "Getin" beim Spawn, keine Belastung des Spielers mehr
- TODO: HUD per CBA Keybind auf eine Taste legen!

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
