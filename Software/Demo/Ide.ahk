
; 软件设置{f1}
LAlt & RAlt::Send {F13}

; 右键菜单{AppsKey}
RAlt & LAlt::Send {AppsKey}

; 切换标签页{f2}
!Tab::Send !{F14}
!+Tab::Send !+{F14}

; 关闭标签页{f3}
!CapsLock::Send !{F15}
!+CapsLock::Send !+{F15}

; 特殊按键覆盖{f4}
^F4::Return
^+F4::Return
!F4::Send !{F16}
!+F4::Send !+{F16}
