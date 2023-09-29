
>^q::Run "E:\Config\PC.qdr"
>^e::Run "D:\#Lnk\#\Everything.lnk"
>^r::Run "RegEdit"
>^y::Run "D:\#Lnk\#\v2rayN.lnk"
>^p::Run WT " -d T:\"

 >^s::Run "D:\#Lnk\#\Sandboxie.lnk"
 >^f::Run "D:\#Lnk\#\FreeFileSync.lnk"
 >^h::Run AutoHotkey " D:\AutoHotkey\V2\WindowSpy.ahk"
>^+h::Run "E:\GitX\AhkSpy\AhkSpy.exe"
 >^j::{
    Run "D:\#Lnk\JetBrains.lnk"
    loop 33 {
        try {
            WinActivate "ahk_exe jetbrains-toolbox.exe"
            window := GetActiveWindowInfo()
            MoveWindowToPosition(Position(window.w, window.h))
            return
        } catch {
            Sleep 10
        }
    }
}
 >^k::KeyboardGUI()
>^+k::KeyHistory

 >^x::Run "D:\#Lnk\#\Xshell.lnk"
 >^n::Run "D:\#Lnk\#\CloudMusic.lnk"
>^+n::Run "D:\#Lnk\#\QQMusic.lnk"
 >^m::Run "D:\#Lnk\#\PotPlayer.lnk"

 >^Esc::Run "TaskMgr" ;任务管理器
>^+Esc::Run "D:\#Lnk\#\HuoRongSword.lnk"

 >^\::Run VSCode " E:\Config\VSCode\Windows.code-workspace", A_InitialWorkingDir, "Hide"
>^+\::Run VSCode " T:\", A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " --new-window", A_InitialWorkingDir, "Hide"
 >^[::Run VSCodeDefault " --new-window", A_InitialWorkingDir, "Hide"

 >^,::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::" ;我的电脑
>^+,::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
 >^.::Run "T:\"
>^+.::Run "V:\"
 >^/::Run "Chrome.bat",        A_InitialWorkingDir, "Hide"
>^+/::Run "ChromeDefault.bat", A_InitialWorkingDir, "Hide"

   >^Up::Return
 >^Down::Return
 >^Left::Return
>^Right::Return


$RCtrl::{
    Global Arg
    if (Arg.ctrl_cnt > 0) {
        Arg.ctrl_cnt += 1
        return
    } else {
        Arg.ctrl_cnt := 1
    }
    SetTimer CtrlTimer, -333
}
CtrlTimer() {
    Global Arg
    if (Arg.ctrl_cnt == 1) {
        if (Arg.init_show) {
            InitConfig()
            return
        }
        if (Arg.ctrl_show) {
            CtrlHelpGui()
            Arg.ctrl_cnt := 0
            return
        }
        if (CheckWindowActive("Maye")) {
            Send "{Esc}"
        } else {
            Run "D:\#Lnk\#\Maye.lnk"
        }
    } else if (Arg.ctrl_cnt == 2) {
        CtrlHelpGui()
    } else if (Arg.ctrl_cnt == 3) {
        InitConfig()
    }
    Arg.ctrl_cnt := 0
}
CtrlHelpGui() {
    Global G , Arg

    if (Arg.ctrl_show) {
        try G.Destroy()
        Arg.ctrl_show := False
        return
    }

    if (not Arg.ctrl_content) {
        file_path := A_InitialWorkingDir . "\Key\Ctrl.help"
        if FileExist(file_path)
            Arg.ctrl_content := FileRead(file_path, "`n UTF-8")
    }

    margin    := Gui_Config.Margin
    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    if (GetWindowTheme() == "Dark") {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    } else if (GetWindowTheme() == "Light") {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }

    G := Gui()
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    G.MarginX := margin
    G.MarginY := margin
    G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    G.BackColor := back_color
    G.Add("Text", "-Center -Border", Arg.ctrl_content)
    G.Show("NA Center")

    Arg.ctrl_show := True
}
