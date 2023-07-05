
; {"keys": "f13","command": {"action": "quakeMode"}}

#HotIf CheckWindowActive( "Terminal" )

      :o:\s::F:\Software\
     :o:\sd::F:\Software\Development\
    :o:\sys::F:\System\
      :o:\i::F:\Image\
     :o:\io::F:\Image\Other\
     :o:\ih::F:\Image\History\
     :o:\iw::F:\Image\Wallpaper\
      :o:\r::F:\Resource\
     :o:\ro::F:\Resource\Other\
      :o:\p::F:\Phone\
     :o:\pr::F:\Phone\Recorder\
     :o:\pc::F:\Phone\Camera\

    <#\::MoveWindowToPosition(Position(2200 , 1400))

    ; 关闭窗格
    !CapsLock::Send "{F13}"

    ; 关闭窗口
    !F4::Return

    ; 新建标签页
    ^+t::Return
    !t::Send "^+t"

    ; 新建窗口
    ^+n::Return
    ^n::Send "^+n"

    !Tab::Send "^{Tab}"
    !+Tab::Send "^+{Tab}"

    ; 复制标签页
    ^+d::Return

    ;结束运行
    !BackSpace::Send "^c"

    ;复制
    ^F1::Return
    ^c::Send "^{F1}"

    ; 查找
    ^+f::Return
    <^f::Send "^+f"

    ; 滚动至历史记录底部
    ; 滚动至历史记录顶部
    ^+Home::Return
    !Home::Send "^+{Home}"
    ^+End::Return
    !End::Send "^+{End}"

    ; 全屏
    <#Enter::Send "{F14}"

    ; 字号重置
    ^WheelUp::Return
    ^WheelDown::Return

#HotIf
