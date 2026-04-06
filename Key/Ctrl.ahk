
#Include *i Ctrl.Private.ahk

 >^q::Run LN("Config\Windows.qdr")
 >^w::Run LN("Run") "#AppStore\Whiteboard.lnk"
 >^e::Run EXE("Everything")
 >^r::Run EXE("FFRenamePro")
 >^t::Run EXE("Telegram")
 >^y::Return
 >^u::Return
 >^i::Return
 >^o::Run EXE("OneCommander")
 >^p::Run VSCode " --profile #Temp    " LN("Config") "VSCode\%Temp.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^[::Run VSCode " --profile #Note    " LN("Config") "VSCode\%Note.code-workspace"   , A_InitialWorkingDir, "Hide"
 >^]::Run VSCode " --profile #Default " LN("Config") "VSCode\%Project.code-workspace", A_InitialWorkingDir, "Hide"
 >^\::Run VSCode " --profile #Default " LN("Config") "VSCode\%Windows.code-workspace", A_InitialWorkingDir, "Hide"

 >^a::Run EXE("AntiMicroX")
 >^s::Run EXE("Sandboxie")
 >^d::Run EXE("DuplicateCleaner")
 >^f::Run EXE("FreeFileSync")
 >^g::Run EXE("Geek")
 >^h::Run AHK " " AhkSpy
;>^j::Return
 >^k::KeyHistory()
 >^l::Return

 >^z::Run EXE("Torrent")
 >^x::Run EXE("Download")
 >^c::Run "Calc"
 >^v::Run EXE("Vpn")
;>^b::Return
 >^n::Run EXE("Music")
 >^m::Run EXE("Media")

>^0::Return
>^-::Run EXE("Notepad3")
>^=::Run VSCodeDefault " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"

 >^`;::Run LNK("Download")
  >^'::Run LNK("Resource")

  >^,::Run "::{645FF040-5081-101B-9F08-00AA002F954E}::" ;回收站
  >^.::Run LNK("Cache")
  >^/::Run LNK("Temp")

  >^Up::   MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )

>^Esc::Run "TaskMgr" ;任务管理器

>^CapsLock::Run LNK("ToDo")

>^Enter::Run "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}::" ;我的电脑

>^AppsKey::Return

>^Tab::Return

>^Space::Run WT " --focus --size 124,36 -d " Folders.Temp

   >^Insert::Run LNK("#Data")
   >^Delete::Run LNK("#File")
>^BackSpace::Run LNK("#Admin")

RCtrl & RShift::Run LN("Script\Software") "Chrome.cmd",        A_InitialWorkingDir, "Hide"
RCtrl & LShift::Run LN("Script\Software") "ChromeDefault.cmd", A_InitialWorkingDir, "Hide"

Arg.ctrl_show    := False
Arg.ctrl_content := ""

~RCtrl::{
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
        Run EXE("Maye")
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
