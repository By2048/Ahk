
RegisterSoftware( "IDMan" , "IDM" )
RegisterPosition( "IDM" , Position(1111 , 999) )

#HotIf CheckWindowActive( "IDM" )

     CapsLock::
    +CapsLock::
    {
        window := GetActiveWindowInfo(False)
        text   := window.text
        title  := window.title

        if ( InStr(title, "Internet Download Manager") )
            Send "{LAlt}{Enter}{Enter}"
        if ( InStr(title, "输入新任务的地址") )
            Send "!k"
        if ( InStr(title, "下载文件信息") )
            Send "!s"

        if ( InStr(text, "IDM DwnlProgress Window") || InStr(title, "%") ) {
            if ( A_ThisHotkey == "CapsLock" )
                MoveWindowPosition(Position(1010 , 777))
            if ( A_ThisHotkey == "+CapsLock" )
                MoveWindowPosition(Position("[Center][2]", Screens.2.h - 1111, 1010, 777))
        }

    }
#HotIf

#HotIf CheckWindowActive( "IDM" )
    ; CapsLock::MoveWindowPosition(Position(1111 , 999))
    ; cfg := " 1:文件名:500  4:大小:150  8:剩余时间:620  6:传输速度:220  5:状态:180 "
    ; cfg := GetColumnConfig(cfg)
    ; SetColumnWidth("SysListView321", cfg)
#HotIf
