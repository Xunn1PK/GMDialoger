function editDialogProperty(name, value) {
    if (variable_struct_exists(global._DIALOG, name)) {
        global._DIALOG[$ name] = value;
    } else {
        show_message($"Error: {name} is not a global._DIALOG property!");
    }
}

function callDialog(id, x = DIALOG_POS_X, y = DIALOG_POS_Y, speed = DIALOG_SPEED, extra_properties = []) {
    if (global._DIALOG.Current != undefined) return;
    editDialogProperty("Current", id);
    editDialogProperty("PosX", x);
    editDialogProperty("PosY", y);
    editDialogProperty("Speed", speed);
    for (var i = 0; i < array_length(extra_properties); i++) {
        var name = extra_properties[i].name ?? "";
        var value = extra_properties[i].value ?? undefined;
        editDialogProperty(name, value);
    }
}