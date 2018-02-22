## Changelog

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

### Editor
- Garbage-Collector: Eingestellt auf 3-5 Minuten für Personen und 10-15 für Fahrzeuge