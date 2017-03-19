--------------------------------------------- README ------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
How to use:

Do not edit in any file! Everything you can change you can found in the different setup files.
First and importants setup file is the SETUP.SQF <-- there you can find the most settings.
For a little bit more finetuning have a look in the SETUP_CLASSNAMES.SQF. Here you make further settings.
Some are important for the function of choosen options in the setup.sqf.
Third file is the SETUP_PUBLICVARIABLE.SQF --> in these file you have to define every publicVariable you want to use.
This file is executed only one time and only from the server.

If you want to start some custom files or make your own init commands you can do this in the INIT_CUSTOM.SQF.
This file will be executed from every machine one time like a normal init.sqf.

To update/change the vehicle pool you have to change the data files. You can found them here: dialogs\vehiclePool_war.hpp

VERY IMPORTANT: Before you start a test session or release the mission and you have made all your changes, it is
essential to open the mission folder and execute one time the SETUPCOPY.BAT file. (simple doubble klick on LMB)
If you change again anything on the setup files you have to repeat this step again.




Changelog:

----Version 1.028
- fixed: broken weapon check function since 1.60 (another issue)
- changed: remove ragdoll after testing phase (no stability and much new other issues with ragdoll)

----Version 1.027
- fixed: broken weapon check function since 1.60
- fixed: wrong given variable type to some BIS fnc since 1.60
- fixed: remove enableSimulation command from some base objects (use this command only on static non-functional objects, not on weapon crates!)
- changed: remove obsolete old wepaonCheck script to avoid confusion ;-)
- changed: remove Micro DAGR (dont know since which version it was auto-added to the players)

----Version 1.026
- merge 1.245 and 1.25

----Version 1.025
- fixed: no simulation, no r3f to sandbags (if it was not changed in another file, there was a mistake saving it?! init of objects was empty)
- added: fernmarkierer to r3f-script
- deleted/excluded: sandbags and other support materials excluded from r3f
- added: "r3f-free handling" added to beach flags (to avoid boats being beamed)
- changed: boats readded to "carry"-option of r3f, because there was problems when unloading them from trucks

----Version 1.0245
- fixed: variable order to BIS-fnc_typeText2 since function was changed in 1.56 patch
- changed: reduce TFAR Volume for unconcious players and disable abillity to talk while unconcious (most players missaply it)
- changed: finaly find a way to implement ragdoll in revive system (experimental!)

----Version 1.024
- fixed: issue in animation handling avoid players from field repair if no primary weapon was selected
- fixed: add a null check for players entitie after respawn and before revive init (maybe fix the random bug for grey screen after respawn)
- fixed: base protection zones now kill only the player self not the vehicles (cause sometime captured vehicles explode)
- fixed: avoid from beam actions while handle a crate (R3F vs. Beam)
- changed: attached demo charge time limited to max. 180 seconds
- changed: range of remote touch off for attached satchels limited to 2000 metres
- changed: remove possibility to touch off satchels after a respawn
- changed: remove speed boats and sdv's from movable item list (R3F)
- changed: delay the auto configuration for TFAR radio channels a little bit (hopefully stronger init)
- changed: disable simulation for bag fences in NATO bases

----Version 1.023
- removed: changes in drawmap.sqf and opt3_gps.sqf regarding GPS station (since gps was not functional!)
- changed: translations for "crewman, pilot and order restrictions" added to rsctitles.hpp
- removed: blinking lights removed from airstrips in bases (for performance improvement)
- changed: minor changes in base setup at CSAT bases
- added: version numbers and changelogs added and updated

