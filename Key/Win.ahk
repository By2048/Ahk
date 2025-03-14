
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

; 窗口全屏
#Enter:: Send "^!{Enter}"
#+Enter::Send "^!+{Enter}"

; UI缩放快捷键
#0:: Send "^!0"
#+0::Send "^!+0"
#-:: Send "^!-"
#+-::Send "^!+-"
#=:: Send "^!="
#+=::Send "^!+="

;声音
#PgUp::Send "{Volume_Up}"
#PgDn::Send "{Volume_Down}"
#+PgUp::
#+PgDn::{
    Send "{Volume_Down}{Volume_Up}" ;显示声音调整UI
    ; 调整音量时 不能准确调整到指定数值 存在小数点偏差
    volume_offset  := 5
    volume_steps   := [ 10, 22, 33, 44, 50, 55, 66, 77, 88, 100 ]
    volume_current := Round(SoundGetVolume())
    for index, volume in volume_steps {
        if ( Abs(volume_current - volume) < volume_offset ) {
            if ( InStr(A_ThisHotkey, "PgDn") ) {
                if ( index == 1 ) {
                    SoundSetVolume(volume_steps[1])
                } else {
                    SoundSetVolume(volume_steps[index - 1])
                }
            } else if ( InStr(A_ThisHotkey, "PgUp") ) {
                if ( index == volume_steps.Length ) {
                    SoundSetVolume(volume_steps[-1])
                } else {
                    SoundSetVolume(volume_steps[index + 1])
                }
            }
            break
        }
    }
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; PowerToy
; #o Orc
<#t:: Send "^!t"   ; 窗口置顶
<#x:: Send "#^!x"  ; 裁剪
<#+x::Send "#^!+x" ; 锁定

<#g::
<#+g::{
    if ( A_ThisHotkey == "<#g" ) {
        Send "#^!g" ; 鼠标荧光笔
        HelpText("`n  鼠标荧光笔  `n", "Center", "Screen", 666)
    }
    if ( A_ThisHotkey == "<#+g" ) {
        Arg.win_shift_g := True
        Send "#^!+g" ; 屏幕标尺
    }
}
#HotIf ( Arg.win_shift_g == True )
    #g::
    Esc::
    CapsLock::{
        Arg.win_shift_g := False
        Send "#^!+g"
    }
#HotIf

;切换任务栏应用（预览
<#[::Send "#+t"
<#]::Send "#t"

;插入表情
<#j::#`;

<#,::Send "#x" ;系统菜单
<#.::Run "control" ;控制面板
<#+.::{ ;环境编辑器
    Run "sysdm.cpl"
    WinWaitActive("ahk_exe SystemPropertiesComputerName.exe",  , 3)
    MoveWindowCenter()
    Send "^{Tab 2}"
    Send "!n"
}
<#/::{
    Send "{Blind}{vkFF}"
    Run "MS-Settings:" ;设置 基础
}
<#+/::Run "E:\Config\Windows.msc" ;设置 高级

;类似于Vim的快捷键操作工具
<#;::Run HuntAndPeck . " /tray" ;任务栏
<#'::Run HuntAndPeck . " /hint" ;当前应用

; 复制文件路径
<#c::{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! hwnd )
        return
    result := ""
    for Win in ComObject("Shell.Application").Windows
        if ( Win.hwnd == hwnd )
            for item in Win.Document.SelectedItems
                result := result . "`n" . item.path
    result := LTrim(result, "`n")
    A_Clipboard := result
    ClipWait()
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
}

; Windows原生剪切板内容处理粘贴
; #v::Return

; 同步复制
<#+c::{
    A_Clipboard := ""
    Send "^c"
    ClipWait()
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
    if ( FileExist(JQB.Windows) )
        FileDelete(JQB.Windows)
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(A_Clipboard)
    file.Close()
}

; 同步粘贴
<#+v::{
    Global JQB
    FileEncoding("UTF-8")
    origin := A_Clipboard
    if ( ! FileExist(JQB.Phone) ) {
        HelpText("No File", "CenterDown",  , 333)
        return
    }
    content := ""
    try {
        content := FileRead(JQB.Phone)
        FileDelete(JQB.Phone)
    }
    if ( ! content ) {
        HelpText("No Data", "CenterDown",  , 333)
        Try FileDelete(JQB.Phone)
        return
    }
    A_Clipboard := content
    ClipWait(1)
    Send "^v"
    if ( StrLen(content) > 15 )
        content := SubStr(content, 1, 5) . "..." . SubStr(content, -5)
    HelpText(A_Clipboard, "CenterDown", "Screen", 333)
    A_Clipboard := origin
    Try FileDelete(JQB.Phone)
}

; 文件重命名
<#h::
<#+h::{
    Send "{Blind}{vkFF}"
    
    win_id := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! win_id )
        return

    ; 获取Explorer当前选择的项目
    folder := ""
    files  := []
    data := Map( "folder" , ""  ,  "select" , [] )
    for win in ComObject("Shell.Application").Windows {
        if ( win.hwnd == win_id ) {
            folder := win.Document.Folder.Self.Path
            for item in win.Document.SelectedItems
                files.Push(item.path)
        }
    }

    if ( ! files )
        return

    if ( A_ThisHotkey == "<#h" )
        for file in files
            RenameToMd5(file)

    if ( A_ThisHotkey == "<#+h" ) {
        for file in files {
            RenameToData(file)
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

; 屏幕截图 临时 | 长久
<#Insert:: ScreenShotFull(ScreenShot_Full)
<#+Insert::ScreenShotFull(ScreenShot_Temp)

;软件截图 临时 | 长久
<#Delete:: ScreenShotSoftware(ScreenShot_Software)
<#+Delete::ScreenShotSoftware(ScreenShot_Temp    )

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
        Try WinShow(rule)
        HelpText("`n 显示任务栏 `n", "Center", Screens.Count, 500)
    } else {
        Try WinHide(rule)
        HelpText("`n 隐藏任务栏 `n", "Center", Screens.Count, 500)
    }
}

; Snipaste 截图 贴图
>#Insert::Send "^!{PrintScreen}"
>#Delete::Send "^!+{PrintScreen}"

; 切换静音
>#AppsKey::SoundSetMute(-1)

; 终端
>#Space:: Run WT " --focus --size 124,36 -d T:\\"

; 窗口大小调整
>#Up::   MoveWindowOffset( 0 , 0 ,   0 , -10 )
>#Down:: MoveWindowOffset( 0 , 0 ,   0 , +10 )
>#Left:: MoveWindowOffset( 0 , 0 , -10 ,   0 )
>#Right::MoveWindowOffset( 0 , 0 , +10 ,   0 )

; TIM
>#`;::Send "^!;" ;识图
>#':: Send "^!'" ;翻译
