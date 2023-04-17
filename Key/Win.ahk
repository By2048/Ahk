
; 环境编辑器
<#7::{
    Run "sysdm.cpl"
    WinWaitActive "ahk_exe SystemPropertiesComputerName.exe",  , 3
    MoveWindowToCenter(True)
    Send "^{Tab 2}"
    Send "!n"
}

; 显示隐藏任务栏
<#8::{
    rule := "ahk_exe explorer.exe ahk_class Shell_TrayWnd"
    if (!WinExist(rule)) {
        WinShow rule
        HelpText("`n显示任务栏`n", "Center", "Screen", 500)
    } else {
        WinHide rule
        HelpText("`n隐藏任务栏`n", "Center", "Screen", 500)
    }
}

; 任务栏多屏移动
; 主屏幕 27寸2K -> 副屏幕 21.5寸1080P
<#+8::{
    CoordMode "Mouse", "Screen"
    MouseGetPos &x_origin, &y_origin
    win_id := 0x0
    try {
        rule := "ahk_exe Explorer.EXE ahk_class Shell_TrayWnd"
        WinActivate rule
        win_id := WinGetID("A")
    }
    if (not win_id) {
        return
    }
    WinGetPos &x, &y, &w, &h, AID(win_id)
    if (x == 0 and w == 2560) {
        mouse_x  := w/2 - Screens.Software.1.w/6
        mouse_y  := Screens.Software.1.yy - h/2
        mouse_xx := Screens.Software.2.x + Screens.Software.2.w/2
        mouse_yy := Screens.Software.2.yy - 33
        MouseClickDrag "Left", mouse_x, mouse_y, mouse_xx, mouse_yy, 3
        Sleep 999
    }

    WinActivate rule
    win_id := WinGetID("A")
    WinGetPos &x, &y, &w, &h, AID(win_id)
    total_height := 160
    if (h < total_height) {
        mouse_x  := x + w/2
        mouse_y  := y
        mouse_xx := mouse_x
        mouse_yy := Screens.Software.2.yy - total_height
        DllCall("SetCursorPos", "int", mouse_x, "int", mouse_y)
        Click "Click Down"
        Click Format("Click Up {} {}", mouse_xx, mouse_yy)
    }
    MouseMove x_origin, y_origin, 0
}

<#9::   ;主显示器 -
<#0::   ;主显示器 +
<#+9::  ;副显示器 -
<#+0::{ ;副显示器 +
    global previous_win_id
    previous_win_id := WinGetID("A")
    switch A_ThisHotkey {
        case "<#9"  : Send "#^!9"
        case "<#0"  : Send "#^!0"
        case "<#+9" : Send "#^!+9"
        case "<#+0" : Send "#^!+0"
    }
    win_exe := "Twinkle Tray.exe"
    win_id  := WinExist("ahk_exe " . win_exe)
    WinGetPos &win_x, &win_y, &win_w, &win_h, "ahk_id " . win_id
    x := Screen.x + Screen.w/2 - win_w/2
    y := Screen.y + Screen.h/2 - win_h/2
    w := win_w
    h := win_h
    WinActivate "ahk_id " . win_id
    WinMove x, y, w, h, "ahk_id " . win_id
    WinSetAlwaysOnTop 1, "ahk_id " . win_id
}
<#9 Up::
<#0 Up::
<#+9 Up::
<#+0 Up::{
    global previous_win_id
    WinActivate "ahk_id " . previous_win_id
}

