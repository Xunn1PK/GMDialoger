global._DIALOG = {
    Current: undefined,
    Portrait: undefined,
    Char: 0,
    Speed: DIALOG_SPEED,
    Smoothness: DIALOG_SMOOTHNESS,
    FrameWidth: DIALOG_FRAME_WIDTH,
    FrameHeight: DIALOG_FRAME_HEIGHT,
    MaxLineWidth: MAX_DIALOG_LINE_WIDTH,
    MaxLines: MAX_DIALOG_LINES,
    LineSpacing: LINE_SPACING,
    TextOffsetX: TEXT_X_OFFSET,
    TextOffsetY: TEXT_Y_OFFSET,
    PosX: DIALOG_POS_X,
    PosY: DIALOG_POS_Y,
    PortraitOffsetX: PORTRAIT_X_OFFSET,
    PortraitOffsetY: PORTRAIT_Y_OFFSET
}

scribble_font_set_default(DIALOG_FONT);

#region CUSTOM TYPIST EVENTS
changePortrait = function(element, parameterArray, characterIndex) {
    var sprite = asset_get_index(parameterArray[0]);
    if (asset_get_type(sprite) == asset_sprite) {
        global._DIALOG.Portrait = sprite;
    } else {
        show_debug_message($"Error: {parameterArray[0]} is not a sprite!");
    }
}
scribble_typists_add_event("portrait", Dialoger.changePortrait);
#endregion
