
#Include Tool\Other.ahk

#Include Tool\Url.ahk


RegisterSoftware( "chrome" , "Chrome" )

RegisterHelpInfo( "Chrome" , "Software\Browser\Help\@.help"        )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Vimium.help"   )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Search.help"   )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\ZhiHu.help"    )
RegisterHelpInfo( "Chrome" , "Software\Browser\Help\Bilibili.help" )

win_w   := 2500
win_h   := 1400
win     := Position(win_w, win_h)
win_x   := win.x
win_y   := win.y + (30-20)/2  ;坐标修正
win_pos := Position( win_x , win_y , win_w , win_h )
RegisterPosition( "Chrome" , win_pos , "Default" )

win_pos := Position( "[Center][2]" , 0 , 1600 )
RegisterPosition( "Chrome" , win_pos , "Backup" )


; Chrome键盘快捷键 https://support.google.com/chrome/answer/157179


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

#HotIf


#HotIf CheckWindowActive( "Chrome" )

    #Include Key\Base.ahk
    #Include Key\Fxx.ahk
    #Include Key\Insert.ahk
    #Include Key\Joy.ahk
    #Include Key\Mouse.ahk
    #Include Key\Private.ahk

#HotIf
