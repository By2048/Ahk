
#Include ..\Lib\File.ahk
#Include ..\Lib\Change.ahk
#Include ..\Tool\Window.ahk
#Include ..\Tool\Help.ahk



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

    Sleep 333
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

    Sleep 333
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
        x := Screens.1.x + (Screens.1.w - image_w) / 2
        y := Screens.1.y + (Screens.1.h - image_h) / 2
    }
    if ( screen_id == "2" ) {
        x := Screens.2.x + Screens.2.w/2 - image_w/2
        y := Screens.2.y + Screens.2.h/2 - image_h/2
    }
    x := Round(x)
    y := Round(y)

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste, image, x, y)
    Run cmd
}



; 文本转字典
GetColumnConfig(args*)
{
    GetCfg(cfg) {
        result := Map()
        if ( ! cfg )
            return result
        cfg := Trim(cfg)
        cfg := RegExReplace(cfg, "\s+", " ")
        cfg := StrSplit(cfg, " ")
        for item in cfg {
            item := StrSplit(item, ":")
            index := item[1] + 0
            name  := item[2]
            width := item[3] + 0
            result[index] := width
        }
        return result
    }

    GetINW(index, name, width) {
        result := Map()
        if ( ! index ) || ( ! width )
            return result
        index := Trim(index)
        width := Trim(width)
        name  := Trim(name )
        index := RegExReplace(index, "\s+", " ")
        width := RegExReplace(width, "\s+", " ")
        name  := RegExReplace(name,  "\s+", " ")
        index := StrSplit(index, " ")
        width := StrSplit(width, " ")
        name  := StrSplit(name,  " ")
        if ( index.Length != width.Length )
            return result
        loop index.Length {
            key   := index[A_Index] + 0
            value := width[A_Index] + 0
            result[key] := value
        }
        return result
    }

    result := Map()
    if ( args.Length == 1 ) {
        cfg := args[1]
        result := GetCfg(cfg)
    }

    if ( args.Length == 3 ) {
        index := args[1]
        name  := args[2]
        width := args[3]
        result := GetINW(index, name, width)
    }

    return result
}



; 获取需要移动的鼠标偏移量
; x 横向检测 | y 纵向检测
; step  每次检测移动的像素
; total 检测次数
GetOffset(direction:="X", step:=3, total:=10, cursor:="")
{
    Check() {
        if ( cursor ) && ( A_Cursor == cursor )
            return true
        if ( A_Cursor == "SizeWE" ) || ( A_Cursor == "SizeNS" )
            return true
        return false
    }

    offset := 0

    if ( ! direction )
        return offset

    if ( Check() )
        return offset

    MouseGetPos(&x_origin, &y_origin)
    xx := x_origin
    yy := y_origin
    offset := 0
    Loop total {
        move := step * A_Index
        if ( Mod(A_Index, 2) )
            move := 0 - move
        if ( direction == "x" || direction == "X" )
            xx := xx + move
        if ( direction == "y" || direction == "Y" )
            yy := yy + move
        MouseMove(xx, yy, 0)
        if ( Check() ) {
            offset := move / 2
            break
        }
    }
    MouseMove(x_origin, y_origin)
    return offset
}
