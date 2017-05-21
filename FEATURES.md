## Vorhandene Features

- [x] Spielzeit, Waffenruhe -> Spielzeit und Waffenruhe können als Parameter in der Lobby gewählt werden
- [x] Flaggenscript -> Flagge kann nur nach Missionsstart gezogen werden, und auch nur in unmittelbarer Nähe, außerhalb eines Fahrzeugs und während der Spielzeit. Sobald beide Flaggen einer Fraktion gehören, wird pro Minute ein Punkt gutgeschrieben
- [x] Hauptbasen mit Kaufpads und Schutzzone und Zusatzkram -> Basen sind soweit voll funktionstüchtig. Kaufpads stellen alle Fahrzeuge bereit. Verkaufpad erlaubt auch wieder den Verkauf zu 75% des Originalpreises. Drohnenstation vorhanden (Piloten + Operator). Reparaturpad vorhanden, Aktionen per Aktionsmenü auswählbar. Teleport zu anderen Basen/Airfield möglich. Basisschutz durch Todeszone und unsichtbare Schutzmauer gewährleistet. 
- [x] Brücke (Tanoa-spezifisch)
- [x] TFAR-modul -> Verschlüsselung ist einstellbar. Bei entsprechendem Parameter in der setup.sqf bekommen alle Fraktionen verschiedene Verschlüsselungen. Voreingestellte Frequenzen für Longrange und Shortrange Radios.
- [x] Dynamisches Kaufsystem mit Grundbudget -> Kaufsystem richtet sich nach Klassen und Preisen aus der vehiclePool_war.hpp. Alle Fahrzeuge mit einem Preis von 0 sind nicht verfügbar. Fahrzeuge können am nächstgelegenen Pad bestellt werden, auch mehrere hintereinander. Radius wird in setup.sqf vorgegeben, spawnt nur solange, wie noch freier Platz verfügbar. Budget wird live aktualisiert. Am Verkaufspad können alle Fahrzeuge in einem bestimmten Radius, die auch gekauft werden können, wieder verkauft werden. Dabei fallen bestimmte Kosten an, die die setup.sqf vorgibt. 
- [x] Dispokredit -> Bei Überschreitung des aktuellen Budgets rutscht die Fraktion in den Dispokredit (rote Anzeige). Der Dispokredit wird in der setup.sqf vorgegeben und erlaubt das Bestellen weiterer Fahrzeuge bis zum Erreichen des Kredits. Ab dann kann nichts mehr via Bestellsystem bestellt werden. 
- [x] Respawn kostet -> Jeder Respawn einer Einheit nach dem Start kostet einen bestimmten Betrag, der in der setup.sqf festgelegt ist. Respawn ist immer möglich, auch nach Ausschöpfen des Dispokredits. Eine neue Einheit startet immer mit dem Grundloadout, nicht mit ihrem vorherigen Loadout.
- [x] Sichtweiteneinstellung -> Jeder Spieler kann im Aktionmenü Settings wählen und die Sichtweite für sich einstellen.
- [x] Log -> Alle relevanten Aktionen wie Budgetänderungen, Abschuss von Spielern oder Fahrzeugen wird in der Server RPT geloggt.
- [x] Klassensystem mit festen Loadouts und Klassenlimitierungen - bis auf Standardlimitierungen -> Loadouts kommen aus der OPT Mod. Spieler können aber nicht beliebige Waffen aufnehmen, sondern nur klassenspezifische bzw. klassenauthentische Waffen.
- [x] Crew-System -> Fahrzeuge können nur von Crew-Mitgliedern bedient werden. Alle Spieler können einfache Radfahrzeuge wie Quads bedienen oder in Truppentransportfahrzeugen hinten als Passagiere mitfahren. Einsteigen oder Sitzplatzwechsel auf Besatzungspläze führt aber zum erzwungenen Aussteigen.
- [x] Sprengstoffladungen anheften -> Das Skript erlaubt dem Pionier bei mitgeführter Sprengladung das Anbringen dieser an Fahrzeuge mit anschließender Zeit- und Fernzündung. Nach dem Respawn sind diese Einträge verschwunden. 
- [x] Minendetektor -> Pioniere verfügen über einen Minendetektor, der ihnen erlaubt, Minen direkt im Vorfeld ausfindig zu machen
- [x] Drohnenstation -> UAV-Operatoren und Piloten haben Zugangsberechtigung zur Drohnenstation. Dort können sie sich einloggen und die Drohnen - sofern vorhanden - fernsteuern. Dazu müssen sie im direkten Umfeld der Drohnenstation bleiben.
- [x] Feld-Reparatur-System -> Neben dem Reparatur-Pad in der Basis kann jeder Spieler jedes Fahrzeug einmalig reparieren. Pioniere mit einem Werkzeugkasten können mehrfache Reparaturen sowie schwerwiegende Reparaturen durchführen.
- [x] HUD -> Ein HUD am unteren Bildschirmrand informiert die Spieler über Spieleranzahl, Budget, aktuellen Punktestand und die verbleibende Spielzeit. Das HUD ist auch auf der ingame Karte aktiv.
- [x] Logistik-System -> Mit R3F ist ein sehr umffangreiches Logistik-System integriert. Es erlaubt das Verladen von vorgegebenen Kisten in Fahrzeuge, die entsprechenden Inventarplatz freihaben, das Ausrichten von Objekten und vieles mehr.
- [x] Revive-System -> Mit FAR Revive ist ein umfangreiches Revive-System verbaut, dass es einfachen Soldaten erlaubt, andere zu heilen und zu stabilisieren, während der Sanitäter der Gruppe Wiederbeleben kann. Alle können bewusstlose Kameraden ziehen.
- [x] Aufrichten von Fahrzeugen -> sollte ein Fahrzeuge einmal auf dem Kopf landen, haben Spieler die Möglichkeit, das Fahrzeug wieder aufzurichten.

## geplante & gewünschte Features
- [] Radarcontainer
- [] Logistiksystem - bestenfalls auch die containerverladerei auf die dafür vorgesehenen lkw
- [] revive mit drag und stabilisieren + 3d- und kartenmarker -> Prüfe Kartenmarker
- [] MARKERSYSTEM (à la blueforce tracker aber mit verschiedenen abstufungen - oberkommando sieht alle einheiten, SQLs sehen untergeordnete einheiten + squadmarker, einfache soldaten sehen nur squadmarker) -> Lord
- [] 2-minütige Pause zu Beginn mit Einblendung -> Spieler zu beginn freezen und so Server in Ruhe initialisieren lassen
- [] Basen müssen neu auf der Karte verteilt und korrekt eingerichtet werden (alle Pads, Drohnenstation etc.)
- [] TFAR Frequenzmodul macht Probleme
