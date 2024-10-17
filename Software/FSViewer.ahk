
RegisterPosition( "FSViewer" , Position(2525 , 1450) )

RegisterHelp( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )


#HotIf CheckWindowActive("FSViewer", "", "删除文件")
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

    `::Send "m"
    p::{
        Sleep 99
        Send "{m}"
        Sleep 99
        Send "^{Tab 3}"
        Send "{Esc}"
    }
    [::Send "m9"
    ]::Send "{Left}"
    \::Send "{Right}"
    BackSpace::Send "!x"

    F1::Send "m1"
    F2::Send "m2"
    F3::Send "m3"
    F5::Return ;刷新
    F7::Return ; 随机排序

    ^r::Send "{F2}"

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
