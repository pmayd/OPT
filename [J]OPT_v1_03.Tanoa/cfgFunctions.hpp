#define addf(fname) class fname {headerType = -1;}

class tcb {

		class Common_Net {
		file = "common\func\net";
		addf(localcallevent);
		addf(netaddevent);
		addf(netaddeventcts);
		addf(netaddeventsto);
		addf(netaddeventtoclients);
		addf(netcallevent);
		addf(netcalleventcts);
		addf(netcalleventsto);
		addf(netcalleventtoclients);
		addf(netremoveevent);
		addf(netremoveeventcts);
		addf(netremoveeventservtoclients);
		addf(netremoveeventsto);
		addf(netrunevent);
		addf(netruneventcts);
		addf(netruneventsto);
		addf(netruneventtoclients);
		addf(netsetjip);
	};
	class common {
		file = "common\func";
		addf(arrayInsert);
		addf(arrayPushStack);
		addf(arrayPushStack2);
		addf(cancelTask);
		addf(checkMTShotHD);
		addf(countedIndexArray);
		addf(createMarkerGlobal);
		addf(createMarkerLocal);
		addf(createTrigger);
		addf(failedTask);
		addf(fuelCheck);
		addf(getDisplayName);
		addf(getHiddenTask);
		addf(jukeBox);
		addf(playersNumber);
		addf(randomArrayVal);
		addf(randomCeil);
		addf(randomFloor);
		addf(randomFloorArray);
		addf(randomIndexArray);
		addf(removeNVG);
		addf(returnConfigEntry);
		addf(returnVehicleTurret);
		addf(succeedTask);
	};
	class client {
		file = "common\client\func";
		addf(addperframe);
		addf(checkGroupPower);
		addf(globalchat);
		addf(HQchat);
		addf(MarkerPlayers);
		addf(perframe);
		addf(removeperframe);
		addf(screen);
		addf(sidechat);
		addf(vehicleChat);
	};

	class server {
		file = "common\server\func";
		addf(checkVehicleEmpty);
		addf(handleDeadVehicle);
	};
	class tcb_preInit {
		file = "common";
		class preInit {
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

	class dialogs {
		file = "dialogs";
		addf(maintainerVecList);
		addf(updateHUD);
		addf(updateBudget);
	};
	class common {
		file = "common\func";
		addf(vehicleBeam);
		addf(wallChain);
		addf(zone_sectorControl_Msg);
	};
	class client {
		file = "common\client\func";
		addf(dynamicGroups);
		addf(earplugs);
		addf(flipCheck);
		addf(intro);
		addf(maintainerActions);
		addf(maintainerDialog);
		addf(maintainerOrderVehicle);
		addf(renderBudget);
		addf(repairSystem);
		addf(sellVehicle);
		addf(sendVehicleOrder);
		addf(spectating);
		addf(teleport);
		addf(unFlip);
		addf(weaponCheck);
	};
	class server {
		file = "common\server\func";
		addf(calculateDominator);
		addf(logPScore);
		addf(setFlagOwner);
		addf(spawnVehicle);
		addf(updateVehiclePool);
	};
};

// OPT_addons
class opt_addons {

	class common {
		file = "addons\far_revive\func";
		addf(arrayPush);
		addf(checkDragging);
		addf(CheckFriendlies);
		addf(CheckRevive);
		addf(CheckStabilize);
		addf(checkSuicide);
		addf(createMarker);
		addf(Drag);
		addf(garbage);
		addf(handleDamage);
		addf(HandleRevive);
		addf(HandleStabilize);
		addf(IsFriendlyMedic);
		addf(isMedic);
		addf(keyUnbind);
		addf(medicEquipment);
		addf(playerActions);
		addf(playerInit);
		addf(progressBar);
		addf(progressBarInit);
		addf(Release);
		addf(removeMarker);
		addf(reviveCamera);
		addf(reviveUI);
		addf(showKiller);
		addf(toggleTFAR);
		addf(Unconcious);
	};
};

#include "addons\AME\Core\cfgFunctions.hpp" // basic framework
#include "addons\Core\cfgFunctions.hpp" // display Text
#include "addons\UAV\cfgFunctions.hpp" // addon für Drohnenstation
#include "addons\MineDetector\cfgFunctions.hpp" // addon für Minendetektor