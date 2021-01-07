

#if WinActive("ahk_exe TIM.exe")
    >#\::
        xx:=10
        yy:=10
        ww:=screen_1_w/2-10-10
        hh:=screen_1_h-10-10
        SetWindows(xx,yy,ww,hh)
    Return
#if



#if WinActive("ahk_exe WeChat.exe")
    >#\::
        xx:=screen_1_w/2+10
        yy:=10
        ww:=screen_1_w/2-10-10
        hh:=screen_1_h-10-10
        SetWindows(xx,yy,ww,hh)
    Return
#if