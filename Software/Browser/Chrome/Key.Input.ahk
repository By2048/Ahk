
:*:\p]::{
    Send "{BackSpace}"
    A_Clipboard := "www.pixiv.net/users/" . A_Clipboard
    ClipWait(1)
    Send "^v"
}

:*:\p[::{
    Send "{BackSpace}"
    A_Clipboard := "www.pixiv.net/artworks/" . A_Clipboard
    ClipWait(1)
    Send "^v"
}