----Version 1.022
- fixed: broken teleport after respawn in training mode
- fixed: delete all attached actions on a torso (avoid mission violation trough other players)
- changed: stronger spectating handling (exit is now possible by pressing X or ESC)
- changed: disable check for destroyed GPS station (not used feature atm)
- changed: script clean up opt_countdown.sqf to avoid some rpt warnings
- changed: no vehicle order destrictions while in training mode
- changed: change readme format from .txt to .md (compatibility with GitHub, can surely read with normal text editor)
- removed: old Farp scripts, events, inits, missions.sqm stuff and netevents
- removed: sound config and sound file cause not needed since some versions
- added: logPScore event to mission end

----Version 1.021
- Bilder in paa Format eingebaut (Mod) -> description.ext
- Bilder in paa Format eingebaut (Mod) -> RscTitles.hpp
- Schreibfehler bereinigt. -> RscTitles.hpp
- Marine-Ausrüstung: Bild eingebaut.
- Fehlender Raketenwerfer in abfrage eingebaut. -> common/client/opt_checkWeapon.sqf

----Version 1.020
- Statisches GMG (hoch) war nicht richtig im R3F eingetragen.
- Preis des Mörser stimmt nun.
- addons/attach_exp/EtV.sqf: -> Sprengladung an Fahrzeuge -> Auf Deutsch übersetzt.
- Preise der Munition-Container stimmen nun.
- description.ext: -> Auf Deutsch übersetzt -> UTF-8 Koodiert und umlaute funzen nun auch. Die OPT3 Bildpfade waren noch nicht alle richtig.
- Neue NATO Basen eingebaut.
- dialogs/fn_maintainerVecList.sqf -> Aktualisiert
- dialogs/far_blackscreen.hpp -> Text auf Deutsch übersetzt -> "Sie sind verwundet."
- Flug-Drohnen können nun von jedem gekauft werden. ->client/func/fn_sendVehicleOrder.sqf + setup_classnames.sqf
- Offizier kann nun nicht mehr fliegen + Schwere Kampfahrzeuge fahren. -> common/client/jip.sqf
- "Gruppenführer" gegen "Offizier" getauscht (15-25)
- "Offizier" gegen "Gruppenführer" getauscht (50-70)

----Version 1.019
- Altes Rep-LKW Script deaktiviert.
- Von zwei Basis Rep-LKW wurde einer entfernt. Zudem FARP Script deaktiviert.
- Bestellschilder: Bilder-pfade geändert. (Mod)
- dialogs\Rsc_titel.hpp: opt3_logo Pfad geändert. (Mod)
- description.ext: opt3_logo Pfad geändert. (Mod)
- Preisänderungen (PCML-Kiste, Boote, HAT-Kiste, Static-MGs, Static-GMGs)
- Marker für Beamfahrzeuge entfernt. (zeigt die hauptbase an was unerwünscht ist)
- Marker für Basis-LKW entfernt. (zeigt die hauptbase an was unerwünscht ist)
- Alle Bilder unter Pics gelöscht.
- common\x_reload.sqf: -> Systemchat Meldungen auf deutsch übersetzt.

----Version 1.018
- fixed: marine H
- changed: Nachschu Picture to Marine-Ausrüstung
- changed: Schutzzone to 150m 

----Version 1.017
- added: dummyflags and hot flags added to big airfield again
- added: new launchers added to setup_classnames.sqf
- changed: max playernumber changed to 162 (81 each side) in setup.sqf
- added: marker added to teleport flags in all bases

----Version 1.016
- added: Fernmarkierer + diver equipment box added to shopping menue
- changed: price changes implemented
- added: Static (Pods) + Boats + diver equipment box added to R3F
- changed: Helipads at Strand FOB are now invisible
- deleted: Warning message around bases deleted
- changed: common/fn_briefing.sqf -> coded in UTF8 ... some texts translated
- added: new launcher/rocket crates added to shopping menue and R3F

----Version 1.015
- fixed: rep-pads (triggers wont work since last patch)
- fixed: mag repack script will work again
- changed: make createVehicle.sqf compatible for spawn vehicles on water
- added: harbour side to both fractions (not global marked on map)

