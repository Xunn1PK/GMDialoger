// Default dialog speed
// in characters per second
#macro  DEFAULT_DIALOG_SPEED        4

// Default dialog font.
// It must be a string with asset name, not the asset reference inself
#macro  DEFAULT_DIALOG_FONT         "fDefault"

// Default dialog color.
// Can be a hex-code or color constant (c_red, c_yellow etc.)
// For full constant list check __scribble_config_colours in
// SimpleGMDialoger/Dependicies/Scribble/Configuration - Please edit these!
#macro  DEFAULT_DIALOG_COLOR        "#FFFFFF"

// Max width of dialog and choice lines (in pixels)
#macro  MAX_DIALOG_LINE_WIDTH       360
#macro  MAX_CHOICE_LINE_WIDTH       128

// Dialogs' constructor function name.
// Dialogs should be stored as struct in construcor function
// (as in DIALOGS script).
// Also if you want you can just change function/script name and place it 
// anywhere else than it's default place.
#macro  DIALOGS_CONSTRUCTOR         dialogs 