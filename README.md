# OPT
Github der Operation Pandora Trigger

## Maintainer
[3.Jgkp]James

## Version
Aktuelle Version ist 1.00

## Current Work

* Codebasis durchsehen, verstehen, wo veraltet ersetzen
* am liebsten die komplette Funktionssammlung net rausschmeißen und durch CBA Eventhandling ersetzen, wesentlich lesbarer und sauberer
* Features sichten, Liste neuer Features sammeln, alte Features, die nicht gebraucht werden löschen

## SITREP

### 2017-03-19
- ``setup.sqf`` überarbeitet, neue Parameter für HUD, kann jetzt ganz ausgestellt bzw. individuell angepasst werden (jedes Feld ein/ausblendbar). FPS per default aus
- Flaggen werden jetzt automatisch erkannt. Umfangreiche Änderungen an `setup_classnames.sqf`, `opt_flag.sqf`, `fn_setFlagOwner.sqf` und anderen beteiligten Skripts. Komplett überholt. Alle Flaggen, deren Variablenname mit `OPT_CSAT_FLAG` bzw mit `OPT_NATO_FLAG` beginnt, werden automatisch als Sektorflaggen erkannt und auf der Karte markiert (einstellbar in `setup.sqf`). Ebenso wird automatisch ein Actionmenüeintrag hinzugefügt, der es erlaubt, die Flagge zu ziehen. Eintrag ist nur sichtbar, wenn Mission gestartet (nach Waffenruhe) und wenn noch Spielzeit übrig (playTime > 0). Code stark refactored und vereinfacht.
- Timer-Anzeige im HUD-Display komplett überarbeitet. Statt im Hintergrund `playTime`, `truceTime` und was weiß ich nicht alles zu sync, wird jetzt `serverTime` verwendet, da bereits in der Engine synchron für alle Clients. Da `serverTime` den Start des Servers anzeigt (also nicht Missionsbeginn, sondern Zeitpunkt ab dem der Server läuft), wird einmalig zu Missionsbeginn die aktuelle Serverzeit als Public Variable `opt_startTime` synchronisiert. Jeder Client kann daraus die noch verbleibende Zeit wie folgt berechnen: 
```SQF
(OPT_PLAYTIME - (serverTime - opt_startTime)) 
```
#### TODO
- [ ] JIP testen!
