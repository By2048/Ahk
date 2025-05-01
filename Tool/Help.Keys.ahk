
Arg.hotkeys_show    := False
Arg.hotkeys_index   := 0
Arg.hotkeys_current := ""

; 隐藏快捷键提示
HelpKeysShow(step:=0)
{
    Global Window , Arg , G , Software_Keys_Help

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_title        := window.title
    hotkeys_config   := GetWindowConfig(window, Software_Keys_Help)

    ; 没有内容
    if ( hotkeys_config.Length == 0 ) {
        HelpText("`n No Content `n", "Center", "Screen", 500)
        return
    }

    ; 已经显示 且只有一个内容
    if ( Arg.hotkeys_show == True && hotkeys_config.Length == 1 )
        return

    ; 未显示且有多个内容
    if ( Arg.hotkeys_show == False && hotkeys_config.Length >= 1 )
        hotkeys_index := 1

    ; 已经显示且有多个内容
    if ( Arg.hotkeys_show == True && hotkeys_config.Length > 1 ) {
        hotkeys_index := Arg.hotkeys_index + step
        if ( hotkeys_index > hotkeys_config.Length )
            hotkeys_index := 1
        else if ( hotkeys_index == 0 )
            hotkeys_index := hotkeys_config.Length
    }

    InitGui()
    
    content := hotkeys_config[hotkeys_index]
    GContent := G.Add("Text", "-Center -Border", content)
    GContent.GetPos(&cx, &cy, &cw, &ch)
    margin := ( G.MarginX + G.MarginY ) / 2
    if ( hotkeys_config.Length > 1 ) {
        data  := Format("{}/{}", hotkeys_index, hotkeys_config.Length)
        GPage := G.Add("Text", "-Border xm ym", data)
        GPage.GetPos(&px, &py, &pw, &ph)
        GPage.Move(cw - pw + margin, ch - ph + margin, pw, ph)
    }
    G.Show("NA Center")

    Arg.hotkeys_show    := True
    Arg.hotkeys_index   := hotkeys_index
    Arg.hotkeys_current := content
}


; 隐藏快捷键提示
HelpKeysHide()
{
    Global G , Arg
    Try G.Destroy()
    Arg.hotkeys_show    := False
    Arg.hotkeys_index   := 0
    Arg.hotkeys_current := ""
}


; 快捷键提示贴图
HelpKeysSnipaste()
{
    Global G , Arg
    origin := A_Clipboard
    A_Clipboard := Arg.hotkeys_current
    ClipWait(1)
    HelpKeysHide()
    cmd := Format("{1} paste --clipboard", Snipaste)
    Run cmd
    Sleep 555
    A_Clipboard := origin
}


#HotIf ( Arg.hotkeys_show == True )
    [::HelpKeysShow(-1)
    ]::HelpKeysShow(+1)
    \::HelpKeysSnipaste()
    CapsLock::Return
#HotIf
