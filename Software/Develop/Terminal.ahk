
RegisterSoftware( "WindowsTerminal" , "Terminal" )

RegisterHelpInfo( "Terminal" , FilePath(A_LineFile , "Terminal.help") )
RegisterHelpInfo( "Terminal" , "Config\Script.help"                   )

Arg.TerminalCommand := False


#HotIf CheckWindowActive( "Terminal" ) && ( Arg.TerminalCommand == True )
    LShift::{
        Send "{Esc}"
        Arg.TerminalCommand := False
    }
#HotIf


#HotIf CheckWindowActive( "Terminal" )

     `::Send "_"
    +`::Send "~"

    `;::Send ":"
    +;::Send ";"

    #Include *i Terminal.Private.ahk
    #Include *i Terminal.Cmd.Private.ahk
    #Include *i Terminal.Path.Private.ahk

    ;-------------------------------;

    ; ~LShift::{
    ;     if ( InStr(A_PriorHotkey, A_ThisHotkey) ) {
    ;         if ( A_TimeSincePriorHotkey < 333 ) {
    ;             Send "^+p"
    ;             Arg.TerminalCommand := True
    ;         }
    ;     }
    ; }

    ; 关闭窗格
    NumLock::Send "{F13}"
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
     <#]::
     <#\::
    <#+\::{
        Send "{Blind}{vkFF}"
        pos_info := Position("[Center][2]" , -3 , -555)
        x := Screens.2.x + 3
        y := Screens.2.y + Screens.2.h * ( 3 / 4 )
        w := Screens.2.w - 6
        h := Screens.2.h / 4
        pos_mini := Position(x, y, w, h)
        key := StrReplace(A_ThisHotkey, "<#", "")
        Switch key {
            Case "\"  : MoveWindowPosition(Position(2200 , 1248))
            Case "+\" : MoveWindowPosition(Position(1100 , 1248))
            Case "]"  : MoveWindowPosition(pos_info)
            Case "["  : MoveWindowPosition(pos_mini)
        }
    }

#HotIf
