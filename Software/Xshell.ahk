
#if ( WindowsActive("Xshell") )

    ;下一个选项卡
    ^]::Return
    !Tab::Send ^] 

    ;上一个选项卡
    ^[::Return
    !+Tab::Send ^[

    ;清屏 
    ^\::Return
    !Esc::Send ^\ 

#if
