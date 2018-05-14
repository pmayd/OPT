
## How to use:

Do not edit in any file! Everything you can change you can found in the different setup files.

First and importants setup file is the `main\setup\setup.hpp` <-- there you can find the most settings.

For a little bit more finetuning have a look in the `main\functions\fnc_setup_classnames.sqf`. Here you make further settings.
Some are important for the function of choosen options in the `main\setup\setup.hpp`.
Third file is the `main\functions\setup_publicVariable.sqf` --> in this file you have to define every publicVariable you want to use.
This file is executed only one time and only from the server.
The flag positions as well as the action commands are registered in `main\functions\setup_flagPositions.sqf`. This is run only once by server.

If you want to start some custom files or make your own init commands you can do this in the `init_custom.sqf`.
This file will be executed from every machine one time like a normal init.sqf.

To update/change the vehicle pool you have to change the data files. You can found them here: dialogs\vehiclePool_war.hpp


## Changelog:

----Version 1.04.01

- neue blanko-Version mit ACE
- neues Nachrichtensystem mit bis zu 10 Nachrichten gleichzeitig und Farbcordierung
- neues Missionsdesign auf Komponentenbasis, 100% refactored and rewritten

----Version 1.04.02
- update nach erster testrunde mit diversen fixes

----Version 1.04.03
- basen, einheiten und module von tanoa geportet und angeordnet
- ace module erneut konfiguriert und überprüft (muss aber nochma mit den cba settings abgeglichen werden, gab schon wieder veraltete module)
- kartenumbauten von kallek und oppa eingefügt (als eigene layer etc)
- setflagposition.sqf aktualisiert mit den flaggenposis der kampagnenkarte
- kaufliste geupdated (allerdings nur sachen zunächst rausgenommen per 0 setzen)
- todo (neu): teleportscript marinebasis


