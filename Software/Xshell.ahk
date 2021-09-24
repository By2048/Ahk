
#if ( WindowsActive("Xshell") )

    #IncludeAgain %A_WorkingDir%\Software\#Fxx.ahk

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
