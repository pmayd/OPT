## Letzter Fix
- Recon Einheiten bei CSAT durch Standard ausgetauscht
- Bugfix Minendetektor: Wegstecken des MD führt zu einer Animation bei der man immer aufsteht -> abgestellt
- Überarbeitung der gesamten Preisliste nach Protokoll (Preisliste)
- Bugfix Radarcontainer: Trotz damage 1 konnte der Container noch auf und abgebaut werden. behoben
- TFAR Module entfernt und durch Skripte ersetzt. Verschlüsselung und Frequenzen sollten korrekt gesetzt werden
- Parameter für Abhören des Funk wirkt sich wieder auf eroberte Fahrzeuge aus. Verschlüsselung ist für INF immer aktiv, d.h. es kann niemals der Funk über die Inf Funkgeräte vom Feind abgehört werden. In Fahrzeugen wird bei Abhören == 0 die Verschlüsselung gewechselt, bei Abhören == 1 wird die Frequenz gelöscht und man muss selber suchen, aber Abhören in Fahrzeugen damit möglich
- Bugfix: Teleportskript hat Fahnenverschiebeskript blockiert/überschrieben. Jetzt gehen beide Aktionen im Trainingsmodus beliebig oft und auch nach respawn
- Neues Feature: Im Trainingsmodus kann die Flagge nun per Dialog verschoben werden (Aktionsmenü)
- Bugfix: Radarcontainer zeigt nur noch große Drohnen und nicht mehr die kleinen