// Default dialog speed (in characters per second)
#macro  DEFAULT_DIALOG_SPEED        4

// Default dialog font.
// It must be a string with asset name, not the asset reference inself
#macro  DEFAULT_DIALOG_FONT         "fDefault"

// Default dialog color.
// Can be a hex-code or color constant (c_red, c_yellow etc.)
#macro  DEFAULT_DIALOG_COLOR        "#FFFFFF"

// Default dialogs' scribble typist in smoothness
// See scribble documentation for more info
#macro  DEFAULT_SMOOTHNESS          0

// Max width of dialog and choice lines (in pixels)
#macro  MAX_DIALOG_LINE_WIDTH       360
#macro  MAX_CHOICE_LINE_WIDTH       128

// Text x and y offsets
#macro  TEXT_X_OFFSET               64
#macro  TEXT_Y_OFFSET               64

// Line spacing
#macro  LINE_SPACING                24 

// Portrait sprite x and y offsets
#macro  PORTRAIT_SPRITE_X_OFFSET    64
#macro  PORTRAIT_SPRITE_Y_OFFSET    64

// Dialogs' constructor function name.
// Usually you don't need to change this, unless you've renamed the function 
// or just want to rewrite everything xD
#macro  DIALOGS_CONSTRUCTOR         dialogs 

// Dialog control buttons.
// ADVANCE - Advance to the next dialog when current is fully revealed
// REVEAL - Instantly reveal all text (if don't revealed already)
// SKIP - Skip dialog(s) entirely (like spamming ADVANCE and REVEAL at the same time)
#macro  BUTTON_ADVANCE              [ord("Z"), vk_enter]
#macro  BUTTON_REVEAL               [ord("X"), vk_shift]
#macro  BUTTON_SKIP                 [ord("C"), vk_control] 