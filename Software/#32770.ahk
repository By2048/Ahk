
#If ( CheckWindowsActive( "" , "#32770" , "打开|打开文件|更改图标|选择文件|另存为" ) )

    <#\::

        MoveWindowsToDefaultPosition()

        result := GetActiveWindowsInfo("Window")
        win_id := result.win_id

        cname  := "Address Band Root1"
        cinfo  := result["win_controls"][cname]
        cx     := cinfo.x
        cy     := cinfo.y
        cw     := 1200
        ch     := cinfo.h
        ControlMove, %cname%, %cx%, %cy%, %cw%, %ch%, ahk_id %win_id%
        
        cname  := "UniversalSearchBand1"
        cinfo  := result["win_controls"][cname]
        cx     := 1450
        cy     := cinfo.y
        cw     := cinfo.w + ( cinfo.x - cx )
        ch     := cinfo.h
        ControlMove, %cname%, %cx%, %cy%, %cw%, %ch%, ahk_id %win_id%

        cinfo  := result["win_controls"]["DirectUIHWND2"]
        offset := 1
        cleft  := 393
        MoveControlUDLR(cinfo,  ,  , cleft,  , offset)

        ; 平铺模式
        cinfo := result["win_controls"]["DirectUIHWND2"]
        x := cinfo.x  + 10
        y := cinfo.yy - 10
        MouseClick, Right, %x%, %y%, 1, 0
        Send {v}{s}

        ; 调整列宽 分组依据 更多
        ; MouseClick, Right, x+30, y+30, 1, 0
        ; Send {p}{m}
        ; Sleep 300

        ; 名称
        ; Send !t
        ; Send !w
        ; SendInput 990

        ; 修改日期
        ; Send !t
        ; Send {Down}
        ; Send !w
        ; SendInput 250

        ; 大小
        ; Send !t
        ; Send {Down}
        ; Send !w
        ; SendInput 200

        ; Send {Enter}
    Return

#If
