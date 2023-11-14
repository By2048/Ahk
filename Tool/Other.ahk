
#Include *i ..\Config\All.ahk
#Include *i ..\Tool\File.ahk
#Include *i ..\Tool\Window.ahk
#Include *i ..\Tool\Change.ahk
#Include *i ..\Tool\Help.ahk



; 运行模式设置
RunNormalUser(command)
{
    if ( InStr(command, ".lnk") ) {
        command := Format("C:\Windows\Explorer.exe {}", command)
    }
    if (A_UserName = "Administrator") {
        Run command
        return
    }
    if (StrLen(PC_USERNAME) == 0 and StrLen(PC_PASSWORD) == 0) {
        HelpText(" PC_USERNAME/PC_PASSWORD - (./Private.ahk) ", "center_down",  , 3000)
    } else {
        RunAs PC_USERNAME, PC_PASSWORD
        Run command
        RunAs
    }
}



; Windows终端启动设置
WindowsTerminal(mode:="Focus", folder:="")
{
    if (mode == "Full") {
        mode := "--fullscreen"
    } else if (mode == "Focus") {
        mode := "--focus"
    }
    exe := "WindowsTerminal.exe"
    rule := "ahk_exe WindowsTerminal.exe ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
    title := "Administrator: PowerShell"
    Run Format("{} {} -d {}", WT, mode, folder)
    Sleep 300
    try {
        WinActivate AEXE(exe)
    }
}



; 屏幕截图
ScreenShot(path:="", slient:=True)
{
    if ( !slient and !FileExist(path) ) {
        HelpText("`n Snipaste Error `n", "Center", "Screen", 500)
        return
    }
    if ( !slient and !FileExist(path) ) {
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
}



; 软件设置界面截图保存
SoftwareShot(path:="", slient:=True)
{
    if ( !slient and !FileExist(path) ) {
        HelpText("`n Snipaste Error `n", "Center", "Screen", 500)
        return
    }
    if ( !slient and !FileExist(path) ) {
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
}



; 屏幕贴图
SnipasteImage(image:="", screen:="Screen")
{
    image_size := GetImageSize(image)
    image_w    := image_size.w
    image_h    := image_size.h

    screen_id := ScreenNameToId(screen)

    if (screen_id == "1") {
        x := Screens.1.x + (Screens.1.w - image_w) / 2
        y := Screens.1.y + (Screens.1.h - image_h) / 2
    }
    if (screen_id == "2") {
        x := Screens.2.x + Screens.2.w/2 - image_w/2
        y := Screens.2.y + Screens.2.h/2 - image_h/2
    }
    x := Round(x)
    y := Round(y)

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste, image, x, y)
    Run cmd
}



; 比较颜色区别
; F0F0F0 | 60ABF0
CheckColor(color_base, color_compare, offse:=9)
{
    color_base_red   := SubStr(color_base, 1, 2)
    color_base_green := SubStr(color_base, 3, 2)
    color_base_blue  := SubStr(color_base, 5, 2)
    color_base_red   := ToBase("0x" . color_base_red,   10)
    color_base_green := ToBase("0x" . color_base_green, 10)
    color_base_blue  := ToBase("0x" . color_base_blue,  10)

    color_compare_red   := SubStr(color_compare, 1, 2)
    color_compare_green := SubStr(color_compare, 3, 2)
    color_compare_blue  := SubStr(color_compare, 5, 2)
    color_compare_red   := ToBase("0x" . color_compare_red,   10)
    color_compare_green := ToBase("0x" . color_compare_green, 10)
    color_compare_blue  := ToBase("0x" . color_compare_blue,  10)

    if ( Abs(color_base_red - color_compare_red) <= offse) {
        if ( Abs(color_base_green - color_compare_green) <= offse ) {
            if ( Abs(color_base_blue - color_compare_blue) <= offse ) {
                return True
            }
        }
    }

    return False
}



; 发送字符串 忽略输入法
SendData(data)
{
    ; win_id := WinGetID("A")
    ; ControlGetFocus, control_name, ahk_id %win_id%
    ; if (control_name != "")
    ; {
    ;     ControlGet, control_id, Hwnd,  , %control_name%, ahk_id %win_id%
    ; }
    ; Loop, Parse, data
    ; {
	; 	PostMessage, Message.WM_CHAR, Ord(A_LoopField), 1,  , ahk_id %win_id%
    ; }
}



; 文本转字典
GetColumnConfig(args*)
{
    GetCfg(cfg) {
        result := Map()
        if not cfg
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
        if not index or not width
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
        if index.Length != width.Length
            return result
        loop index.Length {
            key   := index[A_Index] + 0
            value := width[A_Index] + 0
            result[key] := value
        }
        return result
    }

    result := Map()
    if args.Length == 1 {
        cfg := args[1]
        result := GetCfg(cfg)
    }

    if args.Length == 3 {
        index := args[1]
        name  := args[2]
        width := args[3]
        result := GetINW(index, name, width)
    }

    return result
}



; 从代码注释中读取配置
ReadConfig(path, slice, replace:="`; ")
{
    data  := ""
    start := slice[1]
    stop  := slice[2]
    Loop Read , path
    {
        line := StrReplace(A_LoopReadLine, replace, "")
        if (A_Index >= start and A_Index <= stop) {
            if A_Index != stop
                data := data . line . "`n"
            else
                data := data . line
        }
    }
    return data
}



; 获取需要移动的鼠标偏移量
; x 横向检测 | y 纵向检测
; step  每次检测移动的像素
; total 检测次数
GetOffset(direction:="X", step:=3, total:=10, cursor:="")
{
    Check() {
        if cursor and A_Cursor == cursor
            return true
        if A_Cursor == "SizeWE" or A_Cursor == "SizeNS"
            return true
        return false
    }

    offset := 0

    if not direction
        return offset

    if Check()
        return offset

    MouseGetPos &x_origin, &y_origin
    xx := x_origin
    yy := y_origin
    offset := 0
    Loop total {
        move := step * A_Index
        if Mod(A_Index, 2)
            move := 0 - move
        if direction == "x" or direction == "X"
            xx := xx + move
        if direction == "y" or direction == "Y"
            yy := yy + move
        MouseMove xx, yy, 0
        if Check() {
            offset := move / 2
            break
        }
    }
    MouseMove x_origin, y_origin
    return offset
}
