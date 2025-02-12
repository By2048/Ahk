
; 帮助
F1::Return

; 重命名
F2::Return

; 搜索
F3::Return

; 重新加载
; 强制重新加载
F5::Return
+F5::Return
^r::Return
^+r::Return
!r::Send "^r"
!+r::Send "^+r"

; 切换焦点
F6::Return
+F6::Return
!`::Send "{F6}"
^`::Send "+{F6}"

; 光标浏览模式
F7::Return
!i::Send "{F7}{Enter}"

; 全屏
F11::Return
#Enter::Send "{F11}"

; 开发者模式
F12::Return
^+j::Return
