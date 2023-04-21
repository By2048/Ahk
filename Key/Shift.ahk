
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

    if (hotkeys_current.Length == 1 and hotkeys_show_status == True) {
        return
    }
    if (hotkeys_current.Length == 0 and hotkeys_show_status == False) {
        HelpText("`n No Content `n", "Center", "Screen", 300)
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
    margin  := Software_Keys_Gui.Margin

    global GKH
    if (hotkeys_show_status) {
        try {
            GKH.Destroy()
        }
    }
    GKH := Gui()

    global Software_Keys_Gui
    font_name := Software_Keys_Gui.Name
    font_size := Software_Keys_Gui.Size
    path  := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
    key   := "AppsUseLightTheme"
    theme := RegRead(path, key, "")
    if (theme == "0") {
        font_color := Software_Keys_Gui.Light.Font
        back_color := Software_Keys_Gui.Light.Back
    } else if (theme == "1") {
        font_color := Software_Keys_Gui.Dark.Font
        back_color := Software_Keys_Gui.Dark.Back
    }

    GKH.Opt("+DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
    GKH.MarginX := margin
    GKH.MarginY := margin
    GKH.BackColor := back_color
    GKH.SetFont(Format("c{} s{}", font_color, font_size), font_name)
    GContent := GKH.Add("Text", "-Center -Border", content)
    GContent.GetPos(&x, &y , &w, &h)
    if (hotkeys_current.Length > 1) {
        rule := Format("+Center +Border w{}", w)
        data := Format("{} / {}", hotkeys_index, hotkeys_current.Length)
        GKH.Add("Text", rule, data)
    }
    GKH.Show("NA Center")
    hotkeys_show_status := True
}

HideKeysHelp()
{
    global GKH
    global hotkeys_show_status
    try {
        GKH.Destroy()
    }
    hotkeys_show_status := False
}


#HotIf ( hotkeys_show_status == True )
    [::ShowKeysHelp(-1)
    ]::ShowKeysHelp( 1)
#HotIf
