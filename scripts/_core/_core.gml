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
    var text_x = dialog.PosX + dialog.TextOffsetX;
    var text_y = dialog.PosY + dialog.TextOffsetY;
    var wrap = dialog.MaxLineWidth;
    var portrait = dialog.Portrait;
    var current = Dialogs[$ dialog.Current];
    var btn = {
        z: BUTTON_ADVANCE,
        x: BUTTON_REVEAL,
        c: BUTTON_SKIP
    }
    #endregion
    
    if (dialog.Current == undefined) {
        return;
    }
    
    typist.in(getSpeed(dialog.Speed), dialog.Smoothness);
    
    #region Buttons handling
    var length = current.Dialog.Type != DIALOG_TYPE.CHOICE ? string_length_scribble(current.Dialog.String) : 0;
    if (typist.get_position() < length) {
        if (CheckButtonArray("pressed", btn.x) || CheckButtonArray("", btn.c)) {
            typist.skip();
        }
    } else if ((CheckButtonArray("pressed", btn.z) || CheckButtonArray("", btn.c))) {
        if (current.Dialog.NextDialog >= 0) {
            // There will be dialog call function
        } else {
            global._DIALOG.Current = undefined;
            return;
        }
    }
    #endregion
    
    #region Text rendering
    if (current.Dialog.Type != DIALOG_TYPE.CHOICE) {
        // Portrait sprite
        if (dialog.Portrait != undefined) {
            draw_sprite(dialog.Portrait, -1, dialog.PosX + dialog.PortraitOffsetX, dialog.PosY + dialog.PortraitOffsetY);
            text_x += dialog.PortraitOffsetX;
            text_y += dialog.PortraitOffsetY;
            wrap -= dialog.PortraitOffsetX;
        }
        
        // Dialog Frame
        var frame_xscale = dialog.FrameWidth / sprite_get_width(sDialogFrame);
        var frame_yscale = dialog.FrameHeight / sprite_get_height(sDialogFrame);
        draw_sprite_ext(sDialogFrame, -1, dialog.PosX, dialog.PosY, frame_xscale, frame_yscale, 0, #FFFFFF, 1);
        
        // Text
        scribble(current.Dialog.String, "Dialog").wrap(wrap).line_spacing(dialog.LineSpacing).draw(text_x, text_y, typist);
        
        // Choices
        if (current.Choices != undefined) {
            // there will be choices code
        }
    }
    #endregion
}