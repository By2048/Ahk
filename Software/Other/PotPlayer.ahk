
#HotIf CheckWindowActive("PotPlayer")

    ; 2倍数播放
    >!2::Send "{c 10}"

    >+Delete::Send "+{Delete}"

    !CapsLock::Send "!{F4}"

    <#Enter::Send "!{Enter}"

#HotIf
