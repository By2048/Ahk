
RegisterSoftware( "NeeView" , "NeeView" )

RegisterPosition( "NeeView__设置" , Position(-100 , -100) )

NeeView :=
{
    Delete : False
}


#Include *i NeeView.Private.ahk


#HotIf CheckWindowActive( "NeeView" ) && ( NeeView.Delete == True )

    Insert::{
        Send "{Enter}"
        NeeView.Delete := False
    }

    Delete::{
        Send "{Esc}"
        NeeView.Delete := False
    }

#HotIf


#HotIf CheckWindowActive( "NeeView" )

    Help::VSCodeWorkSpace("NeeView")

    Delete::
    {
        Send "{Delete}"
        NeeView.Delete := True
    }

    a::
    b::
    g::
    l::
    c::
    {
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && ( A_TimeSincePriorHotkey < 456 ) )
            Send "+" A_ThisHotkey
    }

    Space::{
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && ( A_TimeSincePriorHotkey < 456 ) )
            Send "{F24}"
    }

    ~RWin::
    {
        Send "{Blind}{vkFF}"
        scale := 1.2
        title := window.title
        if ( InStr(title, "书架") ) {
            w := 500 * scale
            h := 555 * scale
            x := Screen2.x + Screen2.w - w - 10
            y := Screen2.y + Screen2.h - h - 10
            if ( Abs(window.y - y) < 9 )
                y := y - Taskbar.h
            MoveWindowPosition( [x, y, w, h] )
        }
        if ( InStr(title, "页面列表") ) {
            w := 545 * scale
            h := 555 * scale
            x := Screen2.x + 10
            y := Screen2.y + Screen2.h - h - 10
            if ( Abs(window.y - y) < 9 )
                y := y - Taskbar.h
            MoveWindowPosition( [x, y, w, h] )
        }
    }

    #Include *i NeeView.Mouse.ahk
    #Include *i NeeView.Joy.ahk

#HotIf
