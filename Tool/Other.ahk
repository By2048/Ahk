
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Window.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



; 运行模式设置
RunNormalUser(command)
{
    if ( InStr(command, ".lnk") ) {
        command := Format("C:\Windows\Explorer.exe {}", command)
    }
    if (A_UserName = "Administrator") {
        Run %command%
        return
    }
    if (StrLen(PC_USERNAME) == 0 and StrLen(PC_PASSWORD) == 0) {
        HelpText(" PC_USERNAME/PC_PASSWORD - (./Private.ahk) ", "center_down",  , 3000)
    } else {
        RunAs, %PC_USERNAME%, %PC_PASSWORD%
        Run, %command%
        RunAs
    }
}



; Windows终端启动设置
WindowsTerminal(mode:="Focus", folder:="")
{
    name := "Terminal"
    exe  := ProcessNameOrigin(name)
    if ( WinActive("ahk_exe" exe) ) {
        WinClose, A
        Return
    }
    args := " "
    if (mode == "Full") {
        args := "--fullscreen"
    } else if (mode == "Focus") {
        args := "--focus"
    }
    args := args . " -d " . folder
    Run, %WT% %args%
    WinWait, ahk_exe %exe%
    WinActivate, ahk_exe %exe%
}



; 屏幕截图
; screens   | screen1 screen2 screen3
; keep_path | T:\  F:\Image\Screen\
ScreenShot(screen_name:="Screen1", keep_path:="")
{
    if (not FileExist(Snipaste)) {
        HelpText(Snipaste, "Center", "Screen1", 500)
    }
    if (not FileExist(keep_path)) {
        return
    }

    screen_id := ScreenNameToId(screen_name)
    if (screen_id == "1") {
        screen_config := Screens.Software.1
    } else if (screen_id == "2") {
        screen_config := Screens.Software.2
    } else if (screen_id == "3") {
        screen_config := Screens.Software.3
    }
    x := screen_config.x
    y := screen_config.y
    w := screen_config.w
    h := screen_config.h
    x := Round(x)
    y := Round(y)
    w := Round(w)
    h := Round(h)

    name := "", file := "", cmd := ""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{1}[{2}]", name, screen_id)
    file := keep_path . name . ".png"
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste, x, y, w, h, file)
    Run %cmd%
}



; 软件设置界面截图保存
ScreenshotActivateSoftware(keep_path:="")
{
    if (not FileExist(Snipaste)) {
        return
    }
    if (not FileExist(keep_path)) {
        return
    }

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    name := "", file := "", cmd := ""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{1}[{2}]", name, win_process_name)
    file := keep_path . name . ".png"
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste, win_x, win_y, win_w, win_h, file)
    Run %cmd%
}



; 屏幕贴图
Snipaste(image:="", screen:="screen1")
{
    image_size := GetImageSize(image)
    image_w    := image_size["w"]
    image_h    := image_size["h"]

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
    Run %cmd%
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

    if ( Abs(color_base_red - color_compare_red)<=offse) {
        if ( Abs(color_base_green - color_compare_green)<=offse ) {
            if ( Abs(color_base_blue - color_compare_blue)<=offse ) {
                return true
            }
        }
    }

    return False
}



; 发送字符串 忽略输入法
SendData(data)
{
    WinGet, win_id, ID, A
    ControlGetFocus, control_name, ahk_id %win_id%
    if (control_name != "")
    {
        ControlGet, control_id, Hwnd,  , %control_name%, ahk_id %win_id%
    }
    Loop, Parse, data
    {
		PostMessage, Message.WM_CHAR, Ord(A_LoopField), 1,  , ahk_id %win_id%
    }
}



; 文本转字典
GetColumnConfig(args*)
{
    arg_index := args[1]
    arg_name  := args[2]
    arg_width := args[3]

    if (not arg_index or not arg_width) {
        return
    }

    arg_index := Trim(arg_index)
    arg_width := Trim(arg_width)
    arg_name  := Trim(arg_name)
    arg_index := RegExReplace(arg_index, "\s+", " ")
    arg_width := RegExReplace(arg_width, "\s+", " ")
    arg_name  := RegExReplace(arg_name, "\s+", " ")
    arg_index := StrSplit(arg_index, " ")
    arg_width := StrSplit(arg_width, " ")
    arg_name  := StrSplit(arg_name, " ")

    if (arg_index.Length() != arg_width.Length()) {
        return
    }

    result := {}
    length := arg_index.Length()
    loop, % length {
        key   := arg_index[A_Index] + 0
        value := arg_width[A_Index] + 0
        result[key] := value
    }

    return result
}



; 从代码注释中读取配置
ReadConfig(file, slice, replace:="    `; ")
{
    data  := ""
    start := slice[1]
    stop  := slice[2]
    Loop, Read, %file%
    {
        line := StrReplace(A_LoopReadLine, replace, "")
        if (A_Index >= start and A_Index <= stop) {
            if (A_Index != stop) {
                data := data . line . "`n"
            } else {
                data := data . line
            }
        }
    }
    return data
}
