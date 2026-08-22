global._DIALOG = {
    Current: "test",
    Queue: [],
    Speed: DIALOG_SPEED,
    Smoothness: SMOOTHNESS,
    Portrait: undefined,
    Char: 0,
    Pos: {
        x: DIALOG_POS_X,
        y: DIALOG_POS_Y
    }
}

scribble_font_set_default(DIALOG_FONT);

changePortrait = function(element, parameterArray, characterIndex) {
    var sprite = asset_get_index(parameterArray[0]);
    if (asset_get_type(sprite) == asset_sprite) {
        global._DIALOG.Portrait = sprite;
    } else {
        show_debug_message($"Error: {parameterArray[0]} is not a sprite!");
    }
}
scribble_typists_add_event("portrait", Dialoger.changePortrait);
