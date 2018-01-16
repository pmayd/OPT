#define SECTORCONTROL_MINE_FREE_FLAG_MESSAGE "Mine in der Minensperrzone gelegt!<br/>Mine wurde zurück ins Inventar gelegt."
#define SECTORCONTROL_ACTION_SELECT_FLAG 'Angriffsflagge wählen'
#define SECTORCONTROL_ACTION_FLAG 'Flagge ziehen'

// Flagge kann nur nach Missionsstart, in 5 m Radius, ausserhalb eines Fahrzeugs und in Restspielzeit gezogen werden und nur von der anderen Seite
#define SECTORCONTROL_FLAG_CONDITION FORMAT_4("(_target distance player) < %1 and vehicle player == player and %2 and (OPT_PARAM_PLAYTIME - (serverTime - %3)) > 0 and (%4 != _target getVariable 'owner')", GVAR(flagDistanceToPlayer),QGVARMAIN(missionStarted),QEGVAR(mission,startTime),QUOTE(PLAYER_SIDE))


