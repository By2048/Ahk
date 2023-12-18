
JApps := "PyCharm|IDEA"

#Include @.Tool.ahk

#Include PyCharm.Position.ahk



#HotIf CheckWindowActive(JApps, "SunAwtDialog", "终端|运行|调试")
    ~RAlt::WinSetTransparent 99, "A"
    ~RAlt Up::WinSetTransparent 255, "A"
#HotIf



#HotIf CheckWindowActive(JApps) And Arg.CtrlOrShift == True
    Esc::
    CapsLock::{
        Send "{Esc}"
        Arg.CtrlOrShift := False
        Arg.ClickCnt    := 0
    }
    RWin::CenterHideWindow(1000, 1000)
#HotIf



; AppsKey Esc 一次性返回问题修复
#HotIf CheckWindowActive(JApps) And AppsKeyRedirect == True
    $Enter::{
        Global AppsKeyEnterCount
        Send "{Enter}"
        AppsKeyEnterCount := AppsKeyEnterCount + 1
    }
    $Esc::
    $CapsLock::{
        Global AppsKeyRedirect, AppsKeyEnterCount
        if (AppsKeyEnterCount > 1) {
            Send "{Left}"
            AppsKeyEnterCount := AppsKeyEnterCount - 1
        } else if (AppsKeyEnterCount == 1) {
            Send "{Esc}"
            AppsKeyRedirect := False
            AppsKeyEnterCount := 0
        }
    }
#HotIf

; 主菜单 动态调整位置
CenterTools       := False
CenterToolsConfig := []
#HotIf CheckWindowActive(JApps) And CenterTools == True
    FloatWindows() {
        Global CenterToolsConfig
        config := []
        loop CenterToolsConfig.Length {
            win := CenterToolsConfig.Pop()
            config.Push(win)
        }
        left := 0
        loop config.Length {
            win := config[A_Index]
            if A_Index == 1
                win.x := Screen.x + Screen.w/2 - win.w/2
            else
                win.x := left - win.w
            win.x := win.x - A_Index * 2  ;UI间隔
            win.y := Screen.y + Screen.h/2 - win.h/2
            CenterToolsConfig.InsertAt(1, win)
            left := win.x
        }
        loop CenterToolsConfig.Length {
            win := CenterToolsConfig[A_Index]
            WinMove win.x, win.y, win.w, win.h, AID(win.id)
        }
    }
    ~RShift::{
        Send "{Blind}{vkFF}"
        Global CenterToolsConfig
        CenterToolsConfig.Pop()
        win := GetHideWindowConfig(333)
        if (ObjOwnPropCount(win)) {
            CenterToolsConfig.Push(win)
            FloatWindows()
        }
    }
    ~Enter::{
        Global CenterTools, CenterToolsConfig
        win := GetHideWindowConfig()
        if (not ObjOwnPropCount(win)) {
            CenterTools := False
            AppsKeyRedirect := False
            CenterToolsConfig := []
        } else {
            CenterToolsConfig.Push(win)
            FloatWindows()
        }
    }
    $Esc::
    $CapsLock::{
        Global AppsKeyRedirect
        Global CenterTools, CenterToolsConfig
        if AppsKeyRedirect
            Send "{Left}"
        else
            Send "{Esc}"
        CenterToolsConfig.Pop()
        FloatWindows()
        if (not CenterToolsConfig.Length) {
            CenterTools := False
            AppsKeyRedirect := False
        }
    }
#HotIf



#HotIf CheckWindowActive(JApps)

    #IncludeAgain ..\..\Key\Replace.ahk

    ~Esc::{
        Global CapsLockActivate
        CapsLockActivate := False
    }

    ~RWin::{
        Send "{Blind}{vkFF}"
        WinGetPos &x, &y, &w, &h, "A"
        if x <= 0 or y <= 0
            return
        MoveWindowToCenter(True)
        win := GetHideWindowConfig()
        if ObjOwnPropCount(win)
            CenterHideWindow()
    }

    Arg.CtrlOrShift := False
    Arg.ClickCnt    := 0
    ~LCtrl::
    ~LShift::{
        if (Arg.ClickCnt > 0) {
            Arg.ClickCnt += 1
            return
        } else {
            Arg.ClickCnt := 1
        }
        Timer() {
            Arg.ClickCnt := 0
            if Arg.ClickCnt == 2
                Arg.CtrlOrShift := True
        }
        SetTimer Timer, -500
    }

    AppsKeyRedirect   := False
    AppsKeyEnterCount := 0
    $AppsKey::{
        Send "{AppsKey}"
        Global AppsKeyRedirect, AppsKeyEnterCount
        AppsKeyRedirect := True
        AppsKeyEnterCount := 1
    }

    ~!AppsKey::{
        CenterHideWindow()
    }

    ; ~!+`::{
    ;     WinWaitActive "书签描述"
    ;     if WinGetTitle("A") == "书签描述"
    ;         MoveWindowToCenter(True)
    ; }

    <#\::MoveWindowToDefaultPosition()
    <#+\::MoveWindowToBackupPosition()

    <#0::^!0  ;编辑器字体 重置
    <#-::^!-  ;编辑器字体 减小
    <#=::^!=  ;编辑器字体 增加
    <#0::^!+0 ;IDE缩放 重置
    <#-::^!+- ;IDE缩放 减小
    <#=::^!+= ;IDE缩放 增加

    ^!Enter::Return
    ^!+Enter::Return
    #Enter::^!Enter   ;窗口全屏
    #+Enter::^!+Enter ;Zen模式

    <^Esc::^Pause    ;切换器
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

    #Include @.CapsLock.ahk

    #Include @.Fxx.ahk

    #Include *i @.Test.ahk

#HotIf
