
; 退出软件 修改软件界面设置
^Esc::Return
!Esc::Return
^+Esc::Return
!+Esc::Return
^!Esc::Return
^!+Esc::Return

; 屏蔽系统设置 使用自定义设置
^F4::Return
!F4::Return
^+F4::Return
!+F4::Return
^!F4::Return
^!+F4::Return

; 切换多标签
^Tab::Return
^+Tab::Return
!Tab::Send ^{Tab}
!+Tab::Send ^+{Tab}

; 关闭标签 重新打开标签
!CapsLock::Send !{F4}
!+CapsLock::Return

; 软件设置 右键菜单
LAlt & RAlt::Return
RAlt & LAlt::Return
