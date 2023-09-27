
#Include *i Win.Private.ahk

; 环境编辑器
<#5::{
    Run "sysdm.cpl"
    WinWaitActive "ahk_exe SystemPropertiesComputerName.exe",  , 3
    MoveWindowToCenter(True)
    Send "^{Tab 2}"
    Send "!n"
}

; 显示隐藏任务栏
<#0::{
    rule := "ahk_exe explorer.exe ahk_class Shell_TrayWnd"
    if (!WinExist(rule)) {
        WinShow rule
        HelpText("`n显示任务栏`n", "Center", Screens.Count, 500)
    } else {
        WinHide rule
        HelpText("`n隐藏任务栏`n", "Center", Screens.Count, 500)
    }
}

#Home::  ;主显示器 -
#End::   ;主显示器 +
#+Home:: ;副显示器 -
#+End::{ ;副显示器 +
    global previous_win_id
    try {
        previous_win_id := WinGetID("A")
    } catch {
        previous_win_id := 0x0
    }
    switch A_ThisHotkey {
        case "#Home"  : Send "#^!{Home}"
        case "#End"   : Send "#^!{End}"
        case "#+Home" : Send "#^!+{Home}"
        case "#+End"  : Send "#^!+{End}"
    }
    win_exe := "Twinkle Tray.exe"
    win_id  := WinExist("ahk_exe " . win_exe)
    WinGetPos &win_x, &win_y, &win_w, &win_h, AID(win_id)
    x := Screen.x + Screen.w/2 - win_w/2
    y := Screen.y + Screen.h/2 - win_h/2
    w := win_w
    h := win_h
    WinActivate AID(win_id)
    WinMove x, y, w, h, AID(win_id)
    WinSetAlwaysOnTop True, AID(win_id)
}
#Home Up::
#End Up::
#+Home Up::
#+End Up::{
    global previous_win_id
    if (previous_win_id) {
        WinActivate AID(previous_win_id)
    }
}

; 缩放快捷键
<#=::Send "^!="
<#-::Send "^!-"

;声音
#PgUp::Send "{Volume_Up}"
#PgDn::Send "{Volume_Down}"
#+PgUp::
#+PgDn::{
    Send "{Volume_Down}"
    Send "{Volume_Up}"

    offset := 3
    volume_steps := [11, 22, 33, 44, 55, 66, 77, 88, 99]
    volume_current := Round(SoundGetVolume())
    for index, volume in volume_steps {
        if ( Abs(volume_current - volume) < offset ) {
            if (InStr(A_ThisHotkey, "PgDn")) {
                if (index == 1) {
                    SoundSetVolume volume_steps[1]
                } else {
                    SoundSetVolume volume_steps[index - 1]
                }
            } else if (InStr(A_ThisHotkey, "PgUp")) {
                if (index == volume_steps.Length) {
                    SoundSetVolume volume_steps[-1]
                } else {
                    SoundSetVolume volume_steps[index + 1]
                }
            }
            return
        }
    }

    min_close := 99
    min_close_index := 0
    for index, volume in volume_steps {
        if ( Abs(volume - volume_current) < min_close) {
            min_close := Abs(volume - volume_current)
            min_close_index := index
        }
    }
    if (InStr(A_ThisHotkey, "-")) {
        if (volume_steps[min_close_index] > volume_current) {
            if (min_close_index > 1) {
                SoundSetVolume volume_steps[min_close_index - 1]
                return
            }
        }
    } else if (InStr(A_ThisHotkey, "=")) {
        if (volume_steps[min_close_index] > volume_current) {
            if (min_close_index < volume_steps.Length) {
                SoundSetVolume volume_steps[min_close_index + 1]
                return
            }
        }
    }
    SoundSetVolume volume_steps[min_close_index]
}

; 有道翻译
^!f::Return
<#f::Send "^!f"

; PowerToy
; #t 窗口置顶
; #o Orc
<#x::Send "#^!x"    ; 裁剪
<#+x::Send "#^!+x"  ; 锁定
<#g::Send "#^!g"    ; 鼠标荧光笔
<#+g::Send "#^!+g"  ; 屏幕标尺

;切换任务栏应用（预览
<#[::Send "#+t"
<#]::Send "#t"

;插入表情
<#j::#`;

<#,::Send "#x" ;系统菜单
<#.::Run "control" ;控制面板
<#/::Run "ms-settings:" ;设置

;类似于Vim的快捷键操作工具
<#;::Run HuntAndPeck . " /tray" ;任务栏
<#'::Run HuntAndPeck . " /hint" ;当前应用

; 复制文件路径
<#c::{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if (not hwnd) {
        return
    }
    result := ""
    for win in ComObject("Shell.Application").Windows {
        if (win.hwnd == hwnd) {
            for item in win.Document.SelectedItems {
                result := result . "`n" . item.path
            }
        }
    }
    result := LTrim(result, "`n")
    A_Clipboard := result
    ClipWait
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
}

; Windows原生剪切板内容处理粘贴
; #v::Return

; 同步复制
<#+c::{
    A_Clipboard := ""
    Send "^c"
    ClipWait
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
    if FileExist(JQB.Windows)
        FileDelete JQB.Windows
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(A_Clipboard)
    file.Close()
}

