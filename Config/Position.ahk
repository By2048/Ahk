
#Include %A_WorkingDir%\Tool\Change.ahk

; Key
; [process_name]
; [process_name]_[class]
; []_[class]
; [process_name]_[title]
; [process_name]_[class]_[title]
; []_[class]_[title]
; []_[]_[title]

; Value
; 设置一些软件默认位置 [x,y,w,h]

Global Windows_Position := {}

Global WPD := {} ; Windows_Position_Default
Global WPB := {} ; Windows_Position_Backup

Windows_Position["Default"] := WPD
Windows_Position["Backup" ] := WPB

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Position(args*)
{
    if ( args.Length() == 2 ) {
        x := "[Center][1]"
        y := "[Center][1]"
        w := args[1]
        h := args[2]
    }
    if ( args.Length() == 3 ) {
        x := args[1]
        y := args[1]
        w := args[2]
        h := args[3]
    }
    if ( args.Length() == 4 ) {
        x := args[1]
        y := args[2]
        w := args[3]
        h := args[4]
    }

    win_x := x
    win_y := y
    win_w := w
    win_h := h

    x := Format("{:L}", x)
    y := Format("{:L}", y)

    if ( InStr(x, "[1]") ) {
        win_w := w < 0 ? Screens.1.w + w : w
        if ( InStr(x, "[center]" ) ) {
            win_x := Screens.1.x + Screens.1.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[1]") ) {
        win_h := h < 0 ? Screens.1.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.1.y + Screens.1.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[2]") ) {
        win_w := w < 0 ? Screens.2.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screens.2.x + Screens.2.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[2]") ) {
        win_h := h < 0 ? Screens.2.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.2.y + Screens.2.h/2 - win_h/2
        }
    }

    if ( InStr(x, "[3]") ) {
        win_w := w < 0 ? Screens.3.w + w : w
        if ( InStr(x, "[center]") ) {
            win_x := Screens.3.x + Screens.3.w/2 - win_w/2
        }
    }
    if ( InStr(y, "[3]") ) {
        win_h := h < 0 ? Screens.3.h + h : h
        if ( InStr(y, "[center]") ) {
            win_y := Screens.3.y + Screens.3.h/2 - win_h/2
        }
    }

    win_x := Round(win_x)
    win_y := Round(win_y)
    win_w := Round(win_w)
    win_h := Round(win_h)
    return [ win_x , win_y , win_w , win_h ]
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#Include %A_WorkingDir%\Config\Position.Base.ahk
#Include %A_WorkingDir%\Config\Position.Chat.ahk
#Include %A_WorkingDir%\Config\Position.IDE.ahk
#Include %A_WorkingDir%\Config\Position.Windows.ahk
