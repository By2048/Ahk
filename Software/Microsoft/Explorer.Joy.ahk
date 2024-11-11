
#HotIf ( Arg.quick_tool_show == True )

    ; 上
    Numpad8::FileQuickToolsSwitchMenu(-1)
    ; 下
    Numpad2::FileQuickToolsSwitchMenu(+1)
    ; 左
    Numpad4::FileQuickToolsSwitchPage(-1)
    ; 右
    Numpad6::FileQuickToolsSwitchPage(+1)
    
    ; 上
    Numpad9::FileQuickMove()
    ; 下
    Numpad3::FileQuickToolsHide()
    ; 左
    Numpad7::FileQuickRun()
    ; 右
    Numpad1::FileQuickTools()

#HotIf


#HotIf CheckWindowActive( "Explorer" , "CabinetWClass" )

    ; 上
    Numpad8::Send "{Up}"

    ; 下
    Numpad2::Send "{Down}"

    ; 左
    Numpad4::ErActivateLeft()

    ; 右
    Numpad6::ErActivateRight()

    ;---------------------------------;

    ; 上
    Numpad9::Send "{Enter}"

    ; 下
    Numpad3::Send "{Delete}"

    ; 左
    Numpad7::FileQuickPreview()

    ; 右
    Numpad1::FileQuickTools()

    ;---------------------------------;

    NumpadAdd::Send "{BackSpace}"

    NumpadMult::Send "{AppsKey}"

    NumpadDiv::ErActivateMenu()

    NumpadSub::Send "{Esc}"

#HotIf
