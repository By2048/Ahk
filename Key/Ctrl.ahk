
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
 >^p::Return
 >^[::Run LNK("Admin")
 >^]::Run LNK("Sync")
 >^\::Run LNK("ToDo")

 >^a::Run EXE("AntiMicroX")
 >^s::Run EXE("Sandboxie")
 >^d::Run EXE("DuplicateCleaner")
 >^f::Run EXE("FreeFileSync")
 >^g::Run EXE("Geek")
 >^h::Run AHK " " AhkSpy
 >^j::Run EXE("JetBrains")
 >^k::KeyHistory()
 >^l::Return

 >^z::Run EXE("Torrent")
 >^x::Run EXE("Download")
 >^c::Run "Calc"
 >^v::Run EXE("Vpn")
 >^b::Run EXE("Media")
 >^n::Run EXE("Music")
; ^m::

>^0::Return
>^-::Run EXE("Notepad3")
>^=::Run VSCodeDefault " --profile 默认 --new-window", A_InitialWorkingDir, "Hide"

 >^`;::Run LNK("Resource")
  >^'::Run LNK("Download")

>^,::Run "::{645FF040-5081-101B-9F08-00AA002F954E}::" ;回收站
>^/::Run LNK("Temp")
>^.::Run LNK("Cache")

  >^Up:: MoveWindowOffset(   0 , -10 )
>^Down:: MoveWindowOffset(   0 , +10 )
>^Left:: MoveWindowOffset( -10 ,   0 )
>^Right::MoveWindowOffset( +10 ,   0 )

>^Esc::Run "TaskMgr" ;任务管理器

>^Tab::Return

>^Space::Run WTBase

>^BackSpace::Run Folders.Admin

>^Enter::Run "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}::" ;我的电脑

>^Insert:: Run Folders.Software
>^Delete:: Run Folders.Data
>^AppsKey::Run PSLMini LN("Script\Software") "VSCode.ps1 --profile #Default " LN("Config\VSCode") "Windows.code-workspace ", LN("Temp"), "Hide"


>^CapsLock::{
    command := PSLMini LN("Script\Software") "Chrome.ps1 chat.deepseek.com"
    Run command, A_InitialWorkingDir, "Hide"
}

RCtrl & RShift::Run PSLMini LN("Script\Software") "Chrome.ps1",        LN("Temp"), "Hide"
RCtrl & LShift::Run PSLMini LN("Script\Software") "ChromeDefault.ps1", LN("Temp"), "Hide"

Arg.ctrl_show    := False
Arg.ctrl_content := ""


~RCtrl Up::
{
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
