
RegisterProcess("DingTalk" , "DingDing")


#HotIf CheckWindowActive("DingDing")

    ; 发送消息
    ^Enter::Return
    !Enter::Send "^{Enter}"

    <#\::{
        win_x := 10
        win_y := 10
        win_w := Screens.1.w/2 -10-10 +100
        win_h := Screens.1.h   -10-10
        MoveWindowToPosition([ win_x , win_y , win_w , win_h ])
    }

#HotIf



#HotIf CheckWindowActive("TIM")

    ; 切换
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 关闭窗口
    ^w::Return
    !CapsLock::Send "^w"

    ; 发送消息
    ^Enter::Return
    !Enter::Send "^{Enter}"

    <#\::{
        win_x := 10
        win_y := 10
        win_w := Screens.1.w/2 -10-10 +100
        win_h := Screens.1.h   -10-10
        MoveWindowToPosition([ win_x , win_y , win_w , win_h ])
    }

#HotIf



#HotIf CheckWindowActive("WeChat")

    ; 切换
    ^Tab::Return
    ^+Tab::Return
    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 上下切换
    ^Up::Return
    ^Down::Return

    ; 关闭窗口
    !c::Return
    !CapsLock::Send "!c"

    ; 发送消息
    ^Enter::Return
    !Enter::Send "^{Enter}"

    <#\::{
        win_x := Screens.1.w/2 +10    +100
        win_y := 10 + 14
        win_w := Screens.1.w/2 -10-10 -100
        win_h := Screens.1.h   -10-10 -14-14
        MoveWindowToPosition([ win_x , win_y , win_w , win_h ])
    }

#HotIf
