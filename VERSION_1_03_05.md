## Letzter Fix
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
