
RegisterSoftware( "psl" , "PowerShell" )

RegisterPosition( "PowerShell" , Position("[Center][1]",1210,1112) , "Default" )
RegisterPosition( "PowerShell" , Position("[Center][2]",1210,1112) , "Backup"  )


#Include *i PowerShell.Private.ahk


#HotIf CheckWindowActive( "PowerShell" )

    #[::{
        MoveWindowBackup()
    }
    
    #]::{
        MoveWindowDefault()
    }

    BackSpace & Insert::{
        WinClose("A")
    }

    BackSpace & Delete::{
        Send "^c"
        Send "^c"
        Send "^c"
        Sleep 99
        if ( CheckWindowActive("PowerShell") )
            WinClose("A")
    }

#HotIf
