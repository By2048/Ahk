
#Include Win.Dexpot.ahk

#Include *i Win.Private.ahk



; 调整显示器亮度 基于 Twinkle 软件
#Home::  ;主显示器 +
#End::   ;主显示器 -
#+Home:: ;副显示器 +
#+End::{ ;副显示器 -
    Switch A_ThisHotkey {
        Case "#Home"  : Send "#^!{Home}"
        Case "#End"   : Send "#^!{End}"
        Case "#+Home" : Send "#^!+{Home}"
        Case "#+End"  : Send "#^!+{End}"
    }
}

; 设置默认位置
#\::MoveWindowToDefaultPosition()
#+\::MoveWindowToBackupPosition()

; 窗口全屏
#Enter::Send "^!{Enter}"
#+Enter::Send "^!+{Enter}"

; 结束应用\进程
#BackSpace::{
    GetActiveWindowInfo()
    ; 远程桌面切换到Windows时 结束远程桌面
    if (window.process_name == "Explorer") {
        windows_previous_process_name := GlobalGet("Windows", "Previous_Process_Name")
        remote_desktop_switch_check := GlobalGet("Status", "Remote_Desktop_Switch_Check", "Bool")
        if (windows_previous_process_name == "RemoteDesktop") {
            if (remote_desktop_switch_check == True) {
                exe := Windows_Process.Get(StrLower("RemoteDesktop"))
                ProcessClose exe
                GlobalSet("Windows", "Previous_Process_Name", "")
                GlobalSet("Status", "Remote_Desktop_Switch_Check", False)
                return
            }
        }
    }
    if IsDesktops()
        return
    Try WinClose AID(window.id)
}
; 结束进程
#+BackSpace::{
    GetActiveWindowInfo()
    if IsDesktops()
        return
    if not window.pid
        return
    ProcessClose window.pid
}

; UI缩放快捷键
#0::Send "^!0"
#+0::Send "^!+0"
#-::Send "^!-"
#+-::Send "^!+-"
#=::Send "^!="
#+=::Send "^!+="

; 设置快捷键
#AppsKey::Send "^!{AppsKey}"
#+AppsKey::Send "^!+{AppsKey}"

;声音
#PgUp::Send "{Volume_Up}"
#PgDn::Send "{Volume_Down}"
#+PgUp::
#+PgDn::{
    ; 显示声音调整UI
    Send "{Volume_Down}{Volume_Up}"
    ; 调整音量时 不能准确调整到指定数值 存在小数点偏差
    volume_offset  := 5
    volume_steps   := [ 11, 22, 33, 44, 55, 66, 77, 88, 99 ]
    volume_current := Round(SoundGetVolume())
    for index, volume in volume_steps {
        if ( Abs(volume_current - volume) < volume_offset ) {
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
            break
        }
    }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PowerToy
; #t 窗口置顶
; #o Orc
<#x::Send "#^!x"   ; 裁剪
<#+x::Send "#^!+x" ; 锁定
<#g::Send "#^!g"   ; 鼠标荧光笔
<#+g::Send "#^!+g" ; 屏幕标尺

;切换任务栏应用（预览
<#[::Send "#+t"
<#]::Send "#t"

;插入表情
<#j::#`;

<#,::Send "#x"          ;系统菜单
<#.::Run "control"      ;控制面板
<#/::Run "MS-Settings:" ;设置
<#+/::{                  ;环境编辑器
    Run "sysdm.cpl"
    WinWaitActive "ahk_exe SystemPropertiesComputerName.exe",  , 3
    MoveWindowToCenter(True)
    Send "^{Tab 2}"
    Send "!n"
}

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
    origin := A_Clipboard
    if not FileExist(JQB.Phone) {
        HelpText("No File", "CenterDown",  , 333)
        return
    }
    content := ""
    try {
        content := FileRead(JQB.Phone)
        FileDelete JQB.Phone
    }
    if not content {
        HelpText("No Data", "CenterDown",  , 333)
        try FileDelete JQB.Phone
        return
    }
    A_Clipboard := content
    ClipWait 1
    Send "^v"
    if StrLen(content) > 15
        content := SubStr(content, 1, 5) . "..." . SubStr(content, -5)
    HelpText(A_Clipboard, "CenterDown", "Screen", 333)
    A_Clipboard := origin
    try FileDelete JQB.Phone
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
 <#m::Send "#," ;显示隐藏所有应用
<#+m::Send "#d" ;切换隐藏所有应用界面

; 修改窗口透明度
; <#WheelUp::SetWindowTransparent(10)
; <#WheelDown::SetWindowTransparent(-10)

; 屏幕截图 临时 | 长久
 <#Insert::ScreenShot("T:\")
<#+Insert::ScreenShot("F:\Image\Screen\")

;软件截图 临时 | 长久
 <#Delete::SoftwareShot("T:\")
<#+Delete::SoftwareShot("F:\Image\Screen\")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 通用媒体按键
>#p::Send "{Media_Play_Pause}"
>#[::Send "{Media_Prev}"
>#]::Send "{Media_Next}"
>#o::Send "^!o" ;添加收藏

; 显示隐藏任务栏
>#/::{
    rule := "ahk_exe explorer.exe ahk_class Shell_TrayWnd"
    if ( !WinExist(rule) ) {
        Try WinShow rule
        HelpText("`n 显示任务栏 `n", "Center", Screens.Count, 500)
    } else {
        Try WinHide rule
        HelpText("`n 隐藏任务栏 `n", "Center", Screens.Count, 500)
    }
}

 >#Space::WindowsTerminal("Focus", "T:\\")
>#+Space::WindowsTerminal("Full" , "T:\\")

; Snipaste 截图 贴图
>#Insert::Send "^!{PrintScreen}"
>#Delete::Send "^!+{PrintScreen}"

; 窗口大小调整
>#Left:: Send "^!{Numpad4}"
>#Right::Send "^!{Numpad6}"
>#Up::   Send "^!{Numpad8}"
>#Down:: Send "^!{Numpad2}"

; TIM
>#`;::Send "^!;" ;识图
>#':: Send "^!'" ;翻译

; RWin设置
RWin::{
    Send "{Blind}{vkFF}"
    Global Arg
    if (Arg.win_cnt > 0) {
        Arg.win_cnt += 1
        return
    } else {
        Arg.win_cnt := 1
    }
    SetTimer Timer, -500
    Timer() {
        Global Arg
        if Arg.win_cnt == 1
            MoveWindowToCenter(True)
        else if Arg.win_cnt == 2
            MoveWindowToDefaultPosition()
        else if Arg.win_cnt == 3
            MoveWindowToBackupPosition()
        Arg.win_cnt := 0
    }
}
