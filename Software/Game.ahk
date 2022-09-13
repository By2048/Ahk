
#If ( IsGame() )
    #BackSpace::
        Run, Setup.bat GameMode, %A_WorkingDir%, Hide
        ; HelpText("`n Game Mode `n", "Center", "Screen3")
    Return
#If