----Version 1.014
- fixed: injury markers disappear if player get revived/bleadout/die (hopefully)
- fixed: randomization of killcam quotes
- fixed: localization of killcam quotes (auto translation to ingame selected language)
- changed: armed truce time can changed via lobby parameter

----Version 1.013
- fixed: warning message caused by undefined sound templates
- fixed: broken 3D marker after patch 1.56
- changed: port mission file to 3DEN
- changed: de-binarize mission file
- changed: team balance checked after mission start first time (avoid check before mission is started)
- changed: new animation when player go agony

----Version 1.012
- added: Ausrüstungskiste added to shopping list for $5000
- changed: several price changes implemented
- added: Rep-LKW now in shopping list
- changed: MT-order list updated
- changed: solid base markers changed to 200m
- changed: killzones extended to 2000m (transparent ellipse with colored border)
- changed: all CSAT Bases updated
- changed: teleport flags set to no damage
- added: fuel barrels added to shopping menue and R3F
- changed: Mun-Containers no longer loadable to trucks
- added: unarmed UAV (big) now spawns with AI
- deleted: "FARP aufbauen" entry deactivated for rep-containers

----Version 1.011
- added: base structures added/revamped at NATO locations
- added: different quantities added to "überhangregel" (description.ext)
- changed: beamfahrzeuge reduced and switched (max number place - need to be reduced depending on player slot count)
- added: maximum number of playable slots added and configured (need to be reduced depending on player count)
- changed: main bases switched and configured (csat almyra, nato aaf airfield)
- removed: all additional elements removed from FOBs (additional ausrüstungskisten and base-lkw f.i.)
- added/changed: all new equipment (boats) added to shopsystem and implementation of new prices

----Version 1.010
- fixed: warning before entering death zone
- changed: location of protection zone
- changed: enable environment sounds
- changed: enter spectating mode via maintainer dialog, remove action entry

----Version 1.009
- fixed: bad possible initialization error
- fixed: reinit attachable explosives after respawn
- added: check for failed player init and abort mission by failing
- added: new optional lobby paramater for team balancing
- added: remaining base positions have bases now (with one being the main base including respawn point)
- added: teleport function for base-to-base teleport
- changed: truppführerslots are now COM-slots again in order to be able to teleport
- changed: updated vehicle pool (some crates and boats added into shopping list)
- changed: several details changed regarding dialogues and action menue entires (helicopters is now luftwaffe f.i.)
- changed: translation of most english elements to german text
- changed: configuration of R3F added
- changed: markers for natobase/csatbase moved to northern island for safety reasons

----Version 1.008

----Version 1.007
- changed: offiziere no longer in operator-class (setup_classnames)
- added: specops grenadier added to grenadier-class (setup_classnames)
- added: mora and gorgon to crewVec-list (setup_classnames)
- playtimes 10, 15 min added to parameter choices

----Version 1.006
- changed: color chemes from XYellowText to XOrangeText to make a difference to new yellow action entries from R3F
- chnaged: updated vehicle pool
- added: possibility to unflip vehicles
- added: base protection zone
- added: spectating mode for maintainer (exit by press button for "compass")

----Version 1.005
- changed: switch back to old wounding marker system (cause no time atm to fix/implement new)
- changed: different message orders in zone protection trigger between csat/nato (groupChat = everyone who is part of the group get the warning message)
- changed: personal radio frequency setup wont overwrite by respawn
- added: R3F system (need's to be configurized)
- added: etc charges script (cant test cause nobody has a charge and cant order charges caused by broken class names :-P)
- added: field repaired vehicles get a minimal amounth of 10% fuel
- added: extended garbage collector
- broken: again mixed unit class ordner in lobby

----Version 1.004 - uuf englisch ;)
- added: new-old markerhandling.fsm implemented in farooq revive
- added: maximum number of slots placed (81 on each side)
- added: all vehicles in shop menue now - prices and details still WIP (update incoming)
- added: beamvehicles inserted again
- deleted: static vehicles and drones now in shop menue no longer for free in bases
- changed: safezone around bases extended
- changed: bunker in nato base changed to original (again)

