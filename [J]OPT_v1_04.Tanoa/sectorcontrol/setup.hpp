#define SECTORCONTROL_MINE_FREE_FLAG_MESSAGE "Mine in der Minensperrzone gelegt!<br/>Mine wurde zurück ins Inventar gelegt."
#define SECTORCONTROL_ACTION_FLAG 'Flagge ziehen'
#define SECTORCONTROL_FLAG_DISTANCE_TO_PLAYER 5

// Flagge kann nur nach Missionsstart, in 5 m Radius, ausserhalb eines Fahrzeugs und in Restspielzeit gezogen werden und nur von der anderen Seite
#define SECTORCONTROL_FLAG_CONDITION FORMAT_2(QUOTE(((_target distance player) < SECTORCONTROL_FLAG_DISTANCE_TO_PLAYER) and vehicle player == player and %1 and (OPT_PARAM_PLAYTIME - (serverTime - %2)) > 0 and (PLAYER_SIDE != UNIT_SIDE(_target))),QGVARMAIN(missionStarted),QEGVAR(mission,startTime))