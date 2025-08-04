
RegisterSoftware( "FSViewer" , "FSViewer" )
RegisterHelpInfo( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )
RegisterPosition( "FSViewer_#32770_另存为" , Position(1414 , 1000) )
RegisterPosition( "FSViewer__批量转换" , Position(1800 , 1200) )


#Include *i FSViewer.Private.ahk


#HotIf CheckWindowActive( "FSViewer" , "" , "*删除*" )
    Delete::Send "!n"
    Insert::Send "!y"
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "" , " 批量转换* | 重命名* " )

#HotIf


#HotIf CheckWindowActive( "FSViewer" , "" , "另存为" )
    $[::Send "["
    $]::Send "]"
    $\::Send "\"
    $p::Send "p"
    $`::Send "``"
    $BackSpace::Send "{BackSpace}"
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "FastStoneImageViewerMainForm.UnicodeClass" )

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

#HotIf


#HotIf CheckWindowActive( "FSViewer" , "TFullScreenWindow" )
    AppsKey::{
        MouseGetPos(&mouse_x, &mouse_y)
        if ( Abs(mouse_x - Screen.w/2) > 5 ) || ( mouse_y > 5 )
            MouseMove(Screen.w/2, 0, 0)
        else
            MouseMove(Screen.w - 300, Screen.h - 300, 0)
    }
#HotIf


#HotIf CheckWindowActive( "FSViewer" )

     F1::Send "m1"
     F2::Send "m2"
     F3::Send "m3"
     F5::Return ;刷新
     F7::Return ;随机排序
    F11::Return ;全屏
    F12::Return ;设置

    `::Send "m"

    [::Send "m9"
    ]::{
        Send "{Left}"
        Sleep 123
    }

    \::{
        Send "{Right}"
        Sleep 123
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

    ![::ControlFocus("TJamShellTree.UnicodeClass1" , "A")
    !]::ControlFocus("TTntListView.UnicodeClass1"  , "A")
    !\::ControlFocus("TImageEnView1"               , "A")

    LAlt & RAlt::Send "{F12}"

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
