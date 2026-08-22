global._DIALOG = {
    Current: "test",
    Queue: [],
    Speed: DEFAULT_DIALOG_SPEED,
    Smoothness: DEFAULT_SMOOTHNESS,
    Portrait: undefined,
    Char: 0,
    Pos: {
        x: round(display_get_gui_width() / 5),
        y: round(display_get_gui_height() / 8)
    }
}

scribble_font_set_default(DEFAULT_DIALOG_FONT);

changePortrait = function(element, parameterArray, characterIndex) {
    var sprite = asset_get_index(parameterArray[0]);
    if (asset_get_type(sprite) == asset_sprite) {
        global._DIALOG.Portrait = sprite;
    } else {
        show_debug_message($"Error: {parameterArray[0]} is not a sprite!");
    }
}
scribble_typists_add_event("portrait", Dialoger.changePortrait);
