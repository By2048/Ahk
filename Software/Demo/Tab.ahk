
; 软件设置{f1}
LAlt & RAlt::Send ^{F1}

; 右键菜单{AppsKey}
RAlt & LAlt::Send {AppsKey}

; 切换标签页{f2}
!Tab::Send !{F2}
!+Tab::Send !+{F2}

; 关闭标签页{f3}
!CapsLock::Send !{F3}
!+CapsLock::Send !+{F3}

; 特殊按键覆盖{f4}
^F4::Return
^+F4::Return
!F4::Send !{F4}
!+F4::Send !+{F4}
