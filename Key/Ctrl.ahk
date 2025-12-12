
#Include *i Ctrl.Private.ahk

 >^q::Run Folders.Config "Windows.qdr"
 >^w::Run Folders.Lnks "\#AppStore\Whiteboard.lnk"
 >^e::Run Folders.Lnk "Everything.lnk"
 >^r::Run Folders.Lnk "FFRenamePro.lnk"
 >^t::Run Folders.Lnk "Telegram.lnk"
 >^y::Return
 >^u::Return
 >^i::Return
 >^o::Run Folders.Lnk "OneCommander.lnk"
 >^p::Run VSCodeDefault " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"
 >^[::Run VSCode " --profile %Temp    " Folders.Config "VSCode\%Temp.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " --profile %Note    " Folders.Config "VSCode\%Note.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^\::Run VSCode " --profile %Windows " Folders.Config "VSCode\%Windows.code-workspace", A_InitialWorkingDir, "Hide"

 >^a::Run Folders.Lnk "AntiMicroX.lnk"
 >^s::Run Folders.Lnk "Sandboxie.lnk"
 >^d::Run Folders.Lnk "DuplicateCleaner.lnk"
 >^f::Run Folders.Lnk "FreeFileSync.lnk"
 >^g::Run Folders.Lnk "Geek.lnk"
 >^h::Run AHK " " AhkSpy
;>^j::Return
 >^k::KeyHistory()

 >^l::Run Folders.Lnks

 >^z::Run Folders.Lnk "Torrent.lnk"
 >^x::Run Folders.Lnk "Download.lnk"
 >^c::Run "Calc"
 >^v::Run Folders.Lnk "Vpn.lnk"
;>^b::Return
 >^n::Run Folders.Lnk "Music.lnk"
 >^m::Run Folders.Lnk "Media.lnk"

 >^Enter::Run "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}::" ;我的电脑
     >^'::Run Folders.ToDo
    >^`;::Run Folders.Download

     >^/::Run Folders.Disks.Temp
     >^.::Run Folders.Ram
     >^,::Run "::{645FF040-5081-101B-9F08-00AA002F954E}::" ;回收站

>^-::Run "Notepad"
>^=::Run Folders.Lnk "Notepad++.lnk"

>^Up::   MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )

>^Esc::Run "TaskMgr" ;任务管理器

   >^Insert::Return
   >^Delete::Return
>^BackSpace::Run WT " -d " Folders.Disks.Temp

RCtrl & RShift::Run Folders.Script "Software\Chrome.cmd",        A_InitialWorkingDir, "Hide"
RCtrl & LShift::Run Folders.Script "Software\ChromeDefault.cmd", A_InitialWorkingDir, "Hide"


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
