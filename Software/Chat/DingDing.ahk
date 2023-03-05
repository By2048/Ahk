

#HotIf CheckWindowActive("DingDing")

    ; 发送消息
    ^Enter::Return
    !Enter::Send "^{Enter}"

    <#\::{
        win_x := 10
        win_y := 10
        win_w := Screens.1.w/2 -10-10 +100
        win_h := Screens.1.h   -10-10
        WPD["DingDing"] := [ win_x , win_y , win_w , win_h ]
        InitWindowArgs()
        MoveWindowToDefaultPosition()
    }

#HotIf