----Version 1.003
- fixed: AFV-4 Gorgon is defined as "Radfahrzeug" but accidently forbidden for non-crew players
- fixed: add some security checks for possible nil states of some vars
- changed: new dynamic text animations in different places (looks better and don't cut to long text blocks)
- changed: remove TFAR frequencies module (standard frequencies are set by a script)
- changed: switch OPT_GPSunits definition to setup_classnames.sqf
- changed: switch "Truppführer" to "Offizier" on both sides (again 3 units per side have access to the GPS)
- changed: remove some unused functions / clean-up
- changed: disable those fucking rabbits (performance+)
- added: lobby parameter to enable/disable possibility for intercept enemys vehicle radios (default: disabled) (if enabled, every vehicle channel is reset to 30 MHz by entering)
- added: briefing entry with info about possibility for intercept enemys vehicle radios if enabled
- added: short intro sequence

----Version 1.002
- fixed: if a medic start to revive the player is automatically stabilized
- fixed: some minor performance tweaks in revive system
- fixed: some minor performance tweaks in vehicle order system
- fixed: global warning message for zone restriction
- changed: screaming sound distance set up to 70m
- changed: to deactivate vehicles from pool set their cost <= 0
- changed: clean up and sort lobby-playerslots, give ranks
- minor changes in HUD (color, wide, order)
- added: complete rewriten unconcious marker handling (need testing!!!)
- added: actual budget to HUD informations (budget will be red-colored if budget < 400k€)

----Version 1.001
- fixed: opt_vehicleOrder.sqf, change "side player" to "playerSide"
- fixed: maintainer droplist dialog, remove undefined vehicle class names, add all actual vehicle class names
- fixed: locality issue in opt_startMission.sqf and duplicated "Mission gestartet" message
- added: vehicle order on a budget system
- added: variable definition for fraction budget in setup_classnames.sqf
- added: add actual budget to logfile at mission start and after mission end
- added: write beam position in logfile
- added: show killer to killed player (enable/disable in revive init)
- added: event based check-weapon script
- changed: format some files to UTF8
- changed: rewrite vehicle order dialog (was necessary after shitty line spacing trough bigger numeric values)
- changed: remove fn_maintainerSpawnVehicle.sqf and change nethandler directly to fn_spawnVehicle.sqf when called from maintainer
- changed: move destroyed vehicle log from nathandling to mpEH handling (hopefully fix the vehicle log)
- changed: remove dead vehicle hanfdling via spawn in vehicle killed EH (senceless)

----Version 1.000
- fixed: Waffenstillstand counter startet während des Briefings
- fixed: try to fix the from time to time not disapeared wounded marker from players (if it doesnt work handling will changed to missionNameSpace!)
- fixed: define and reset earplugs after respawn
- added: Nil check for some object variables
- added: disable chat while player is unconcious
- changed: screaming sound distance set to 35m
- changed: rating stay always zero
- changed: disable checkWeapon script (solution comes trough opt-mod)
- changed: calculation of dominator side rewriten. Its now possible to create assynchrone gameplay with odd-numbered flags per side. (need  a test on server environment!)
- changed: score and time map-marker disabled (not removed yet)

----Version 21112015
- fixed: maintainer teleport dialog not exit automaticly
- fixed: maintainer dialog start mission has no effect on running weapons-freeze countdown
- fixed: open revive dialog after respawn
- fixed: lobby settings wasnt transmit to client if not default value is set
- added: new setup file param "__ONLY_PIO_CAN_BUILD_FARPS__" (will also generate lobby param if enabled, disabled means everybody are allowed to errect a FARP
- added: define cfgDebriefing end screens
- added: information HUD (players, fps, score, time)
- added: new setup file param "__ONLY_PIO_CAN_BUILD_FARPS__" (will also generate lobby param if enabled, disabled means everybody are allowed to errect a FARP
- added: non-static FARP definition now possible (no limitation of FARPS, objects - only add addAction to any object)
- added: possibility to add more than once flagpole per side
- added: auto generated side markers around flag poles (if enabled)
- changed: nil and onjNull selector question for flag definitions
- changed: only defined flags in setup_classnames.sqf are hot, unless the flags object variable
- changed: it isnt possible to pull a flag during the weapon-freeze time now
- changed: mission shut down after the cam run and remove all weapons
- changed: mission time start to count with weapon freeze time (like wanted) and not with ending of weapon freeze time
- changed: initialisation order of global lobby params (missionConfigFile/"Params")
- changed: fnc createTrigger set mp param to true (since A3 1.43 possible)

----Version 15112015
- fixed: magic auto move bug afer respawn
- fixed: custom keys sometimes didn't initialized
- fixed: setup error in repair scripts
- fixed: undifened var in GPS script after some map objects was changed
- fixed: log entries for destroyed vehicles (hopefully)
- fixed: "unentschieden" endscreen (hopefully)
- changed: revive interface changed
- changed: removed 3. rep truck on both sides (no function upper two rep trucks)
- changed: terrainGrid up to 3.125
- changed: base layout CSAT
- changed: removed expanded base marker and leave real base area marker to clarify the base area
- added: farooq revive (custom, progress bars, camera, blablabla)
- added: add scoreboard again (1 for a kill, 1 for a revive, 5 for flag pull)
- added: rep-pad in CSAT base, equal to Nato base
- added: vehicle beam rewritten

----Version 02112015
- fixed: remove global message wihle vehicle service, only local
- fixed: animals start executing the repair scripts
- fixed: SRS bleedout time get stoped while injured person reciving help (hopefully)
- fixed: SRS undefined variable issues
- fixed: SRS healer get invulnerable while healing others and get shooted (hopefully)
- changed: srs reset modified again - everything removed exclude the animation reset
- changed: if player knoked out fade sound to zero - after that sound grows slightly up
- added: dummy flags
- added: setup option to enable/disable sector messages
- added: setup option to enable/disable the re-ammo function on farps/service points
- added: players will get score points for knock out other players (+1 for kill, +1 for revive, +5 for pull flag, -1 for kill friendly)
- added: support flag for order supplies

----Version 28102015
- fixed: only alowed persons can spawn vehicles at flags
- fixed: mysterie bug - enable lockOn sounds
- fixed: animals start executing the repair scripts
- changed: only the driver has to be a crew member on tanks
- changed: FARP and Repair Service System completely rewritten
- changed: Flag-Pull System and Score Tracker completely rewritten
- changed: srs reset modified ;-)

----Version 14102015
- rewrite to OPT template, initial release
- removed: opt3_vehicleFlip Dir cause vehicles flip alone since 1.46
- removed: opt3_zeus cause unused
- removed: opt3_testing cause unused
- removed: opt3_fuel cause unused
- removed: opt3_eject cause changed from loop to event based handling
- removed: check_rating cause it was a senseless loop
- removed: qs_icons.sqf cause unused
- removed: fn_maintainerCreateVehicle (is it needed?)
- changed: rewrite GSP marker script
- changed: most script locations and initializations (order, location)
- changed: remove addAction for earplugs and fix earplug activation with key "WIN-L"
- changed: improve network traffic handling
- changed: disable neutral zone color (no green marker)
- added: security check for order vehicles (f.e. only pilots can order air vehicles)
- added: vehicle spawn script search automatially for free and flat space to spawn the vehicle
- added: mission is able to end itself after timelimit was reached
- added: maintainer UID




B_parachute_02_F
this addbackpack "B_Parachute"; 


Steerable_Parachute_F
NonSteerable_Parachute_F