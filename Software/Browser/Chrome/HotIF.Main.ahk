
#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "近期的下载记录" )
    NumpadEnd::MouseClickTool(40, 123)
#HotIf


#HotIf CheckWindowActive( "Chrome" , "*WidgetWin*" , "书签" )
    F2::Return
    ^r::Send "{F2}"
    $AppsKey::Send "{AppsKey}"
#HotIf


#HotIf CheckWindowActive( "Chrome" )

    ; 默认功能 - 激活菜单按钮
    ~RAlt::
    ~LAlt::{
        Send "{Blind}{vkFF}"
        return
    }

    ~RWin::Return

    ; 书签第一个
    !\::
    !+\::{
        shift_status := GetKeyState("Shift", "P")
        Send "{F6 3}"
        if ( shift_status )
            Send "{Left}"
    }

    ; 将焦点放置在Chrome工具栏中的第一项上
    !+t::Return
    Arg.alt_shift_t := False
    ![::{
        if ( ! Arg.alt_shift_t ) {
            Arg.alt_shift_t := True
            Send "!+t"
        } else {
            Arg.alt_shift_t := False
            Send "{Esc}"
        }
    }

    ; 将焦点放置在Chrome工具栏中最右侧的那一项上
    F10::Return
    !]::Send "{F10}"

    ; 收藏 取消收藏
    ^d::Return
    ^+d::Return
    !d::{
        Send "^d"
        Sleep 55
        Send "{Tab}"
        Sleep 55
        Send "{Enter}"
        Sleep 111
        Send "{Tab 3}{Enter}"
        Sleep 111
        Send "{End}"
        Send "{Enter}"
        Sleep 111
        if ( CheckWindowActive( "Chrome" , "*WidgetWin*" , "修改书签" ) )
            MoveWindowPosition( Position( 777 , 1111 ) )
        Send "{Tab 2}{Left 4}{Right}"
    }
    !+d::{
        Send "^d"
        Sleep 111
        Send "{Tab 3}{Enter}"
    }

    ; 定位地址栏
    Arg.search_input := False
    CapsLock::
    !Space::{
        if ( ! Arg.search_input ) {
            Arg.search_input := True
            Send "!d"
        } else {
            Arg.search_input := False
            Send "{F6 3}"
        }
    }

    #Include Key.Input.ahk
    #Include Key.Insert.ahk
    #Include Key.LShift.ahk

#HotIf
