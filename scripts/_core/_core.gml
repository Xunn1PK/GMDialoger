function _drawDialog(){
    #region Statics
    static _ = json_load($"{STRINGS_FILES_PATH}{global.language}.json");
    static typist = scribble_typist(false);
    static chainElement = 0;
    
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
    
    if (global._DIALOG.Current == undefined) {
        return;
    }
    
    #region Variables
    var dialog = global._DIALOG;
    var text_x = dialog.PosX + dialog.TextOffsetX;
    var text_y = dialog.PosY + dialog.TextOffsetY;
    var wrap = dialog.MaxLineWidth;
    var portrait = dialog.Portrait;
    var current = _[$ dialog.Current][chainElement];
    var btn = {
        z: BUTTON_ADVANCE,
        x: BUTTON_REVEAL,
        c: BUTTON_SKIP
    }
    #endregion
    
    typist.in(getSpeed(dialog.Speed), dialog.Smoothness);
    
    #region Buttons handling
    var length = current.type != DIALOG_TYPE.CHOICE ? string_length_scribble(current.string) : 0;
    if (typist.get_position() < length) {
        if (CheckButtonArray("pressed", btn.x) || CheckButtonArray("", btn.c)) {
            typist.skip();
        }
    } else if ((CheckButtonArray("pressed", btn.z) || CheckButtonArray("", btn.c))) {
        typist.reset();
        if (chainElement < array_length(_[$ dialog.Current]) - 1) {
            chainElement++;
        } else {
            global._DIALOG.Current = undefined;
            return;
        }
    }
    #endregion
    
    #region Text rendering
    if (current.type != DIALOG_TYPE.CHOICE) { 
        // Dialog Frame
        var frame_sprite_width = sprite_get_width(sDialogFrame);
        var frame_sprite_height = sprite_get_height(sDialogFrame);
        var frame_xscale = dialog.FrameWidth / sprite_get_width(sDialogFrame);
        var frame_yscale = dialog.FrameHeight / sprite_get_height(sDialogFrame);
        var frame_x = dialog.PosX + frame_sprite_width * frame_xscale / 2;
        var frame_y = dialog.PosY + frame_sprite_height * frame_yscale / 2;
        draw_sprite_ext(sDialogFrame, -1, frame_x, frame_y, frame_xscale, frame_yscale, 0, #FFFFFF, 1);
        
        // Portrait sprite
        if (current.portrait != -1 && asset_get_type(current.portrait) == asset_sprite) {
            draw_sprite(asset_get_index(current.portrait), -1, dialog.PosX + dialog.PortraitOffsetX, dialog.PosY + dialog.PortraitOffsetY);
            text_x += dialog.PortraitOffsetX + dialog.TextOffsetX;
            wrap -= dialog.PortraitOffsetX;
        }
        
        // Text
        scribble(current.string, "Dialog").wrap(wrap).line_spacing(dialog.LineSpacing).draw(text_x, text_y, typist);
        
        // Choices
        if (variable_struct_exists(current, "choice")) {
            // there will be choices code
        }
    }
    #endregion
}