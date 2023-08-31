
~<^c::{
    ; data := Clipboard
    ; data := "https://www.bilibili.com/video/BV16L4y1L7fK?spm_id_from=333.999.0.0"
    ; cmd  := "D:\Python\#\Scripts\python.exe E:\Project\script\ahk\clipboard.py " . data
    ; Run %cmd%
}

>^q::Run "E:\Config\PC.qdr"
>^e::Run "D:\#Lnk\#\Everything.lnk"
>^y::Run "D:\#Lnk\#\v2rayN.lnk"
>^p::Run WT . " -d T:\"

>^s::Run "D:\#Lnk\#\Sandboxie.lnk"
>^f::Run "D:\#Lnk\#\FreeFileSync.lnk"
>^h::Run AutoHotkey " D:\AutoHotkey\V2\WindowSpy.ahk"
>^+h::Run "E:\GitX\AhkSpy\AhkSpy.exe"
>^j::{
    Run "D:\#Lnk\JetBrains.lnk"
    exe := Windows_Process.Get("JetBrainsToolBox")
    rule := Format("ahk_exe {}", exe)
    loop 9 {
        try {
            WinActivate rule
            GetActiveWindowInfo()
            MoveWindowToPosition(Position(window.w, window.h))
            return
        } catch {
            Sleep 10
        }
    }
}
>^k::KeyboardGUI()
>^l::Run "C:\Program Files\LogiOptionsPlus\LogiOptionsPlus.exe"

>^x::Run "D:\#Lnk\#\Xshell.lnk"
>^v::Run VSCodeDefault, A_InitialWorkingDir, "Hide"
>^n::Run "D:\#Lnk\#\CloudMusic.lnk"
>^+n::Run "D:\#Lnk\#\QQMusic.lnk"
>^m::Run "D:\#Lnk\#\PotPlayer.lnk"

>^Esc::Run "TaskMgr" ;任务管理器
>^+Esc::Run "D:\#Lnk\#\HuoRongSword.lnk"

 >^[::Run VSCode " E:\VSCode\Note.code-workspace"    , A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " E:\VSCode\Ahk.code-workspace"     , A_InitialWorkingDir, "Hide"
 >^\::Run VSCode " E:\VSCode\Windows.code-workspace" , A_InitialWorkingDir, "Hide"
>^+\::Run VSCode " --new-window"                     , A_InitialWorkingDir, "Hide"

>^Enter::Run VSCode " E:\Life\" , A_InitialWorkingDir, "Hide"

 >^,::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::" ;我的电脑
>^+,::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
 >^.::Run "T:\\"
>^+.::Run "V:\\"
 >^/::Run "Chrome.bat",        A_InitialWorkingDir, "Hide"
>^+/::Run "ChromeDefault.bat", A_InitialWorkingDir, "Hide"

>^F12::Run "D:\#Lnk\#\Dexpot.lnk"

>^Up::Return
>^Down::Return
>^Left::Return
>^Right::Return


cnt := 0
ctrl_content := ""
ctrl_gui_status := False

$RCtrl::{
    global cnt, ctrl_gui_status
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer CtrlTimer, -333
}
CtrlTimer() {
    global cnt
    global ctrl_gui_status
    if (cnt == 1) {
        if (ctrl_gui_status) {
            CtrlHelpGui()
            cnt := 0
            return
        }
        if (CheckWindowActive("Maye")) {
            Send "{Esc}"
        } else {
            Run "D:\#Lnk\#\Maye.lnk"
        }
    } else if (cnt == 2) {
        CtrlHelpGui()
    }
    cnt := 0
}
CtrlHelpGui()
{
    global G
    global ctrl_gui_status
    global ctrl_content

    if (ctrl_gui_status) {
        try {
            G.Destroy()
        }
        ctrl_gui_status := False
        return
    }
    ctrl_gui_status := True

    if (not ctrl_content) {
        file := A_InitialWorkingDir . "\Key\Ctrl.txt"
        if FileExist(file)
            ctrl_content := FileRead(file, "`n UTF-8")
    }

    G := Gui()
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")

    G.MarginX := Gui_Config.Margin
    G.MarginY := Gui_Config.Margin

    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    if (GetWindowTheme() == "Dark") {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
        G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    }
    if (GetWindowTheme() == "Light") {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
        G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    }
    G.BackColor := back_color

    G.Add("Text", "-Center -Border", ctrl_content)
    G.Show("NA Center")
}
