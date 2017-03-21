# Documentation of OPT Mission
Diese Datei dient ausschließlich der Dokumentation aller Features und Zusammenhänge und erfüllt keinen direkten Nutzen nach außen bzw. erklärt keinerlei Optionen für den Endbenutzer. Diese Datei ist als umfassende Dokumentation für Missionsbauer und Maintainer gedacht.

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


