
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
<#+/::Run Folders.Config "\Windows.msc" ;设置 高级

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
<#Insert:: ScreenShotFull(Folders.Image)
<#+Insert::ScreenShotFull(Folders.Temp )

;软件截图 临时 | 长久
<#Delete:: ScreenShotSoftware(Folders.Image)
<#+Delete::ScreenShotSoftware(Folders.Temp )
