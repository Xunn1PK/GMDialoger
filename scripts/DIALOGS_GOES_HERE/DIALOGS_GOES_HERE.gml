function dialogs() constructor {
    #region System
    static dlg = function(type, skippable, str, portrait, next_dialog) constructor {
        Type = type;
        skippable = skippable;
        String = string(str);
        Portrait = portrait;
        NextDialog = next_dialog;
    }
    static choice = function(str, next_dialog, consequences) constructor {
        String = string(str);
        NextDialog = next_dialog;
        Consequences = is_callable(consequences) ? consequences : function() {}
    }
     
    
    static Dialogs = [
        //ID: 0
        {
            Dialog: new dlg(
                DIALOG_TYPE.DIALOG,
                true,
                "Hello! This is [#FFFF00]test dialog.[/c]"
                ,undefined,
                -1
            ),
            Choices: undefined
        }
    ]
}