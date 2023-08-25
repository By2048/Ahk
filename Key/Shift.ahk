
>+`;::Send ":"
>+'::Send "`""


cnt := 0
$RShift::{
    global cnt
    if (cnt > 0) {
        cnt += 1
        return
    } else {
        cnt := 1
    }
    SetTimer ShiftTimer, -333
}
ShiftTimer() {
    global cnt
    if (cnt == 1) {
        HelpText()
        HideKeysHelp()
        HideInitConfig()
    } else if (cnt == 2) {
        HelpText()
        ShowKeysHelp()
    } else if (cnt == 3) {
        GetInitConfig()
        ShowInitConfig()
    }
    cnt := 0
}



hotkeys_current     := []    ; 当前显示的信息
hotkeys_index       := 0     ; 显示的序号
hotkeys_show_status := False



ShowKeysHelp(step := 0)
{
    global window
    global hotkeys_current, hotkeys_index
    global hotkeys_show_status
    global Software_Keys_Help

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_title        := window.title
    hotkeys_current  := GetWindowConfig(window, Software_Keys_Help)

    if hotkeys_current.Length == 1 and hotkeys_show_status == True
        return

    if (hotkeys_current.Length == 0 and hotkeys_show_status == False) {
        hotkeys_current := Software_Keys_Help["Default"]
        HelpText("`n No Content `n", "Center", "Screen", 500)
        return
    }

    if (hotkeys_current.Length and not step) {
        hotkeys_index := 1
    } else if (step) {
        hotkeys_index := hotkeys_index + step
        if (hotkeys_index > hotkeys_current.Length) {
            hotkeys_index := 1
        } else if (hotkeys_index <=0) {
            hotkeys_index := hotkeys_current.Length
        }
    }

    content := hotkeys_current[hotkeys_index]
    margin  := Gui_Config.Margin

    global GKH
    if (hotkeys_show_status) {
        try {
            GKH.Destroy()
        }
    }
    GKH := Gui()

    font_name := Gui_Config.FontName
    font_size := Gui_Config.FontSize

    if (GetWindowTheme() == "Dark") {
        font_color := Gui_Config.Dark.Font
        back_color := Gui_Config.Dark.Back
    }
    if (GetWindowTheme() == "Light") {
        font_color := Gui_Config.Light.Font
        back_color := Gui_Config.Light.Back
    }

    GKH.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption +Border")
    GKH.MarginX   := margin
    GKH.MarginY   := margin
    GKH.BackColor := back_color
    GKH.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    GContent := GKH.Add("Text", "-Center -Border", content)
    GContent.GetPos(&cx, &cy, &cw, &ch)
    if (hotkeys_current.Length > 1) {
        data  := Format("{}/{}", hotkeys_index, hotkeys_current.Length)
        GPage := GKH.Add("Text", "-Border xm ym", data)
        GPage.GetPos(&px, &py, &pw, &ph)
        GPage.Move(cw - pw + margin, ch - ph + margin, pw, ph)
    }
    GKH.Show("NA Center")
    hotkeys_show_status := True
}



HideKeysHelp()
{
    global GKH
    global hotkeys_show_status
    Try GKH.Destroy()
    hotkeys_show_status := False
}



SnipasteHelp()
{
    global GKH
    global hotkeys_current, hotkeys_index
    content := hotkeys_current[hotkeys_index]
    HideKeysHelp()
    tmp := A_Clipboard
    A_Clipboard := content
    ClipWait
    cmd := Format("{1} paste --clipboard", Snipaste)
    Run cmd
    Sleep 333
    A_Clipboard := tmp
    ClipWait
}



#HotIf ( hotkeys_show_status == True )
    [::ShowKeysHelp(-1)
    ]::ShowKeysHelp(+1)
    \::SnipasteHelp()
#HotIf
