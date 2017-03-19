#define addf(fname) class fname {headerType = -1;}

class tcb {
	tag = "tcb";
	class Common_Net {
		file = "common\func\net";
		addf(netaddevent);
		addf(netaddeventcts);
		addf(netaddeventsto);
		addf(netaddeventtoclients);
		addf(netremoveevent);
		addf(netremoveeventcts);
		addf(netremoveeventsto);
		addf(netremoveeventservtoclients);
		addf(netrunevent);
		addf(netruneventcts);
		addf(netruneventsto);
		addf(netruneventtoclients);
		addf(netcallevent);
		addf(netcalleventcts);
		addf(netcalleventsto);
		addf(netcalleventtoclients);
		addf(netsetjip);
		addf(localcallevent);
	};
	class common {
		file = "common\func";
		addf(arrayPushStack);
		addf(arrayPushStack2);
		addf(arrayInsert);
		addf(randomFloor);
		addf(randomIndexArray);
		addf(countedIndexArray);
		addf(randomFloorArray);
		addf(randomArrayVal);
		addf(randomCeil);
		addf(playersNumber);
		addf(removeNVG);
		addf(getDisplayName);
		addf(createMarkerGlobal);
		addf(createMarkerLocal);
		addf(createTrigger);
		addf(returnConfigEntry);
		addf(returnVehicleTurret);
		addf(fuelCheck);
		addf(jukeBox);
		addf(checkMTShotHD);
		addf(getHiddenTask);
		addf(succeedTask);
		addf(failedTask);
		addf(cancelTask);
	};
	class client {
		file = "common\client\func";
		addf(vehicleChat);
		addf(HQchat);
		addf(sidechat);
		addf(globalchat);
		addf(playerRespawn);
		addf(addperframe);
		addf(perframe);
		addf(removeperframe);
		addf(checkGroupPower);
		addf(MarkerPlayers);
		addf(screen);
	};

	class server {
		file = "common\server\func";
		addf(handleDeadVehicle);
		addf(checkVehicleEmpty);
	};
	class tcb_preinit {
		file = "common";
		class preinit {
			preInit = 1;
			headerType = -1;
		};
		class briefing {
			postInit = 1;
		};
	};
};


// OPT
class opt {
	tag = "opt";
	class dialogs {
		file = "dialogs";
		addf(maintainerVecList);
		addf(updateHUD);
	};
	class common {
		file = "common\func";
		addf(zone_sectorControl_Msg);
		addf(vehicleBeam);
		addf(wallChain);
	};
	class client {
		file = "common\client\func";
		addf(earplugs);
		addf(dynamicGroups);
		addf(iconDrawGPS);
		addf(iconDrawMap);
		addf(iconText);
		addf(iconSize);
		addf(iconType);
		addf(iconColor);
		addf(teleport);
		addf(sendVehicleOrder);
		addf(maintainerDialog);
		addf(maintainerActions);
		addf(maintainerOrderVehicle);
		addf(weaponCheck);
		addf(flipCheck);
		addf(unFlip);
		addf(spectating);
	};
	class server {
		file = "common\server\func";
		addf(updateVehiclePool);
		addf(spawnVehicle);
		addf(setFlagOwner);
		addf(calculateDominator);
		addf(vehicleLogEvent);
		addf(logPScore);
	};
};

// OPT_addons
class opt_addons {
	tag = "opt_addons";
	class common {
		file = "addons\far_revive\func";
		addf(playerActions);
		addf(handleDamage);
		addf(Unconcious);
		addf(HandleStabilize);
		addf(Drag);
		addf(Release);
		addf(CheckRevive);
		addf(CheckStabilize);
		addf(checkSuicide);
		addf(checkDragging);
		addf(IsFriendlyMedic);
		addf(CheckFriendlies);
		addf(createMarker);
		addf(removeMarker);
		addf(toggleTFAR);
		addf(HandleRevive);
		addf(arrayPush);
		addf(isMedic);
		addf(garbage);
		addf(medicEquipment);
		addf(progressBarInit);
		addf(progressBar);
		addf(playerInit);
		addf(reviveUI);
		addf(reviveCamera);
		addf(keyUnbind);
		addf(showKiller);
	};
};