
RegisterPosition( "qBittorrent" , Position(2345 , 1100) )


#HotIf CheckWindowActive("qBittorrent", "", "移除 Torrent")

    Insert::Send "+{Tab}{Enter}"
    Delete::Send "{Esc}"
    BackSpace::Send "{Tab}{Space}{Tab}{Enter}"

#HotIf


#HotIf CheckWindowActive("qBittorrent")

    NumLock::Send "{Enter}"

    NumpadHome::Send "{Esc}"
    NumpadEnd::Send "{Esc}"

    ; 打开
    ^o::Return
    ^+o::Return

    CapsLock::Send "^+o"

    ; Esc::S
    `::Send "{Enter}"

    ; 设置
    !o::Return
    ^AppsKey::Send "!o"

    F1::Return

    ; 启动
    ^s::Return

    ; 统计
    ; ^i::Return

    ; 停止
    ^p::Return

    ; 退出
    ^q::Return

    ; 制作torrent
    ^n::Return

    ; 暂停会话
    ^+p::Return

    ; 锁定
    ^l::Return

    ; 复制文件名
    ^+c::Send "{AppsKey}cn"

#HotIf
