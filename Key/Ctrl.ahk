
#Include *i Ctrl.Private.ahk

 >^q::Return
 >^w::Return
 >^e::Run Folders.Lnk "Everything.lnk"
 >^r::Run Folders.Lnk "FFRenamePro.lnk"
 >^t::Run Folders.Lnk "Telegram.lnk"
 >^y::Return
 >^u::Return
;>^i::Return
 >^o::Return
 >^p::Return

 >^a::Run Folders.Lnk "AntiMicroX.lnk"
 >^s::Run Folders.Lnk "Sandboxie.lnk"
 >^d::Run Folders.Lnk "DuplicateCleaner.lnk"
 >^f::Run Folders.Lnk "FreeFileSync.lnk"
>^+f::Run Folders.Lnk "RealTimeSync.lnk"
 >^g::Run Folders.Lnk "Geek.lnk"
 >^h::Run AHK " " AhkSpy
>^+h::Run AhkSpyPlus
;>^j::Return
 >^k::KeyHistory()
>^+k::KeyboardGUI()
 >^l::Run Folders.Lnks
>^+l::Run Folders.Lnk

 >^z::Run Folders.Lnk "Torrent.lnk"
 >^x::Run Folders.Lnk "Download.lnk"
 >^c::Run "Calc"
 >^v::Run Folders.Lnk "Vpn.lnk"
;>^b::Return
 >^n::Run Folders.Lnk "Music.lnk"
 >^m::Run Folders.Lnk "Media.lnk"

  >^[::Run VSCode " --profile %Temp    " Folders.Config "VSCode\%Temp.code-workspace"   , A_InitialWorkingDir, "Hide"
  >^]::Run VSCode " --profile %Note    " Folders.Config "VSCode\%Note.code-workspace"   , A_InitialWorkingDir, "Hide"
  >^\::Run VSCode " --profile %Windows " Folders.Config "VSCode\%Windows.code-workspace", A_InitialWorkingDir, "Hide"
 >^+\::Run VSCodeDefault " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"

 >^`;::Run "::{20d04fe0-3aea-1069-a2d8-08002b30309d}::" ;我的电脑
>^+`;::Run "::{645ff040-5081-101b-9f08-00aa002f954e}::" ;回收站
  >^'::Run Folders.Disks.Temp
 >^+'::Run Folders.Ram

 >^,::Run Folders.Lnk "OneCommander.lnk"
 >^.::Run Folders.Config "Windows.qdr"

 >^/::Run Folders.Script "Software\Chrome.cmd",        A_InitialWorkingDir, "Hide"
>^+/::Run Folders.Script "Software\ChromeDefault.cmd", A_InitialWorkingDir, "Hide"

 >^Esc::Run "TaskMgr" ;任务管理器
>^+Esc::Run Folders.Lnk "SecAnalysis.lnk"

>^Enter::Run Folders.Lnks "\#AppStore\Whiteboard.lnk"
>^BackSpace::Run WT " -d " Folders.Disks.Temp

>^-::Run "Notepad"
>^=::Run Folders.Lnk "Notepad++.lnk"

>^Up::   MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )


Arg.ctrl_show    := False
Arg.ctrl_content := ""

RCtrl::{
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
        else if ( CheckWindowActive("Maye") )
            Send "{Esc}"
        Arg.rctrl_click := 0
    } else if ( Arg.rctrl_click == 2 ) {
        Run "D:\#Lnk\#\Maye.lnk"
    } else if ( Arg.rctrl_click == 3 ) {
        CtrlGui()
    }
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

    InitGui("Dark")
    
    G.Add("Text", "-Center -Border", Arg.ctrl_content)
    G.Show("NA Center")

    Arg.ctrl_show := True
}
