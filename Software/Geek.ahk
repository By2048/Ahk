

#If ( CheckWindowsActive("Geek") )

    Enter::Return

    F5::Return
    \::Send {F5}

    ^s::Return
    ^r::Return
    ^e::Return
    ^w::Return

    <#\::
        MoveWindowsToDefaultPosition()
        win_id := Windows_Cache["win_id"]
        SendMessage, %LVM_SETCOLUMNWIDTH%, 0, 1030, SysListView321, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 1,  150, SysListView321, ahk_id %win_id%
        SendMessage, %LVM_SETCOLUMNWIDTH%, 2,  250, SysListView321, ahk_id %win_id%
    Return

#If