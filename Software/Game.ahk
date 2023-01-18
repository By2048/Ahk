
#HotIf ( IsGame() )
    #BackSpace::{
        Run "Setup.bat GameMode", A_InitialWorkingDir, "Hide"
        ; HelpText("`n Game Mode `n", "Center", "Screen3")
    }
#HotIf
