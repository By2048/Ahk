
#if ( CheckWindowsActive("Xshell") )

    ^F1::Return
    ^F2::Return
    ^F3::Return
    ^F4::Return
    ^F5::Return
    ^F6::Return
    ^F7::Return
    ^F8::Return
    ^F9::Return
    ^F10::Return
    ^F11::Return
    ^F12::Return

    ;下一个选项卡
    ^]::Return
    !Tab::Send ^] 

    ;上一个选项卡
    ^[::Return
    !+Tab::Send ^[

    ;结束运行
    !BackSpace::Send ^c
    
    ;复制
    ^c::Send ^{F1}

    ;清屏 
    ^/::Return
    !Esc::Send ^/

    ;关闭窗口
    ^\::Return
    !CapsLock::Send ^\

    ;关闭所有窗口
    ^+\::Return
    !+CapsLock::Send ^+\

#if
