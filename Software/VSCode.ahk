
#if ( WindowsActive("VSCode") )

    >!m::Send, !VM ;显示迷你地图

    ^F1::Return
    LAlt & RAlt::Send, ^{F1}
    RAlt & LAlt::Send, {AppsKey}
    
    ; !x::Send, ^x ; 剪切
    ; !c::Send, ^c ; 拷贝
    ; !v::Send, ^v ; 粘贴
    ; !z::Send, ^z ; 撤销
    ; !+z::Send ^+z ; 重做

#if
