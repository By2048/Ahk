
RegisterSoftware( "WindowsTerminal" , "Terminal" )

RegisterHelpInfo( "Terminal" , FilePath(A_LineFile , "Terminal.help") )
RegisterHelpInfo( "Terminal" , "Config\Private.help"                   )

Arg.TerminalCommand := False


#HotIf CheckWindowActive( "Terminal" ) && ( Arg.TerminalCommand == True )
    LShift::{
        Send "{Esc}"
        Arg.TerminalCommand := False
    }
#HotIf


#HotIf CheckWindowActive( "Terminal" )

     `::~
    +`::`

    `;:::
    +;::;

    #Include *i Terminal.Private.Key.ahk
    #Include *i Terminal.Private.Cmd.ahk
    #Include *i Terminal.Private.Path.ahk

    ; ~LShift::{
    ;     if ( InStr(A_PriorHotkey, A_ThisHotkey) ) {
    ;         if ( A_TimeSincePriorHotkey < 333 ) {
    ;             Send "^+p"
    ;             Arg.TerminalCommand := True
    ;         }
    ;     }
    ; }

    ; 关闭窗格
    NumLock::WinClose("A")

    !CapsLock::Send "{F13}"

    ; 关闭窗口
    !F4::Return

    ; 新建标签页
    ^+t::Return
    !t::Send "^+t"

    ; 新建窗口
    ^+n::Return
    ^n::Send "^+n"

    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 复制标签页
    ^+d::Return

    ; 结束运行
    !BackSpace::Send "^c"

    ; 复制
    ^F1::Return
    ^c::Send "^{F1}"

    ; 查找
    ^+f::Return
    <^f::Send "^+f"

    ; 滚动至历史记录 顶部|底部
    ^+Home::Return
    ^+End::Return
    !Home::Send "^+{Home}"
    !End::Send "^+{End}"

    ; 全屏
    #Enter::Send "{F14}"

    ; 字号重置
    ^WheelUp::Return
    ^WheelDown::Return

     <#[::
    <#+[::
     <#]::
    <#+]::
     <#\::
    <#+\::
    {
        w  := Screen2.w - 6
        h  := Screen2.h - 500
        x  := Screen2.x + Screen2.w/2-w/2
        y  := Screen2.y + Screen2.h/2-h/2
        yy := y - Taskbar.h
        pos_backup_main_a := Position(x, y , w, h)
        pos_backup_main_b := Position(x, yy, w, h)

        w  := Screen2.w - 6
        h  := 555
        x  := Screen2.x + Screen2.w/2-w/2
        y  := Screen2.y + Screen2.h - h
        yy := y - Taskbar.h
        pos_backup_mini_a := Position(x, yy, w, h)
        pos_backup_mini_b := Position(x, y , w, h)

        pos_main := Position(2200 , 1248)
        pos_mini := Position(1100 , 1248)

        Switch StrReplace(A_ThisHotkey, "<#", "")
        {
            Case "\"  : MoveWindowPosition(pos_main         )
            Case "+\" : MoveWindowPosition(pos_mini         )
            Case "]"  : MoveWindowPosition(pos_backup_main_a)
            Case "+]" : MoveWindowPosition(pos_backup_main_b)
            Case "["  : MoveWindowPosition(pos_backup_mini_a)
            Case "+[" : MoveWindowPosition(pos_backup_mini_b)
        }
    }

#HotIf