;声音
<#=::Send "{Volume_Up}"
<#-::Send "{Volume_Down}"
<#+-::
<#+=::{
    Send "{Volume_Down}"
    Send "{Volume_Up}"

    offset := 3
    volume_steps := [11, 22, 33, 44, 55, 66, 77, 88, 99]
    volume_current := Round(SoundGetVolume())
    for index, volume in volume_steps {
        if ( Abs(volume_current - volume) < offset ) {
            if (InStr(A_ThisHotkey, "-")) {
                if (index == 1) {
                    SoundSetVolume volume_steps[1]
                } else {
                    SoundSetVolume volume_steps[index - 1]
                }
            } else if (InStr(A_ThisHotkey, "=")) {
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

; 窗口置顶
<#t::Send "^!t"

;切换任务栏应用（预览
<#[::#+t
<#]::#t

;插入表情
<#j::#`;

<#,::#x ;系统菜单
<#.::Run "control" ;控制面板
<#/::Run "ms-settings:" ;设置

;类似于Vim的快捷键操作工具
<#;::Run HuntAndPeck . " /tray" ;任务栏
<#'::Run HuntAndPeck . " /hint" ;当前应用

; 复制文件
<#c::{
    A_Clipboard := ""
    Send "^c"
    ClipWait
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
    if (FileExist(JQB.Windows)) {
        FileDelete JQB.Windows
    }
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(A_Clipboard)
    file.Close()
}

; 复制文件路径
<#+c::{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if (not hwnd) {
        return
    }
    for Win in ComObject("Shell.Application").Windows {
        if (Win.hwnd == hwnd) {
            for item in Win.Document.SelectedItems {
                A_Clipboard := A_Clipboard . "`n" . item.path
            }
            HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
        }
    }
}

<#v::{
    global JQB
    FileEncoding "UTF-8"
    if (!FileExist(JQB.Phone)) {
        HelpText("No Data", "Center",  , 333)
        return
    }
    try {
        A_Clipboard := ""
        FileRead  A_Clipboard, JQB.Phone
    }
    A_Clipboard := A_Clipboard
    Send "^v"
    HelpText(A_Clipboard, "Center", "Screen", 333)
    FileDelete JQB.Phone
}

; 文件重命名
<#h::{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if (not hwnd) {
        return
    }

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
    if (not data) {
        return
    }
    if (not data.Count) {
        return
    }

    all_select := data["select"]
    if (not all_select) {
        return
    }
    for select_item in all_select {
        RenameToMd5(select_item)
    }
}

; 打开“连接”快速操作
<#n::{
    Sleep 300
    Send "#k"
}
<#m::Send "#,"   ;显示隐藏所有应用
<#+m::Send "#d" ;切换隐藏所有应用界面

; 修改窗口透明度
; <#WheelUp::SetWindowTransparent(10)
; <#WheelDown::SetWindowTransparent(-10)

; 屏幕截图 临时 | 长久
<#Insert::ScreenShot("Screen", "T:\")
<#+Insert::{
    ScreenShot("Screen1", "F:\Image\Screen\")
    ScreenShot("Screen2", "F:\Image\Screen\")
}
;软件截图 临时 | 长久
<#Delete:: ScreenshotSoftware("T:\")
<#+Delete::ScreenshotSoftware("F:\Image\Screen\")

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
                exe := Windows_Process_Name.Get("RemoteDesktop")
                ProcessClose exe
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    if (IsDesktops() or IsGame()) {
        return
    }
    WinClose "ahk_id " . win_id
}
; 结束进程
<#+BackSpace::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsGame()) {
        return
    }
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

>#Space::WindowsTerminal("Focus", "T:\\")
>#+Space::WindowsTerminal("Full", "T:\\")

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
$RWin::{
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
    global cnt, windows_move, windows_resize_big, windows_resize_small
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
}

>#,::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return
    }
    global windows_resize_small
    windows_resize_small := True
    HelpText("Windows Resize Small")
}

>#.::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return
    }
    global windows_resize_big
    windows_resize_big := True
    HelpText("Windows Resize Big")
}

>#/::{
    GetActiveWindowInfo()
    if (IsDesktops() or IsMaxMin() or IsGame()) {
        return
    }
    global windows_move
    windows_move := True
    HelpText("Move Windows")
}

#HotIf ( windows_move == True )
    Up::   MoveWindowUDLR("Up"   )
    Down:: MoveWindowUDLR("Down" )
    Left:: MoveWindowUDLR("Left" )
    Right::MoveWindowUDLR("Right")
#HotIf

#HotIf ( windows_resize_big == True )
    Up::   ResizeWindow("Big", "Up"   )
    Down:: ResizeWindow("Big", "Down" )
    Left:: ResizeWindow("Big", "Left" )
    Right::ResizeWindow("Big", "Right")
#HotIf

#HotIf ( windows_resize_small == True )
    Up::   ResizeWindow("Small", "Up"   )
    Down:: ResizeWindow("Small", "Down" )
    Left:: ResizeWindow("Small", "Left" )
    Right::ResizeWindow("Small", "Right")
#HotIf
