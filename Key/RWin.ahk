
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\Base.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Init.ahk
#Include %A_WorkingDir%\Tool\Help.ahk
#Include %A_WorkingDir%\Tool\Mouse.ahk
#Include %A_WorkingDir%\Tool\Other.ahk
#Include %A_WorkingDir%\Tool\Window.ahk

#SingleInstance Force
#NoTrayIcon

; RWin 
; 快捷键 (Ctrl Alt 系统全局) (Shift 功能反转)
; 窗口位置大小调整
; 结束窗口

>#Space::WindowsTerminal("Focus", "T:\\")
>#+Space::WindowsTerminal("Full", "T:\\")

>#b::Return
>#Tab::Return

; Snipaste截图
>#Insert::#^!PrintScreen
>#+Insert::#^!+PrintScreen
>#Delete::#^!CtrlBreak
>#+Delete::#^!+CtrlBreak

; 窗口大小调整
>#Left:: Send ^!{Numpad4}
>#Right::Send ^!{Numpad6}
>#Up::   Send ^!{Numpad8}
>#Down:: Send ^!{Numpad2}

; TIM
>#`;::Send ^!; ;识图
>#'::Send ^!' ;翻译

; CloudMusic
; >#\::Send #^!\ ;播放/暂停
; >#[::Send #^![ ;上一首
; >#]::Send #^!] ;下一首
; >#=::Send #^!= ;音量+
; >#-::Send #^!- ;音量-
; >#o::Send #^!o ;喜欢歌曲
; >#p::Send #^!p ;歌词
>#\::Send {Media_Play_Pause}
>#[::Send {Media_Prev}
>#]::Send {Media_Next}

RWin & RCtrl::MoveWindowToMainMini("Main")
RWin & RAlt::MoveWindowToMainMini("Mini")

; 移动窗口
RWin & LButton::
    SetWinDelay, 30
    MouseGetPos, mouse_x1, mouse_y1, win_id
    WinGet, win_min_max, MinMax, ahk_id %win_id%
    if (win_min_max) {
        return
    }
    WinGetPos, win_x1, win_y1, win_w1, win_h1, ahk_id %win_id%
    Loop {
        GetKeyState, left_button, LButton, P
        if (left_button == "U") {
            break
        }
        MouseGetPos, mouse_x2, mouse_y2, win_id
        move_x := mouse_x2 - mouse_x1
        move_y := mouse_y2 - mouse_y1
        win_x2 := win_x1 + move_x
        win_y2 := win_y1 + move_y
        WinMove, ahk_id %win_id%,  , %win_x2%, %win_y2%
    }
Return

>#,::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_resize_small
    windows_resize_small := True
    HelpText("Windows Resize Small")
Return

>#.::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_resize_big
    windows_resize_big := True
    HelpText("Windows Resize Big")
Return

>#/::
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return 
    }
    global windows_move
    windows_move := True
    HelpText("Move Windows")
Return

Global windows_move         := False
Global windows_resize_big   := False
Global windows_resize_small := False

; 设置代理
RWin & RShift::
    path        := "HKEY_CURRENT_USER"
    config      := "Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    key         := "ProxyEnable"
    path_config := Format("{}\{}", path, config)
    RegRead, proxy_state, %path_config%, %key%

    Process, Exist, v2rayN.exe
    win_pid := ErrorLevel

    lshift_state := GetKeyState("LShift", "P")

    if (lshift_state == "1") {
         ; v2rayN开关
        if (win_pid) {
            Process, Close, %win_pid%
            Regwrite, REG_DWORD, %path%, %config%, %key%, 0
            HelpText("`n v2rayN Close `n", "center", "screen1", 500)
            HelpText("`n v2rayN Close `n", "center", "screen3")
        } else {
            Run D:\#Lnk\v2rayN.lnk
            Regwrite, REG_DWORD, %path%, %config%, %key%, 1
            HelpText("`n v2rayN Start `n", "center", "screen1", 500)
        }
    } else {
        ; Windows代理开关
        if (proxy_state == "0") {
            Regwrite, REG_DWORD, %path%, %config%, %key%, 1
            HelpText("`n Proxy On `n", "center", "screen1", 500)
        } else if (proxy_state == "1") {
            Regwrite, REG_DWORD, %path%, %config%, %key%, 0
            HelpText("`n Proxy Off `n", "center", "screen1", 500)
            HelpText("`n Proxy Off `n", "center", "screen3")
        }
    }
Return

$RWin::
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer, Timer, -500
Return
Timer:
    if (   windows_move == True 
        or windows_resize_big == True
        or windows_resize_small == True ) {
        windows_move := False
        windows_resize_big := False
        windows_resize_small := False
        HelpText()
        return
    }
    if (cnt > 0) {
        ignore_function := GlobalGet("Status", "ignore_function", "Bool")
        if (ignore_function) {
            GlobalSet("Status", "ignore_function", False)
            return
        }
    }
    if (cnt == 1) {
        MoveWindowToCenter()
    } else if (cnt == 2) {
        MoveWindowToDefaultPosition()
    } else if (cnt == 3) {
        MoveWindowToBackupPosition()
    }
    cnt := 0
Return

#If ( windows_move == True )
    Up::   MoveWindowUDLR("Up"   )
    Down:: MoveWindowUDLR("Down" )
    Left:: MoveWindowUDLR("Left" )
    Right::MoveWindowUDLR("Right")
#If

#If ( windows_resize_big == True )
    Up::   ResizeWindow("Big", "Up"   )
    Down:: ResizeWindow("Big", "Down" )
    Left:: ResizeWindow("Big", "Left" )
    Right::ResizeWindow("Big", "Right")
#If

#If ( windows_resize_small == True )
    Up::   ResizeWindow("Small", "Up"   )
    Down:: ResizeWindow("Small", "Down" )
    Left:: ResizeWindow("Small", "Left" )
    Right::ResizeWindow("Small", "Right")
#If
