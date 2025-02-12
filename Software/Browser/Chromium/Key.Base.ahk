
; 开发者工具选择元素
^+c::Return

; 新标签页
^t::Return
!t::Send "^t"

; 新窗口
; ^n::Return
; !n::Send ^n

; 新隐私窗口
; ^+n::Return
; !+n::Send ^+n

; 保存
; ^s::Return
; !s::Send ^s

; 定位
; ^g::Return
; !g::Send ^g
; ^+g::Return
; !+g::Send ^+g

; 清理浏览记录
; ^+Delete::Return

; 关闭窗口
^w::Return
^F4::Return
~!CapsLock::{
    Send "{Blind}{vkFF}"
    Send "^w"
}

; 关闭所有窗口
^+w::Return

; 重新打开标签页
^+t::Return
~!+CapsLock::{
    Send "{Blind}{vkFF}"
    Send "^+t"
}

; 切换标签页
^1::Return
^2::Return
^3::Return
^4::Return
^5::Return
^6::Return
^7::Return
^8::Return
^9::Return

^Tab::Return
^+Tab::Return

; 任务管理
!Esc::Send "+{Esc}"
+ESc::Return

; 切换标签页
!Tab::Send "^{Tab}"
!+Tab::Send "^+{Tab}"
!Home::Send "^1"
!End::Send "^9"

; 滚动
^PgUp::Return
^PgDn::Return
!PgUp::Send "^+{Tab}"
!PgDn::Send "^{Tab}"

; 切换书签栏显示隐藏状态
^+b::Return
!v::Send "^+b"

; 打开文件
; ^o::Return

; 书签管理页面
^+o::Return
!b::Send "^+o"

; 用户按钮
^+m::Return

; 使用Xxx搜索
^k::Return
^e::Return

; 历史记录
^h::Return
!h::Send "^h"

; 下载页面
^j::Return
!j::Send "^j"

; 打印 高级打印
<^p::Return
<^+p::Return
!p::Send "^p"
!+p::Send "^+p"

; 反馈
!+i::Return

; 查看源码
^u::Return

; 打开Chrome菜单
!f::Return
!e::Return
!AppsKey::!e

; 网页缩放
^WheelUp::Return
^WheelDown::Return
^0::Return
^-::Return
^=::Return

; 缩放
#0::Send "^0"
#-::Send "^{-}"
#=::Send "^{=}"
