## Letzter Fix
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
- umfangreiche Änderungen an der Codebasis in den init-Skripten, hauptsächlich weiteres Ausmisten
- Beheben 64bit Problem durch Löschen einer veralteten Zeile __ccppfln(common\client\func\x_perframe.sqf); Warum das Problem auftritt, unklar, aber die Ressource hat das Problem verursacht
- Doppelte Marker entfernt