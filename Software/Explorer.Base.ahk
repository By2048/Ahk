
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

!p::Return
!BackSpace::Send "!p"

; 帮助
F1::Return

; 重命名
F2::Return
^r::Send "{F2}"

; 搜索
; 选择搜索框
F3::Return
^e::Return
<^f::Return

; 地址栏历史
; 下拉列表 展开
F4::Return
>!Space::Send "{F4}"

; 刷新
F5::Return
+\::Send "{F5}"

; 输入文件名 默认
; 切换焦点 在输入框
F6::Return
+F6::Return
>+/::Send "{F6}"
<+/::Send "+{F6}"

; 地址栏
!d::Return
<!Space::Send "!d"

; 删除
^d::Return

; 下拉列表 输入
^l::Return

; 显示选定文件夹上的所有文件夹
^+e::Return

; 创建新文件夹
^+n::Return
<^n::Send "^+n"
