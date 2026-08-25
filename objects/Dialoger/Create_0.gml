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
editDialogPropertyInline = function(element, parameterArray, characterIndex) {
    editDialogProperty(parameterArray[0], parameterArray[1]);
}
scribble_typists_add_event("property", Dialoger.editDialogPropertyInline);
#endregion
