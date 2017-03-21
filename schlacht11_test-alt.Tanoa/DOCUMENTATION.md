# Documentation of OPT Mission
Diese Datei dient ausschließlich der Dokumentation aller Features und Zusammenhänge und erfüllt keinen direkten Nutzen nach außen bzw. erklärt keinerlei Optionen für den Endbenutzer. Diese Datei ist als umfassende Dokumentation für Missionsbauer und Maintainer gedacht.

**Warnung**: Um die Mission sinnvoll zu testen, _muss_ im MP getestet werden, wenigstens auf einem lokalen Server, da ansonsten grundlegende Trigger/Bedingungen wie Respawn nicht erfüllt sind. Daher sollte man auch im EDEN EDITOR grundsätzlich auf einem lokalen Server hosten. Hat man keinen Testserver zu Hand, kann man den ArmA Client einfach zweimal starten und die eine Instanz als lokalen Host verwenden, die andere als lokalen Client.

## Missionsstart
Liste aller verfügbaren [Event Scripts](https://community.bistudio.com/wiki/Event_Scripts)

Reihenfolge der Event Scripts: [Initializiation Order](https://community.bistudio.com/wiki/Initialization_Order)

- init.sqf 	Executed when mission is started (before briefing screen)
- initIntro.sqf 	Executed when intro, outro win or outro lose is started.
- exit.sqs 	Executed when mission is finished (before debriefing screen). In Arma 3, "ended" mission event handler has the same functionality. 	`[endType:String]`
- onFlare.sqs 	Executed when a flare is lit after being fired from grenade launcher. 	`[colorRGB:Array, shooter:Object]`
- initServer.sqf 	Executed only on server when mission is started. See initialization order for details about when the script is exactly executed.
- initPlayerServer.sqf 	Executed only on server when a player joins mission (includes both mission start and JIP). See initialization order for details about when the script is exactly executed. 	[player:Object, didJIP:Boolean] 	
- initPlayerLocal.sqf 	Executed locally when player joins mission (includes both mission start and JIP). See initialization order for details about when the script is exactly executed. 	[player:Object, didJIP:Boolean]
- onPlayerKilled.sqf 	Executed when player is killed in singleplayer or in multiplayer mission. `[<oldUnit>, <killer>, <respawn>, <respawnDelay>]`
- onPlayerRespawn.sqf  Executed locally when player respawns in a multiplayer mission. This event script will also fire at the beginning of a mission if respawnOnStart is 0 or 1, oldUnit will be objNull in this instance. This script will not fire at mission start if respawnOnStart equals -1. 	`[<newUnit>, <oldUnit>, <respawn>, <respawnDelay>]`

Aktuell verwendet:
- `init.sqf`
- `onPlayerKilled.sqf`
- `onPlayerRespawn.sqf`

### `init.sqf`
- Falls `__INTRO_ENABLED__`, färbt Bildschirm zu Beginn schwarz TODO: Wo wird das aufgehoben? 
- liest alle Missions-Parameter aus der description.ext aus, mit den eingestellten Werten aus der Lobby und macht sie als Variablen verfügbar (OPT_PLAYTIME usw)
- Falls `__MAP__`, entfernt ItemMap und ItemGPS aus dem Spielerinventar
- Falls `__VIEW_DISTANCE__`, setzt lokal die Sichtweite (Wert aus setup.sqf)
- Falls `__GRASS_OFF__`, setzt lokal TerrainGrid auf 50, ansonsten den Wert aus der description.ext (50 oder 3.125)
- **sideEffect**: führt die `setup_classnames.sqf` aus
- **sideEffect**: führt `common\x_netinit.sqf` und `common\netEvents.sqf` aus
- setzt `tf_give_microdagr_to_soldier` auf false
- lädt `dialogs\vehiclePool_war.hpp`
- **sideEffect**: falls `isServer`, lädt `i_server.sqf` TODO: `initServer.sqf` einführen
- **sideEffect**: falls `!isDedicated`, lädt `i_client.sqf` TODO: initPlayerLocal.sqf einführen
- Falls __STARTTIME__, setzt Uhrzeit auf OPT_DAYTIME (Stunden)
- **sideEffect**: führt `addons\far_revive\FAR_revive_init.sqf` aus
- **sideEffect**: post-init area: Lädt weitere Scripte und setzte Werte 
- **sideEffect**: startet `addons\opt3_sectorControl\opt_startMission.sqf`, entweder mit `OPT_TRUCETIME`, oder falls `OPT_TRAINING`, mit 30. Script ist zuständig, die eigentliche Mission zu starten!






