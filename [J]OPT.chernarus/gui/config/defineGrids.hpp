/*
 *  Author: Dorbedo
 *
 *  Description:
 *      Grid Definitions
 *
 */

// the maximum display size with the 4:3 Ratio -> should be used for the most Interface-dialogs.
#define GUI_DLG_Abs (floor(((SafeZoneW/(pixelW*pixelGridNoUIScale))/4)min((SafeZoneH/(pixelH*pixelGridNoUIScale))/3)))
#define GUI_DLG_WAbs (4*GUI_DLG_Abs*pixelW * pixelGridNoUIScale)
#define GUI_DLG_HAbs (3*GUI_DLG_Abs*pixelH * pixelGridNoUIScale)
#define GUI_DLG_X (0.5-0.5*GUI_DLG_WAbs)
#define GUI_DLG_Y (0.5-0.5*GUI_DLG_HAbs)
#define GUI_DLG_W (GUI_DLG_WAbs/40)
#define GUI_DLG_H (GUI_DLG_HAbs/25)

// the maximum display size with the 16:9 Ratio
#define GUI_DISP_Abs (floor(((SafeZoneW/(pixelW*pixelGridNoUIScale))/16)min((SafeZoneH/(pixelH*pixelGridNoUIScale))/9)))
#define GUI_DISP_WAbs (16*GUI_DISP_Abs*pixelW*pixelGridNoUIScale)
#define GUI_DISP_HAbs (9*GUI_DISP_Abs*pixelH*pixelGridNoUIScale)
#define GUI_DISP_X (0.5-0.5*GUI_DISP_WAbs)
#define GUI_DISP_Y (0.5-0.5*GUI_DISP_HAbs)
#define GUI_DISP_W (GUI_DISP_WAbs/160)
#define GUI_DISP_H (GUI_DISP_HAbs/90)

#define GUI_MSG_X (safezoneX+GUI_DLG_W)
#define GUI_MSG_Y (0)
#define GUI_MSG_W (GUI_DLG_W*8)
#define GUI_MSG_H (GUI_DLG_H*3.2)
#define GUI_MSG_HEAD (GUI_DLG_H*0.8)
#define GUI_MSG_COL (GUI_DLG_W*0.08)
#define GUI_MSG_TEXT (GUI_DLG_H*2.4)
#define GUI_MSG_TEXTSIZE (GUI_MSG_HEAD)

/*
#define GUI_MSG_X (safezoneX+GUI_DISP_W)
#define GUI_MSG_Y (0)
#define GUI_MSG_W (GUI_DISP_W*20)
#define GUI_MSG_H (GUI_DISP_H*8)
#define GUI_MSG_HEAD (GUI_DISP_H*2)
#define GUI_MSG_COL (GUI_DISP_W*0.2)
#define GUI_MSG_TEXT (GUI_DISP_H*6)
#define GUI_MSG_TEXTSIZE (GUI_MSG_HEAD)
*/

#define TEXT_SIZE_SMALL (GUI_DLG_H*0.8)
#define TEXT_SIZE_MEDIUM (GUI_DLG_H*1)
#define TEXT_SIZE_LARGE (GUI_DLG_H*1.2)
