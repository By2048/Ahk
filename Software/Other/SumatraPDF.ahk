
#If ( CheckWindowActive("SumatraPDF") )

    ; 重命名
    F2::Return
    !r::Send {F2}

    ; 全屏
    F11::Return
    ^+l::Return
    #Enter::Send {F11}

    ; 显示书签
    F12::Return
    \::Send {F12}

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; 打印
    ; ^p::Return
    ; !p::Send ^p
    
    ; 另存为
    ; ^s::Return
    ; !s::Send ^s

    ; 全选
    ; ^a::Return
    ; !a::Send ^a

    ; 复制选定范围
    ; ^c::Return
    ; !c::Send ^c
    
    ; 新建窗口
    ; ^n::Return
    ; !n::Send ^n

    ; 查找
    ; ^f::Return
    ; !f::Send ^f

    ; 打开
    ; ^o::Return
    ; !o::Send ^o

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    ; 属性
    ^d::Return
    !/::Send ^d

    ; 关闭 切换标签
    ^q::Return
    ^Tab::Return
    ^+Tab::Return
    !CapsLock::Send ^q
    !Tab::Send ^{Tab}
    !+Tab::Send ^+{Tab}

    ; 关闭
    ^w::Return
    !w::Send ^w

    ; 向往页
    ^g::Return
    !g::Send ^g

    ; 添加到收藏
    ; 显示收藏夹
    ^b::Return
    !d::Send {Ctrl Down}{b}{Ctrl Up}{Enter}
    !+d::Send {Alt Down}{a}{Alt Up}{Down}{Enter}
    !b::Send {Alt Down}{a}{Alt Up}{Up}{Up}{Enter}

    ; 符合页面
    ^0::Return
    !0::Send ^0

    ; 实际大小
    ^1::Return
    !1::Send ^1

    ; 符合宽度
    ^2::Return
    !2::Send ^2

    ; 符合内容
    ^3::Return
    !3::Send ^3

    ; 单页模式
    ^6::Return
    !6::Send ^6

    ; 双页模式
    ^7::Return
    !7::Send ^7

    ; 书籍视图
    ^8::Return
    !8::Send ^8

    ; 自定义缩放
    ^y::Return
    !y::Send ^y

    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; 向左旋转
    ^+-::Return
    9::Send ^+-

    ; 向右旋转
    ^+=::Return
    0::Send ^+=
    
    ; 幻灯片
    ^l::Return
    !v::Send ^l

    ; 向前翻
    !Left::Return
    [::Send !{Left}

    ; 向后翻
    !Right::Return
    ]::Send !{Right}

#If
