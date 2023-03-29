
; https://www.jetbrains.com/toolbox-app/faq/#keyboard-navigation

#HotIf CheckWindowActive("JetBrainsToolBox")

    AppsKey::Send "^,"

    ^Tab::Return
    ^+Tab::Return

    ^1::Return
    ^2::Return
    ^3::Return

    ^q::Return
    ^r::Return
    ^u::Return
    ^t::Return
    ^h::Return

    ^+Up::Return
    ^+Down::Return

    !+\::Send "^r"

    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    !Up::Send "^+{Up}"
    !Down::Send "^+{Down}"

    !BackSpace::Send "^q"

#HotIf
