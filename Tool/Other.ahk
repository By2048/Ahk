
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
WindowsTerminal(mode:="Focus", folder:="T:\\")
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
; keep_path | backup tmp
ScreenShot(screen_name:="screen1", keep_path:="backup")
{
    if (not FileExist(Snipaste.Exe)) {
        return
    }
    if (keep_path == "Backup") {
        if (not FileExist(Snipaste.Screenshot_Path_Backup)) {
            return
        }
    }
    if (keep_path == "Tmp") {
        if (not FileExist(Snipaste.Screenshot_Path_Tmp)) {
            return
        }
    }

    screen_id := ScreenNameToId(screen_name)
    if (screen_id == "1") {
        screen := Screens.Software.1
    } else if (screen_id == "2") {
        screen := Screens.Software.2
    } else if (screen_id == "3") {
        screen := Screens.Software.3
    }

    x := screen.x
    y := screen.y
    w := screen.w
    h := screen.h

    x := Round(x)
    y := Round(y)
    w := Round(w)
    h := Round(h)

    screenshot_keep_path := ""
    if (keep_path == "Backup") {
        screenshot_keep_path := Snipaste.Screenshot_Path_Backup
    } else if (keep_path == "Tmp") {
        screenshot_keep_path := Snipaste.Screenshot_Path_Tmp
    }

    if (not screenshot_keep_path) {
        return
    }

    screens_name := StrReplace(screen_name, "screen")
    name := "", file := "", cmd := ""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{1}[{2}]", name, screens_name)
    file := screenshot_keep_path . "\" . name . ".png"
    file := StrReplace(file, "\\", "\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste.Exe, x, y, w, h, file)
    Run %cmd%
}



; 软件设置界面截图保存
ScreenshotActivateSoftware(keep_path:="backup")
{
    if (not FileExist(Snipaste.Exe)) {
        return
    }
    if (keep_path = "Backup") {
        if (not FileExist(Snipaste.Screenshot_Path_Backup)) {
            return
        }
    }
    if (keep_path = "Tmp") {
        if (not FileExist(Snipaste.Screenshot_Path_Tmp)) {
            return
        }
    }

    screenshot_keep_path := ""
    if (keep_path = "Backup") {
        screenshot_keep_path := Snipaste.Screenshot_Path_Backup
    } else if (keep_path = "Tmp") {
        screenshot_keep_path := Snipaste.Screenshot_Path_Tmp
    }

    GetActiveWindowInfo()
    win_process_name := window.process_name
    win_x := window.x
    win_y := window.y
    win_w := window.w
    win_h := window.h

    name:="", file:="", cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("[{1}]{2}", win_process_name, name)
    file := screenshot_keep_path . "\" . name . ".png"
    file := StrReplace(file, "\\", "\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste.Exe, win_x, win_y, win_w, win_h, file)
    Run %cmd%
}



; 游戏截图
ScreenshotQuick()
{
    FormatTime, name, _, yyyy-MM-dd HH-mm-ss
    file := Snipaste.Screenshot_Path_Tmp "\" name ".png"
    cmd := Format("{1} snip --area {2} {3} {4} {5} -o ""{6}""", Snipaste.Exe, Screen.x, Screen.y, Screen.w, Screen.h, file)
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

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste.Exe, image, x, y)
    Run %cmd%
}



; 删除软件自动保存的文件
DeleteSnipasteAutoSaveFile()
{
    if (not FileExist(Snipaste.Auto_Save_File)) {
        return
    }
    last_file := ""
    Loop, Files, % Snipaste.Auto_Save_File
    {
        last_file := A_LoopFileFullPath
    }
    FileDelete %last_file%
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
    arg1 := args[1]
    arg2 := args[2]
    arg3 := args[3]

    if (not arg1 or not arg2) {
        return
    }

    arg1 := Trim(arg1)
    arg2 := Trim(arg2)
    arg3 := Trim(arg3)
    arg1 := RegExReplace(arg1, "\s+", " ")
    arg2 := RegExReplace(arg2, "\s+", " ")
    arg3 := RegExReplace(arg3, "\s+", " ")
    arg1 := StrSplit(arg1, " ")
    arg2 := StrSplit(arg2, " ")
    arg3 := StrSplit(arg3, " ")

    if (arg1.Length() != arg2.Length()) {
        return
    }
    length := arg1.Length()

    result := {}
    loop, % length {
        key   := arg1[A_Index] + 0
        value := arg2[A_Index] + 0
        result[key] := value
    }

    return result
}
