
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )
    Insert::ErQuickTools()
    Delete::Delete
#HotIf


#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" ) && ( Arg.ErQuick.show == True )

    =::ErQuickToolsSwitchPage(-1)
    BackSpace::ErQuickToolsSwitchPage(+1)

    Up::
    Left::
    [::
    ]::{
        ErQuickToolsSwitchMenu(-1)
    }

    Down::
    Right::
    \::{
        ErQuickToolsSwitchMenu(+1)
    }

    Esc::
    AppsKey::
    CapsLock::
    Insert::{
        ErQuickToolsHide()
    }
    
    Delete::ErQuickRun()

    Enter::ErQuickMove()

    #Include Joy.Arg.ahk

#HotIf
