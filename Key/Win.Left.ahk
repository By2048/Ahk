
; PowerToy
<#o::Send "#^!o"   ;Orc
<#t::Send "#^!t"   ;窗口置顶
<#x:: Send "#^!x"  ;裁剪
<#+x::Send "#^!+x" ;锁定

<#i::Send "#v"  ;剪切板粘贴
<#n::Send "#k"  ;打开“连接”快速操作
<#m:: Send "#," ;显示隐藏所有应用
<#+m::Send "#d" ;切换隐藏所有应用界面

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

<#,::Send "#x" ;系统菜单
<#.::Run "control" ;控制面板
<#+.::{ ;环境编辑器
    Run "sysdm.cpl"
    WinWaitActive("ahk_exe SystemPropertiesComputerName.exe",  , 3)
    MoveWindowCenter()
    Send "^{Tab 2}"
    Send "!n"
}
<#/::{ ;设置 基础
    Send "{Blind}{vkFF}"
    Run "MS-Settings:"
}
<#+/::{ ;设置 高级
    Send "{Blind}{vkFF}"
    Run Folders.Config "\Windows.msc" 
}

;类似于Vim的快捷键操作工具
<#;::Run HuntAndPeck . " /tray" ;任务栏
<#'::Run HuntAndPeck . " /hint" ;当前应用

; 同步复制
<#c::{
    Global JQB
    A_Clipboard := ""
    Send "^c"
    ClipWait()
    Sleep 123
    file := FileOpen(JQB.Windows, "w", "UTF-8")
    file.Write(A_Clipboard)
    file.Close()
    HelpText(A_Clipboard, "CenterDown", "Screen", 1000)
}

; 同步粘贴
<#v::{
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
    Sleep 123
    Send "^v"
    if ( StrLen(content) > 15 )
        content := SubStr(content, 1, 5) . "..." . SubStr(content, -5)
    HelpText(A_Clipboard, "CenterDown", "Screen", 333)
    A_Clipboard := origin
    ClipWait(1)
    Try FileDelete(JQB.Phone)
}

; 屏幕截图 临时 | 长久
<#Insert:: ScreenShotFull(Folders.Image)
<#+Insert::ScreenShotFull(Folders.Temp )

;软件截图 临时 | 长久
<#Delete:: ScreenShotSoftware(Folders.Image)
<#+Delete::ScreenShotSoftware(Folders.Temp )
