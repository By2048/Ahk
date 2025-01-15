
; 注册表

RegisterSoftware( "regedit" , "RegEdit" )

RegisterHelpInfo("RegEdit", FilePath(A_LineFile, "RegEdit.help"))

#HotIf CheckWindowActive( "RegEdit" )

    F2::Return
    ^r::Send "{F2}"

    F5::Return
    $CapsLock::Send "{F5}"

    #\::{
        total_width  := 2222
        total_height := 1222
        MoveWindowPosition(Position(total_width , total_height))

        name  := "SysListView321"
        width := Map( 1 , 400   ; 名称
                    , 2 , 171   ; 类型
                    , 3 , 888 ) ; 数据
        SetColumnWidth(name, width)

        max_left := 733
        offset   := 33

        if ( Abs(max_left - window.controls.SysTreeView321.w) < offset )
            return

        CoordMode("Mouse", "Window")
        MouseGetPos(&x_origin, &y_origin)
        Send "{Alt Down}{v}{Alt Up}{Down}{Enter}"
        MouseMove(max_left, total_height / 2)
        Send "{Esc}"
        MouseMove(x_origin, y_origin)
    }

#HotIf
