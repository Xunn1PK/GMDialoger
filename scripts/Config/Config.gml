 /*/  / / Configuration script / /  /*/
/*/  / / Check  documentation / /  /*/

#macro  DIALOG_SPEED            15
#macro  DIALOG_FONT             "fDefault"
#macro  DIALOG_COLOR            "#FFFFFF"
#macro  DIALOG_SMOOTHNESS       0
#macro  MAX_DIALOG_LINE_WIDTH   720
#macro  MAX_CHOICE_LINE_WIDTH   128
#macro  TEXT_X_OFFSET           32
#macro  TEXT_Y_OFFSET           32
#macro  LINE_SPACING            32 
#macro  PORTRAIT_X_OFFSET       64
#macro  PORTRAIT_Y_OFFSET       64
#macro  DIALOGS_CONSTRUCTOR     dialogs 
#macro  BUTTON_ADVANCE          [ord("Z"), vk_enter]
#macro  BUTTON_REVEAL           [ord("X"), vk_shift]
#macro  BUTTON_SKIP             [ord("C"), vk_control] 
#macro  DIALOG_POS_X            round(display_get_gui_width() / 5)
#macro  DIALOG_POS_Y            round(display_get_gui_height() / 8)
#macro  DIALOG_FRAME_WIDTH      MAX_DIALOG_LINE_WIDTH + TEXT_X_OFFSET * 2
#macro  DIALOG_FRAME_HEIGHT     TEXT_Y_OFFSET * 2 + LINE_SPACING * MAX_DIALOG_LINES
#macro  MAX_DIALOG_LINES        3