
RegisterSoftware( "WindowsTerminal" , "Terminal" )

RegisterHelpInfo( "Terminal" , FilePath(A_LineFile , "Terminal.help") )
RegisterHelpInfo( "Terminal" , "Config\Script.help"                   )

RegisterPosition( "Terminal" , Position(2200 , 1248)              , "Default" )
RegisterPosition( "Terminal" , Position("[Center][2]" , 0 , 1600) , "Backup"  )


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

#HotIf
