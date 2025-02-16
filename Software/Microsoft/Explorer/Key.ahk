
; !Left::Return  ; 查看上一个文件夹
; !Right::Return ; 查看下一个文件夹
; !Up::Return    ; 查看该文件夹所在的文件夹

; !p::Return ; 显示预览面板
; !d::Return ; 选择地址栏

; !Enter::Return ; 属性对话框

^!1::Return ;超大图标
^!2::Return ;大图标
^!3::Return ;中等图标
^!4::Return ;小图标
^!5::Return ;列表
^!6::Return ;详细信息
^!7::Return ;平铺
^!8::Return ;内容
^!-::Return ;向下切换
^!=::Return ;向上切换

; 切换图标显示模式
^WheelUp::Return
^WheelDown::Return

!1::Send "^!1"
!2::Send "^!2"
!3::Send "^!3"
!4::Send "^!4"
!5::Send "^!5"
!6::Send "^!6"
!7::Send "^!7"
!8::Send "^!8"
!9::Send "^!-"
!0::Send "^!="
!=::Send "^!6"
!-::Send "^!7"

; 帮助
F1::Return

; 重命名
F2::Return
^r::Send "{F2}"
^e::Send "{F2}{Right}"

; 搜索
; 选择搜索框
; ^e::Return
; ^f::Return
F3::Return

; 地址栏历史
; 下拉列表 展开
F4::Return

; 刷新
F5::Return
~RShift::F5
~CapsLock::F5

; 输入文件名 默认
; 切换焦点 在输入框
; 切换桌面焦点
F6::Return
+F6::Return
!Tab::Send "{F6}"
!+Tab::Send "+{F6}"

; 删除
^d::Return

; 下拉列表 地址栏
!d::Return
^l::Return
!/::Send "!d"

; 显示选定文件夹上的所有文件夹
; 树状目录中定位到文件夹
^+e::Return
^g::Send "^+e"

; 创建新文件夹
^+n::Return
<^n::Send "^+n"

; 重命名时功能调整
<^BackSpace::Send "^+{Left}{BackSpace}"

; 复制文件名
<^+c::Send "{F2}^a^c{Esc}"
