
; 隐藏快捷键提示
HelpKeysShow(step:=0)
{
    Global Window, Arg, Software_Keys_Help
    Global G

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
    if ( Arg.hotkeys_show == True and hotkeys_config.Length == 1 )
        return

    ; 未显示且有多个内容
    if ( Arg.hotkeys_show == False and hotkeys_config.Length >= 1 )
        hotkeys_index := 1

    ; 已经显示且有多个内容
    if ( Arg.hotkeys_show == True and hotkeys_config.Length > 1 ) {
        hotkeys_index := Arg.hotkeys_index + step
        if ( hotkeys_index > hotkeys_config.Length )
            hotkeys_index := 1
        else if ( hotkeys_index == 0 )
            hotkeys_index := hotkeys_config.Length
    }

    content := hotkeys_config[hotkeys_index]

    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize
    margin    := Gui_Config.Margin
    if ( GetWindowTheme() == "Dark" ) {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    } else if ( GetWindowTheme() == "Light" ) {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }

    if ( Arg.hotkeys_show == True )
        Try G.Destroy()

    G := Gui()
    G.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    G.MarginX   := margin
    G.MarginY   := margin
    G.BackColor := back_color
    G.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    GContent := G.Add("Text", "-Center -Border", content)
    GContent.GetPos(&cx, &cy, &cw, &ch)
    if (hotkeys_config.Length > 1) {
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
