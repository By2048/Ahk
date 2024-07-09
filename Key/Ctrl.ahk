
 >^q::Run "E:\Config\QPC.qdr"
>^+q::Run "E:\Config\QFile.qdr"
 >^e::Run "D:\#Lnk\#\Everything.lnk"
 >^r::Run "RegEdit"
 >^t::Run "D:\#Lnk\#\TIM.lnk"
 >^p::Run WT " -d T:\"

 >^a::Run "D:\#Lnk\#\AntiMicroX.lnk"
 >^s::Run "D:\#Lnk\#\Sandboxie.lnk"
 >^f::Run "D:\#Lnk\#\FreeFileSync.lnk"
 >^g::Run "D:\#Lnk\#\Geek.lnk"
 >^h::Run AutoHotkey " D:\AutoHotkey\V2\WindowSpy.ahk"
>^+h::Run "E:\GitX\AhkSpy\AhkSpy.exe"
 >^j::{
    Run "D:\#Lnk\JetBrains.lnk"
    loop 33 {
        try {
            WinActivate "ahk_exe jetbrains-toolbox.exe"
            window := GetActiveWindowInfo()
            MoveWindowPosition(Position(window.w, window.h))
            return
        } catch {
            Sleep 10
        }
    }
}
^+j::{
    cmd := 'WT --focus  '
    cmd .= '--size 50,20  '
    cmd .= 'PowerShell -NoProfile -NoExit -WorkingDirectory T:\ -Command  '
    cmd .= '"D:\Python\#\Scripts\python.exe E:\Script\Python\JetBrains.py"  '
    Run cmd
}
 >^k::KeyHistory
>^+k::KeyboardGUI()

 >^x::Run "D:\#Lnk\#\Xshell.lnk"
 >^c::Run "Calc"
 >^v::Run "D:\#Lnk\#\Vpn.lnk"
 >^b::Run "D:\#Lnk\#\BitComet.lnk"
 >^n::Run "D:\#Lnk\#\Music.lnk"
>^+n::Run "D:\#Lnk\#\QQMusic.lnk"
 >^m::Run "D:\#Lnk\#\PotPlayer.lnk"

 >^[::Run VSCode " --profile %Temp     E:\Config\VSCode\%Temp.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " --profile %Note     E:\Config\VSCode\%Note.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^\::Run VSCode " --profile %Windows  E:\Config\VSCode\%Windows.code-workspace", A_InitialWorkingDir, "Hide"

>^`;::Run VSCodeDefault " --new-window", A_InitialWorkingDir, "Hide"
 >^'::Run VSCode        " --new-window", A_InitialWorkingDir, "Hide"

 >^,::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::" ;我的电脑
>^+,::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
 >^.::Run "T:\"
>^+.::Run "V:\#\"
 >^/::Run "E:\Script\Software\Chrome.bat",        A_InitialWorkingDir, "Hide"
>^+/::Run "E:\Script\Software\ChromeDefault.bat", A_InitialWorkingDir, "Hide"

 >^Esc::Run "TaskMgr" ;任务管理器
>^+Esc::Run "D:\#Lnk\#\HuoRongSword.lnk"

 >^Enter::Run "D:\#Lnk\#AppStore\Whiteboard.lnk"
>^+Enter::Run "D:\#Lnk\#AppStore\DevToys.lnk"

>^Up::   MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )


$RCtrl::{
    Global Arg
    if (Arg.ctrl_cnt > 0) {
        Arg.ctrl_cnt += 1
        return
    } else {
        Arg.ctrl_cnt := 1
    }
    SetTimer CtrlTimer, -500
}
CtrlTimer() {
    Global Arg
    if (Arg.ctrl_cnt == 1) {
        if Arg.ctrl_show
            CtrlHelpGui()
        if CheckWindowActive("Maye")
            Send "{Esc}"
        Arg.ctrl_cnt := 0
    } else if (Arg.ctrl_cnt == 2) {
        Run "D:\#Lnk\#\Maye.lnk"
    } else if (Arg.ctrl_cnt == 3) {
        CtrlHelpGui()
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
