
~Esc::{
    Global CapsLockActivate , CapsLockToEsc
    CapsLockActivate := False
    CapsLockToEsc    := False
}


AppsKeyRedirect   := False
AppsKeyEnterCount := 0
$AppsKey::{
    Global AppsKeyRedirect , AppsKeyEnterCount
    Send "{AppsKey}"
    AppsKeyRedirect   := True
    AppsKeyEnterCount := 1
}


RWin::{
    Send "{Blind}{vkFF}"
    WinGetClientPos(&x, &y, &w, &h, "A")
    if ( x <= 0 || y <= 0 )
        return
    MoveWindowCenter()
    win := GetHideWindowConfig()
    if ( ObjOwnPropCount(win) )
        CenterHideWindow()
}


~LCtrl::
~LShift::{
    if ( Arg.ClickCnt > 0 ) {
        Arg.ClickCnt += 1
        return
    } else {
        Arg.ClickCnt := 1
    }
    SetTimer(Timer, -500)
    Timer() {
        if ( Arg.ClickCnt == 2 )
            Arg.ClickKey := A_ThisHotkey
    }
}


RWin & RAlt::{
    Send "{Blind}{vkFF}"
    MoveWindowQuick("Mini")
}
RWin & RCtrl::{
    Send "{Blind}{vkFF}"
    MoveWindowQuick("Main")
}


; 设置
LAlt & RAlt::{
    Send "{Help}"
    WinWaitActive("设置")
    if ( WinGetTitle("A") == "设置" )
        MoveWindowCenter()
}
; 快速切换
RAlt & LAlt::{
    Send "^!+{Help}"
    CenterHideWindow()
}


; 代码注释
LAlt & RShift::Send "^{Help}"
RShift & LAlt::Send "!{Help}"


; Xxx
RAlt & RShift::Send "!+{Help}"
RShift & RAlt::Send "^!{Help}"
