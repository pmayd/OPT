_subject = player createDiarySubject ["made", "Credits"];
_log_briefing = player createDiaryRecord ["made", ["About and Credits", "
<font face='PuristaMedium' size=18 color='#ffffff'>Made by: </font><font face='PuristaMedium' size=25 color='#8E8E8E'>Psychobastard</font><br/>
<font face='PuristaMedium' size=18 color='#ffffff'>Version: </font><font face='PuristaMedium' size=20 color='#ffffff'>final 1.02</font><br/><br/>

<font face='PuristaMedium' size=30 color='#014EE3'>Credits</font><br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>NetFusion</font> for AME-Core and some great functions<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>Xeno</font> for the reload and repair script<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>Zealot</font> for his field repair script<br/>
- <font face='PuristaMedium' size=18 color='#8E8E8E'>code34</font> for his realWeather script<br/>
"]];

//////////////////////////////////////////////////Notizen//////////////////////////////////////////////////////
player createDiaryRecord ["Diary", ["Tastenbelegung","
<font face='PuristaMedium' size=25 color='#014EE3'>spezielle Tasten</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Ohrenstöpsel</font> per linker WIN-Taste<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Maintainer Menü</font> per rechter WIN-Taste (nur Maintainer)<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Fast Travel", "
<font face='PuristaMedium' size=25 color='#014EE3'>Fast Travel</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Reise</font> kann per Mausrad Menü an den Bestellpads gestartet werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Klicke</font> auf der Karte auf einen der markierten Orte um zu reisen<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Fahrzeug Bestellung", "
<font face='PuristaMedium' size=25 color='#014EE3'>Fahrzeuge bestellen</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Bestellung</font> erfolgt an speziellen Oprder-Pads<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Hauptkategorie</font> per Maurad wählen und anklicken<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>das Wunschfahrzeug</font> in der anschließenden Liste bestellen<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Preis</font> wird ebenfalls in der Liste angezeigt<br/><br/>
"]];
player createDiaryRecord ["Diary", ["spezielle Fahrzeuge", "
<font face='PuristaMedium' size=25 color='#014EE3'>besondere Fahrzeuge</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>dazu gehören</font> schwere gepanzerte Fahrzeuge und Flugzeuge/Helikopter<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>schwere gepanzerte Fahrzeuge</font> könnenn nur von dem Crew-Slot gefahren werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Helikopter</font> und Flugzeuge können nur von Piloten bedient werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>UAV's</font> kann nur der Operator bedienen<br/><br/>
"]];
player createDiaryRecord ["Diary", ["bewaffnete Flugdrohnen", "
<font face='PuristaMedium' size=25 color='#014EE3'>bewaffnete Flugdrohnen</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>diese UAV's</font> können nur gesteuert werden wenn sich der Operator in der Kontrollstation befindet und sich mit dieser verbunden hat<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>per Mausrad</font> am Rechner der Kontrollstation die Verbindung aufbauen<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Verbindung</font> ist nur aktiv solange sich der Operator in dem Container befindet<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Piloten</font> können ebenfalls eine Verbindung mit der Kontrollstation aufbauen und die Flugdrohnen steuern<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Radarstation", "
<font face='PuristaMedium' size=25 color='#014EE3'>Radarstation</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Container</font> zum Aufbau eines Radars befindet sich in der Base und ist einmalig<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>das aufgebaute Radar</font> kann gegnerische Lufteinheiten innerhalb seines Wirkungsbereiches Orten<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Wirkungsbereich</font> wird durch den kreisrunden Marker auf der Karte visualisiert<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Flughöhe</font> des Gegners muss über 25m liegen um vom Radar erfasst zu werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Ort</font> des radars kann verändert werden da der Container beweglich ist (siehe 'Logistik')<br/><br/>
"]];
player createDiaryRecord ["Diary", ["andere Container", "
<font face='PuristaMedium' size=25 color='#014EE3'>Container</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Medic Container</font> kann an beliebiger Stelle auf- und abgebaut werden. An ihm können sich verwundete Einheiten medizinisch versorgen.<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Kontrollstation</font> für fliegende bewaffnete UAV's befindet sich in der Basis und ist unbeweglich. In ihm befindet sich die Ausrüstung für die Drohnensteuerung. (siehe 'bewaffnete Flugdrohnen')<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Supply Container</font> sorgen für die nötige Unterstützung der mechanischen Infanterie. Dazu zählen Container für Treibstoff, Reperatur und Munition. Die Container können geliftet oder verladen werden. (siehe 'Logistik')<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Feldreperatur", "
<font face='PuristaMedium' size=25 color='#014EE3'>Field Repair</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Reperaturdauer</font> ist variabel und abhängig vom Schaden und beschädigten Teil<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>mit Ersatzteilen</font> kann jedes Fahrzeug einmal repariert werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>vollständige Wiederherstellung</font> ist nicht garantiert, dafür wird ein Reperatur Truck benötigt<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Minendetektor", "
<font face='PuristaMedium' size=25 color='#014EE3'>Minendetektor</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>der Minendetektor</font> steht nur den Pionieren und Sprengmeistern zur Verfügung<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>zur Ortung</font> muss der Minendetektor eingeschaltet sein (Mausrad Menü)<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>ein Signalton</font> ist zu vernehmen sofern sich Sprengkörper innerhalb von 18m Reichweite und innerhlab eines Bereiches von +/- 30° vor dem Minendetektor befinden<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Logistik", "
<font face='PuristaMedium' size=25 color='#014EE3'>Logistik</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>kleine Gegenstände</font> wie Waffenkisten können von den Spielern direkt bewegt werden. Außerdem können diese in Fahrzeuge verladen werden. Teilweise können mehrere Kisten in ein Fahrzeug geladen werden. (abhängig von Fahrzeuggröße)<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Liften</font> kann jeder Helikopter im Spiel. Welcher Helikopter was liften kann ist abhängig von der Leistung des Helikopters und dem Gewicht der Last. Es kann fast alles geliftett werden. (Fahrzeuge, einige Kisten, Container)<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Verladen</font> von Gegenständen ist mit den großen Flugcoptern direkt in ihren Bauch möglich. Dazu muss sich das zu verladenen Objekt direkt hinter dem stehenden Flugcopter befinden. (Blackbird / Xi'an)<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>Trucks</font> können Container direkt verladen. Dazu den Truck einfach dicht an den Container fahren. Anschließend den Container ansehen und per Mausrad das verladen starten.<br/><br/>
"]];
player createDiaryRecord ["Diary", ["Revive", "
<font face='PuristaMedium' size=25 color='#014EE3'>Revive System</font><br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>ein verwundeter Spieler</font> kann innerhalb von 5 Minuten wieder reanimiert werden<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>nur Sanitäter</font> können eine Reanimation starten<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>die Stabilisierung</font> des verwundeten kann jedoch von jedem Spieler durchgeführt werden. Dadurch wird die Blutung gestoppt und die Zeit bis zur Reanimation unendlich verlängert.<br/><br/>
- <font face='PuristaMedium' size=14 color='#8E8E8E'>kein Funk</font> oder sonstige Kommunikation ist durch einen verwundeten Spieler möglich. Seine Mitspieler bekommen jedoch eine Markierung des verwundeten auf der Karte.<br/><br/>
"]];