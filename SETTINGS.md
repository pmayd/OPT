# Einstellungen
Nachfolgend eine Auflistung aller Einstellungsdateien, die für Maintainer relevant sind. Alle anderen Dateien sollten nur nach Rücksprache mit dem Missionsbauer verändert werden.

| Name | Pfad | Einstellungen |
| ---- | ---- | ----          |
| `setup.sqf` | setup\ | Wichtigste Einstellungs-Datei. Steuert sowohl Parameter und erlaubte Features als auch bestimmte Werte für Features. Hier wird auch der Missionsname, die Version etc. eingetellt. Dokumentiert. Funktioniert via Auskommentieren von Optionen. |
| `setup_classnames.sqf` | setup\ | Enthält alle globalen Classnames wie CSAT und NATO Flaggen, Spielerklassen für Fahrzeugbeschränkung etc. Anpassung durch Änderung der Arrays. |
| `setup_publicVariables.sqf` | setup\ | Keine wirkliche Einstellungs-Datei, überträgt aber alle relevanten Variablen vom Server an die Clients (wie Budget). Sollte nicht verändert werden. |
| `description.ext` | .\ | Keine wirkliche Einstellungs-Datei, legt jedoch grundlegende Systemeinstellungen wie respawn, garbage Collector und Funktionen fest (Autostart von Addons wie preInit, postInit). Sollte nicht verändert werden. |
| `vehiclePool_war.hpp` | dialogs\ | Wichtig für das Bestellsystem. Enthält alle erlaubten Fahrzeuge und Preise. Preis von 0 bedeutet nicht verfügbar. Anpassung durch Änderung der Arrays. |
| `FAR_revive_init.sqf` | addons\far_revive\ | Einstellungs-Datei des FAR Revive Moduls. Alle Einstellungen, die das Skript bietet, können hier vorgenommen werden. An-/Ausschalten durch true/false Werte. |
| `zlt_fastrope.sqf` | addons\fastrope\ | Einstellungs-Datei des fastrope Moduls. Legt erlaubte Classnames und Seilkoordinaten fest. Muss bei Änderungen an den Helis angepasst werden. Anpassung durch Änderung der Arrays. |
| `MagRepack_init_sv.sqf` | addons\opt3_magRepack | Einstellungs-Datei des repack Moduls. Erlaubt Einstellung der Zeit pro Kugel und Magazin. Änderung durch Anpassen der Werte. |
| `config.sqf` | addons\R3F_LOG | Einstellungs-Datei des R3F Moduls. Erlaubt umfangreiche Anpassung von Parametern und Classnames. Hier wird festgelegt, welche Fahrzuge verladbar sind, welche Fahrzeuge welchen Inventarplatz haben und welche Kisten wieviel Stauraum einnehmen. Muss manuell angepasst und aktualisiert werden. Änderung durch Anpassung der Arrays. |
| `TFAR_settings.sqf` | addons\TFAR | Einstellungs-Datei für TFAR. Soll die Platzierung von Modulen überflüssig machen. Erlaubt Anpassung aller TFAR Parameter. Anpassung durch Änderung der Werte. |
| `fn_preInit.sqf` | addons\UAV | Einstellungs-Datei des UAV Moduls. Legt die Classnames der Drohnen fest. |
| `fn_briefing.sqf` | common\ | Briefing der Mission. Legt Notizen und Tagebucheinträge fest. Anpassung durch Änderung der Arrays. |
