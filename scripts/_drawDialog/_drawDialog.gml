function _drawDialog(){
    #region Statics
    static _ = new DIALOGS_CONSTRUCTOR();
    static Dialogs = _.Dialogs;
    static typist = scribble_typist(false);
    
    static CheckButtonArray = function(type, button_array) {
        var checkFunction;
        switch (type) {
            case "pressed": 
                checkFunction = keyboard_check_pressed;
                break;
            case "released":
                checkFunction = keyboard_check_released;
                break;
            default:
                checkFunction = keyboard_check;
                break;
        }
        
        for (var i = 0; i < array_length(button_array); i++) {
            if (checkFunction(button_array[i])) {
                return true;
            }
        }
    }
    
    static getSpeed = function(spd) {
        return spd / game_get_speed(gamespeed_fps);
    }
    #endregion
    
    #region Variables
    var dialog = global._DIALOG;
    var text_x = dialog.Pos.x + dialog.TextOffset.x;
    var text_y = dialog.Pos.y + dialog.TextOffset.y;
    var wrap = dialog.MaxLineWidth;
    var portrait = dialog.Portrait;
    var current = Dialogs[$ dialog.Current];
    var btn = {
        z: BUTTON_ADVANCE,
        x: BUTTON_REVEAL,
        c: BUTTON_SKIP
    }
    #endregion
    
    if (dialog.Current < 0) return;
    
    typist.in(getSpeed(dialog.Speed), dialog.Smoothness);
    
    #region Buttons handling
    var length = current.Dialog.Type != DIALOG_TYPE.CHOICE ? string_length_scribble(current.Dialog.String) : 0;
    if (dialog.Char < length) {
        if (CheckButtonArray("pressed", btn.x) || CheckButtonArray("", btn.c)) {
            typist.skip();
        }
    } else if (CheckButtonArray("pressed", btn.z) || CheckButtonArray("", btn.c)) {
        if (current.Dialog.NextDialog >= 0) {
            // There will be dialog call function
        } else {
            global._DIALOG.Current = -1;
            array_delete(global._DIALOG.Queue, 0, 1);
            return;
        }
    }
    #endregion
    
    #region Text rendering
    if (current.Dialog.Type != DIALOG_TYPE.CHOICE) {
        // Portrait sprite
        if (dialog.Portrait != undefined) {
            draw_sprite(dialog.Portrait, -1, dialog.Pos.x + dialog.PortraitOffset.x, dialog.Pos.y + dialog.PortraitOffset.y);
            text_x += dialog.PortraitOffset.x;
            text_y += dialog.PortraitOffset.y;
            wrap -= dialog.PortraitOffset.x;
        }
        
        // Text itself
        scribble(current.Dialog.String, "Dialog").wrap(wrap).line_spacing(LINE_SPACING).draw(text_x, text_y, typist);
        
        // Choices
        if (current.Choices != undefined) {
            // there will be choices code
        }
    }
    #endregion
}