global._DIALOG = {
    Current: -1,
    Queue: [],
    Speed: DEFAULT_DIALOG_SPEED,
    Portrait: undefined,
    Smoothness: DEFAULT_SMOOTHNESS,
    Char: 0
}

changePortrait = function(element, parameterArray, characterIndex) {
    var sprite = asset_get_index(parameterArray[0]);
    if (asset_get_type(sprite) == asset_sprite) {
        global._DIALOG.Portrait = sprite;
    } else {
        show_debug_message($"Error: {parameterArray[0]} is not a sprite!");
    }
}
scribble_typists_add_event("portrait", Dialoger.changePortrait);