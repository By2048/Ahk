
Global JApps := "PyCharm|IDEA"

#Include @.Tool.ahk


; 双击按键
Arg.ClickKey := ""
Arg.ClickCnt := 0
#HotIf CheckWindowActive(JApps) And Arg.ClickKey
    Esc::
    CapsLock::{
        Send "{Esc}"
        Arg.ClickKey := ""
        Arg.ClickCnt := 0
    }
    RWin::CenterHideWindow(1000, 1000)
#HotIf


#HotIf CheckWindowActive(JApps)

    $RWin::{
        Send "{Blind}{vkFF}"
        WinGetPos &x, &y, &w, &h, "A"
        if x <= 0 or y <= 0
            return
        MoveWindowToCenter(True)
        win := GetHideWindowConfig()
        if ObjOwnPropCount(win)
            CenterHideWindow()
    }

    AppsKeyRedirect   := False
    AppsKeyEnterCount := 0
    $AppsKey::{
        Send "{AppsKey}"
        Global AppsKeyRedirect, AppsKeyEnterCount
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
    }

    ~Esc::{
        Global CapsLockActivate
        Global CapsLockToEsc
        CapsLockActivate := False
        CapsLockToEsc    := False
    }

    ~LCtrl::
    ~LShift::{
        if (Arg.ClickCnt > 0) {
            Arg.ClickCnt += 1
            return
        } else {
            Arg.ClickCnt := 1
        }
        SetTimer Timer, -500
        Timer() {
            if Arg.ClickCnt == 2
                Arg.ClickKey := A_ThisHotkey
        }
    }

    AltAppsKey := False
    !AppsKey::{
        Global AltAppsKey
        if ( AltAppsKey ) {
            Send "{Esc}"
            AltAppsKey := False
        } else {
            Send "!{AppsKey}"
            CenterHideWindow()
            AltAppsKey := True
        }
    }

    <#\::MoveWindowToDefaultPosition()
    <#+\::MoveWindowToBackupPosition()

    <#0::^!NumpadMult  ;编辑页 重置
    <#-::^!NumpadSub   ;编辑页 减小
    <#=::^!NumpadAdd   ;编辑页 增加
    <#0::^!+NumpadMult ;IDE 重置
    <#-::^!+NumpadSub  ;IDE 减小
    <#=::^!+NumpadAdd  ;IDE 增加

    #Enter::^!NumpadDiv   ;窗口全屏
    #+Enter::^!+NumpadDiv ;Zen模式

    <^Esc::^Pause
    <!Esc::!Pause
    <+Esc::+Pause
    <^+Esc::^+Pause
    <!+Esc::!+Pause

    ;标签页管理
    ^Tab::Return
    ^+Tab::Return
    <!Tab::^Tab
    <!+Tab::^+Tab

    ;设置
    LAlt & RAlt::{
        Send "{Help}"
        WinWaitActive "设置"
        if WinGetTitle("A") == "设置"
            MoveWindowToCenter(True)
    }
    ;快速切换
    RAlt & LAlt::{
        Send "^!+{Help}"
        CenterHideWindow()
    }
    ;代码注释
    LAlt & RShift::Send "^{Help}"
    RShift & LAlt::Send "!{Help}"
    ; Xxx
    RAlt & RShift::Send "!+{Help}"
    RShift & RAlt::Send "^!{Help}"

    #IncludeAgain %A_InitialWorkingDir%\Key\Replace.ahk

    #Include @.CapsLock.ahk

    #Include @.Fxx.ahk

#HotIf
