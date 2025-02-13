
#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" ) && ( Arg.quick_tool_show == True )

    Up::
    Left::
    [::
    ]::{
        ErFileQuickToolsSwitchMenu(-1)
    }

    Down::
    Right::
    \::{
        ErFileQuickToolsSwitchMenu(+1)
    }

    =::ErFileQuickToolsSwitchPage(-1)
    BackSpace::ErFileQuickToolsSwitchPage(+1)

    Esc::
    AppsKey::
    CapsLock::
    Insert::{
        ErFileQuickToolsHide()
    }
    
    Delete::ErFileQuickRun()

    Enter::ErFileQuickMove()

    #Include Joy.Arg.ahk

#HotIf
