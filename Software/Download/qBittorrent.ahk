
RegisterPosition( "qBittorrent" , Position(2345 , 1100) )


#HotIf CheckWindowActive("qBittorrent", "", "移除 Torrent")

    Insert::Send "+{Tab}{Enter}"
    Delete::Send "{Esc}"
    BackSpace::Send "{Tab}{Space}{Tab}{Enter}"

#HotIf


#HotIf CheckWindowActive("qBittorrent")

    NumLock::Send "{Enter}"

    ; Esc::S
    `::Send "{Enter}"

    F1::Return

    ; 退出
    ^q::Return

    ; 锁定
    ^l::Return

    ; 复制文件名
    ^+c::Send "{AppsKey}cn"

#HotIf
