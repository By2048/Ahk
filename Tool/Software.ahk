
; Windows终端启动设置
WindowsTerminal(mode:="Focus", folder:="")
{
    if ( mode == "Full" )
        mode := "--fullscreen"
    else if ( mode == "Focus" )
        mode := "--focus"
    exe := "WindowsTerminal.exe"
    rule := "ahk_exe WindowsTerminal.exe ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    title := "Administrator: PowerShell"
    Run Format("{} {} -d {}", WT, mode, folder)
    Sleep 300
    Try WinActivate(AEXE(exe))
}


; 屏幕截图
ScreenShotFull(path:="", slient:=True)
{
    if ( ! slient ) && ( ! FileExist(path) ) {
        HelpText("`n Snipaste Error `n", "Center", "Screen", 500)
        return
    }
    if ( ! slient ) && ( ! FileExist(path) ) {
        HelpText("`n Keep Path Error `n", "Center", "Screen", 500)
        return
    }

    x := 0
    y := 0
    w := A_ScreenWidth
    h := A_ScreenHeight
    path := path . FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss") . ".png"
    cmd  := Format("{} snip --area {} {} {} {} -o {}", Snipaste, x, y, w, h, path)
    Run cmd

    Sleep 500
    HelpText("`n ScreenShot Full `n", "Center", "Screen", 666)
}


; 软件设置界面截图保存
ScreenShotSoftware(path:="", slient:=True)
{
    if ( ! slient ) && ( ! FileExist(Snipaste) ) {
        HelpText("`n Snipaste Error `n", "Center", "Screen", 500)
        return
    }
    if ( ! slient ) && ( ! FileExist(path) ) {
        HelpText("`n Keep Path Error `n", "Center", "Screen", 500)
        return
    }

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    name := FormatTime(A_Now, "[yyyy-MM-dd][HH-mm-ss]")
    name := Format("{1}[{2}]", name, win_process_name)
    path := path . name . ".png"
    cmd  := Format("{} snip --area {} {} {} {} -o {}", Snipaste, win_x, win_y, win_w, win_h, path)
    Run cmd

    Sleep 500
    HelpText("`n ScreenShot Software `n", "Center", "Screen", 666)
}


; 屏幕贴图
SnipasteImage(image:="", screen:="Screen")
{
    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h

    screen_id := ScreenNameToId(screen)

    if ( screen_id == "1" ) {
        x := Screen1.x + (Screen1.w - image_w) / 2
        y := Screen1.y + (Screen1.h - image_h) / 2
    }
    if ( screen_id == "2" ) {
        x := Screen2.x + Screen2.w/2 - image_w/2
        y := Screen2.y + Screen2.h/2 - image_h/2
    }
    x := Round(x)
    y := Round(y)

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste, image, x, y)
    Run cmd
}


VSCodeWorkSpace(path:="", profile:="Default")
{
    command := PSLMini " " VSCode

    if ( profile == "" )
        profile := "默认"
    if ( profile == "Default" )
        profile := "#" profile
    if ( profile == "Temp" )
        profile := "#" profile

    command .= " --profile " profile " "

    if ( path ) {
        if ( InStr(path, ":\") ) {
            command .= path
        } else {
            workspace := "A:\Config\VSCode\" path ".code-workspace"
            if ( FileExist(workspace) )
                command .= workspace
        }
    }

    Run command, Folders.Temp, "Hide"
}
