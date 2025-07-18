
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

#HotIf
