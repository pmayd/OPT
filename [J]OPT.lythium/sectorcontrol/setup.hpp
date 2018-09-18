#define SECTORCONTROL_MINE_FREE_FLAG_MESSAGE "Mine in der Minensperrzone gelegt!<br/>Mine wurde gelöscht."
#define SECTORCONTROL_ACTION_SELECT_FLAG 'Angriffsflagge wählen'
#define SECTORCONTROL_ACTION_FLAG 'Flagge ziehen'

// Flagge kann nur nach Missionsstart, in 5 m Radius, ausserhalb eines Fahrzeugs und in Restspielzeit gezogen werden und nur von der anderen Seite
#define SECTORCONTROL_FLAG_CONDITION FORMAT_3("vehicle player == player and %1 and (OPT_PARAM_PLAYTIME - (serverTime - %2)) > 0 and (%3 != _target getVariable 'owner')",QGVARMAIN(missionStarted),QEGVAR(mission,startTime),QUOTE(PLAYER_SIDE))