; 同步粘贴
<#+v::{
    global JQB
    FileEncoding "UTF-8"
    tmp := A_Clipboard
    if (not FileExist(JQB.Phone)) {
        HelpText("No Data", "CenterDown",  , 333)
        return
    }
    content := ""
    try {
        content := FileRead(JQB.Phone)
        FileDelete JQB.Phone
    }
    if not content
        return
    A_Clipboard := content
    ClipWait
    Send "^v"
    A_Clipboard := tmp
    if StrLen(content) > 15
        content := SubStr(content, 1, 5) . "..." . SubStr(content, -5)
    HelpText(A_Clipboard, "CenterDown", "Screen", 333)
}

; 文件重命名
 <#h::
<#+h::{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if not hwnd
        return

    ; 获取Explorer当前选择的项目
    data := Map()
    for Win in ComObject("Shell.Application").Windows {
        if (Win.hwnd == hwnd) {
            ; a := Win.LocationName
            ; b := Win.LocationURL
            folder_path  := Win.Document.Folder.Self.Path
            select_items := []
            for item in Win.Document.SelectedItems {
                select_items.Push(item.path)
            }
            data := Map( "folder" , folder_path , "select" , select_items )
        }
    }

    if not data or not data.Count
        return

    select := data["select"]
    if not select
        return


    if A_ThisHotkey == "<#h"
        for item in select
            RenameToMd5(item)

    if ( A_ThisHotkey == "<#+h" ) {
        for item in select {
            RenameToData(item)
            Sleep 1000
        }
    }

}

; 打开“连接”快速操作
<#n::{
    Sleep 300
    Send "#k"
}
<#m:: Send "#," ;显示隐藏所有应用
<#+m::Send "#d" ;切换隐藏所有应用界面

; 修改窗口透明度
; <#WheelUp::SetWindowTransparent(10)
; <#WheelDown::SetWindowTransparent(-10)

; 屏幕截图 临时 | 长久
<#Insert:: ScreenShot("Screen", "T:\")
<#+Insert::ScreenShot("Screen", "F:\Image\Screen\")

;软件截图 临时 | 长久
<#Delete:: SoftwareShot("T:\")
<#+Delete::SoftwareShot("F:\Image\Screen\")

;结束应用
<#BackSpace::{
    GetActiveWindowInfo()
    win_id := window.id
    win_process_name := window.process_name
    ; 远程桌面切换到Windows时 结束远程桌面
    if (win_process_name == "Explorer") {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if (windows_previous_process_name == "RemoteDesktop") {
            if (remote_desktop_switch_check == True) {
                exe := Windows_Process.Get("RemoteDesktop")
                ProcessClose exe
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    if IsDesktops()
        return
    Try WinClose AID(win_id)
}
; 结束进程
<#+BackSpace::{
    GetActiveWindowInfo()
    if IsDesktops()
        return
    win_pid := window.pid
    ProcessClose win_pid
    ; win_process_exe := window.process_exe
    ; ProcessClose win_process_exe
}

;设置默认位置
<#\::MoveWindowToDefaultPosition()
<#+\::MoveWindowToBackupPosition()

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 通用媒体按键
>#\::Send "{Media_Play_Pause}"
>#[::Send "{Media_Prev}"
>#]::Send "{Media_Next}"
>#p::Send "^!p" ;添加收藏

>#Space:: WindowsTerminal("Focus", "T:\\")
>#+Space::WindowsTerminal("Full" , "T:\\")

>#b::Return
>#Tab::Return

; Snipaste截图
>#Insert:: Send "^!{PrintScreen}"
>#+Insert::Send "^!+{PrintScreen}"
>#Delete:: Send "^!{CtrlBreak}"
>#+Delete::Send "^!+{CtrlBreak}"

; 窗口大小调整
>#Left:: Send "^!{Numpad4}"
>#Right::Send "^!{Numpad6}"
>#Up::   Send "^!{Numpad8}"
>#Down:: Send "^!{Numpad2}"

; TIM
>#`;::Send "^!;" ;识图
>#':: Send "^!'" ;翻译


; 右键RWin设置
cnt := 0
RWin::{
    Send "{Blind}{vkFF}"
    global cnt
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer RWinTimer, -500
}

windows_move         := False
windows_resize_big   := False
windows_resize_small := False
RWinTimer() {
    global cnt
    if (cnt == 1) {
        MoveWindowToCenter(True)
    } else if (cnt == 2) {
        MoveWindowToDefaultPosition()
    } else if (cnt == 3) {
        MoveWindowToBackupPosition()
    }
    cnt := 0
}

>#,::{
    GetActiveWindowInfo()
    if IsDesktops() or IsMaxMin()
        return
    global windows_resize_small
    windows_resize_small := True
    HelpText("Windows Resize ---")
}

>#.::{
    GetActiveWindowInfo()
    if IsDesktops() or IsMaxMin()
        return
    global windows_resize_big
    windows_resize_big := True
    HelpText("Windows Resize +++")
}

>#/::{
    GetActiveWindowInfo()
    if IsDesktops() or IsMaxMin()
        return
    global windows_move
    windows_move := True
    HelpText("Move Windows")
}
