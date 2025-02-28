
RegisterPosition( "FSViewer"        , Position(2525 , 1450) )
RegisterPosition( "FSViewer__另存为" , Position(1414 , 1000) )

RegisterHelpInfo( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )


#HotIf CheckWindowActive("FSViewer", "", "*删除*")
    Delete::Send "!n"
    Insert::Send "!y"
#HotIf


#HotIf CheckWindowActive("FSViewer", "", "另存为")
    $[::Send "["
    $]::Send "]"
    $\::Send "\"
    $p::Send "p"
    $`::Send "``"
    $BackSpace::Send "{BackSpace}"
#HotIf


#HotIf CheckWindowActive("FSViewer")

    F1::Send "m1"
    F2::Send "m2"
    F3::Send "m3"
    F5::Return ;刷新
    F7::Return ;随机排序

    `::Send "m"

    AppsKey::{
        MouseGetPos(&mouse_x, &mouse_y)
        if ( Abs(mouse_x - Screen.w/2) > 5 ) || ( mouse_y > 5 )
            MouseMove(Screen.w/2, 0, 0)
        else
            MouseMove(Screen.w - 333, Screen.h - 333, 0)
    }

    BackSpace::{
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && ( A_TimeSincePriorHotkey < 456 ) )
            Send "!x"
    }

    [::Send "m9"
    ]::Send "{Left}"
    \::{
        Send "{Right}"
        Sleep 111
    }

    `;::Send "{Home}!{Left}{Home}"
     '::Send "{End}!{Right}"

    /::{
        EN()
        Sleep 99
        Send "m"
        Send "^{Tab 3}"
        Send "{Esc}" 
    }
    
    ^r::Send "{F2}"

    #\::{
        Send "{Blind}{vkFF}"

        total_width  := 2500
        total_height := 1357

        folder_width    := 425
        thumbnail_width := 691
        MoveWindowPosition(Position(total_width , total_height))
        
        window   := GetActiveWindowInfo(False)
        ctl_name := "TJamShellTree.UnicodeClass1"
        ctl_info := window.controls.%ctl_name%
        if ( Abs(ctl_info.w - folder_width) > 15 ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove(ctl_info.w , ctl_info.y + ctl_info.h / 2)
            offset := GetOffset("X")
            MoveControlUDLR(ctl_info, "Right", folder_width, offset)
            MouseMove(x_origin, y_origin, 0)
        }
        
        window   := GetActiveWindowInfo(False)
        ctl_name := "TTntListView.UnicodeClass1"
        ctl_info := window.controls.%ctl_name%
        if ( Abs(ctl_info.w - thumbnail_width) > 10 ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove(ctl_info.x + ctl_info.w , ctl_info.y + ctl_info.h / 2)
            offset := GetOffset("X")
            MoveControlUDLR(ctl_info, "Right", folder_width + thumbnail_width, offset)
            MouseMove(x_origin, y_origin, 0)
        }
    }

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
