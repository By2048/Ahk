
RegisterPosition( "FSViewer" , Position(2525 , 1450) )

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

    /::{
        EN()
        Sleep 99
        Send "m"
        Send "^{Tab 3}"
        Send "{Esc}" 
    }

    `::Send "m"

    [::Send "m9"
    ]::Send "{Left}"
    \::Send "{Right}"
    
    BackSpace::Send "!x"

    `;::Send "{Home}!{Left}{Home}"
     '::Send "{End}!{Right}"

    F1::Send "m1"
    F2::Send "m2"
    F3::Send "m3"
    F5::Return ;刷新
    F7::Return ;随机排序

    ^r::Send "{F2}"

    AppsKey::{
        MouseGetPos(&mouse_x, &mouse_y)
        if ( Abs(mouse_x - Screen.w/2) > 5 ) || ( mouse_y > 5 )
            MouseMove(Screen.w/2, 0, 0)
        else
            MouseMove(Screen.w-333, Screen.h-333, 0)
    }

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
