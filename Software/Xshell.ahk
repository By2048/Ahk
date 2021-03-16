
#if ( WindowsActive("Xshell") )

    ;下一个选项卡
    ^]::Return
    !Tab::Send ^] 

    ;上一个选项卡
    ^[::Return
    !+Tab::Send ^[

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
