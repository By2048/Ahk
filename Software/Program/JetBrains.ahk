
#If CheckWindowActive("JetBrains")

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
    
    AppsKey::Send ^,

    !+\::Send ^r

    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    !Up::Send ^+{Up}
    !Down::Send ^+{Down}
    
    !BackSpace::Send ^q

#If
    

; https://www.jetbrains.com/toolbox-app/faq/#keyboard-navigation

; ↑/↓ or Page Down/Page Up scroll up and down
; Enter open the selected project/tool
; Ctrl + , open the Settings dialog
; Esc close the Toolbox App window / Close the Toolbox App settings
; Ctrl + Q quit the Toolbox App
; Ctrl + R check for updates
; Ctrl + U update all
; Ctrl + T update the Toolbox App
; Ctrl + 1 switch to the Tools tab
; Ctrl + 2 switch to the Projects tab

; Ctrl + H minimize/maximize Available Tools on the Tools tab
; Ctrl + Shift + ↑/↓ reorder the installed IDEs on the main screen
; Space update the selected IDE

; Alt + Plus add/delete to/from favorites
; Ctrl + F start searching
; Alt + Del hide the project from the Toolbox App
