
 >^q::Run "E:\Config\QPC.qdr"
>^+q::Run "E:\Config\QFile.qdr"
 >^e::Run "D:\#Lnk\#\Everything.lnk"
 >^r::Run "RegEdit"
 >^t::Run "D:\#Lnk\#\Torrent.lnk"

 >^a::Run "D:\#Lnk\#\AntiMicroX.lnk"
 >^s::Run "D:\#Lnk\#\Sandboxie.lnk"
 >^d::Run "D:\#Lnk\#\Download.lnk"
 >^f::Run "D:\#Lnk\#\FreeFileSync.lnk"
 >^g::Run "D:\#Lnk\#\Geek.lnk"
 >^h::Run AutoHotkey " D:\AutoHotkey\V2\WindowSpy.ahk"
>^+h::Run "E:\GitX\AhkSpy\AhkSpy.exe"
 >^j::{
    Run "D:\#Lnk\#\JetBrains.lnk"
    loop 33 {
        try {
            WinActivate("ahk_exe jetbrains-toolbox.exe")
            window := GetActiveWindowInfo()
            if ( window.process_name == "jetbrains-toolbox" ) {
                MoveWindowPosition(Position(window.w, window.h))
                break
            }
        } catch {
            Sleep 10
        }
    }
}
^+j::{
    cmd := WT " --focus --size 50,20 "
    cmd .= PSL " -NoProfile -NoExit -WorkingDirectory T:\ -Command "
    cmd .= "D:\Python\#\Scripts\python.exe E:\Script\Python\JetBrains.py"
    Run cmd
}
 >^k::KeyHistory()
>^+k::KeyboardGUI()

 >^c::Run "Calc"
 >^v::Run "D:\#Lnk\#\Vpn.lnk"
 >^b::Run "D:\#Lnk\#\Image.lnk"
 >^n::Run "D:\#Lnk\#\Music.lnk"
>^+n::Run "D:\#Lnk\#\QQMusic.lnk"
 >^m::Run "D:\#Lnk\#\PotPlayer.lnk"

 >^[::Run VSCode " --profile %Temp    E:\Config\VSCode\%Temp.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " --profile %Note    E:\Config\VSCode\%Note.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^\::Run VSCode " --profile %Windows E:\Config\VSCode\%Windows.code-workspace", A_InitialWorkingDir, "Hide"

>^`;::Run VSCodeDefault " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"
 >^'::Run VSCode        " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"

 >^,::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::" ;我的电脑
>^+,::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
 >^.::Run "T:\"
>^+.::Run "V:\#\"
 >^/::Run "E:\Script\Software\Chrome.cmd",        A_InitialWorkingDir, "Hide"
>^+/::Run "E:\Script\Software\ChromeDefault.cmd", A_InitialWorkingDir, "Hide"

>^Esc::Run "TaskMgr" ;任务管理器

 >^Enter::Run "D:\#Lnk\#AppStore\Whiteboard.lnk"
>^+Enter::Run "D:\#Lnk\#AppStore\DevToys.lnk"

>^BackSpace::Run WT " -d T:\"

>^Up::   MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )


Arg.ctrl_show    := False
Arg.ctrl_content := ""

$RCtrl::{
    Send "{Blind}{vkFF}"
    Global Arg
    if ( Arg.rctrl_click > 0 ) {
        Arg.rctrl_click += 1
        return
    } else {
        Arg.rctrl_click := 1
    }
    SetTimer(CtrlTimer, -500)
}

CtrlTimer()
{
    Global Arg
    if ( Arg.rctrl_click == 1 ) {
        if ( Arg.ctrl_show )
            CtrlGui()
        if ( CheckWindowActive("Maye") )
            Send "{Esc}"
        Arg.rctrl_click := 0
    } else if ( Arg.rctrl_click == 2 ) {
        Run "D:\#Lnk\#\Maye.lnk"
    } else if ( Arg.rctrl_click == 3 )
        CtrlGui()
    Arg.rctrl_click := 0
}

CtrlGui()
{
    Global G , Arg

    if ( Arg.ctrl_show ) {
        Try G.Destroy()
        Arg.ctrl_show := False
        return
    }

    if ( ! Arg.ctrl_content ) {
        path := A_InitialWorkingDir . "\Key\Ctrl.help"
        if ( FileExist(path) )
            Arg.ctrl_content := FileRead(path, "`n UTF-8")
    }

    margin    := Gui_Config.Margin
    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    if ( GetWindowTheme() == "Dark" ) {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    } else if ( GetWindowTheme() == "Light" ) {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }

    G := Gui()
    G.MarginX := margin
    G.MarginY := margin
    G.BackColor := back_color
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    G.Add("Text", "-Center -Border", Arg.ctrl_content)
    G.Show("NA Center")

    Arg.ctrl_show := True
}
