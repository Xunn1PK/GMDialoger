function dialogs() constructor {
    #region System
    static dlg = function(type, skippable, str, portrait, next) constructor {
        Type = type;
        skippable = skippable;
        String = string(str);
        Portrait = portrait;
        NextDialog = next;
    }
    static choice = function(str, next, after) constructor {
        String = string(str);
        NextDialog = next;
        Consequences = is_callable(after) ? after : function() {}
    }
     
    
    static Dialogs = [
        //ID: 0
        {
            Dialog: new dlg(
                DIALOG_TYPE.DIALOG,
                true,
                "Hello! This is [#FFFF00]test dialog.[/c]",
                undefined,
                -1
            ),
            Choices: undefined
        }
    ]
}