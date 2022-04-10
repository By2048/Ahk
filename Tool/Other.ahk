
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



RunNormalUser(command)
{
    if InStr(command, ".lnk") {
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



; 屏幕截图
; screens   | screen1 screen2 screen3
; keep_path | backup tmp
ScreenShot(screen_name:="screen1", keep_path:="backup")
{
    if (not FileExist(Snipaste_EXE)) {
        return
    }
    if (keep_path == "Backup") {
        if (not FileExist(Snipaste_Screenshot_Path_Backup)) {
            return
        }
    }
    if (keep_path == "Tmp") {
        if (not FileExist(Snipaste_Screenshot_Path_Tmp)) {
            return
        }
    }

    screen_name := ChangeScreenName(screen_name)
    if (screen_name == "screen1") {
        x := Screens_Software.1.x
        y := Screens_Software.1.y
        w := Screens_Software.1.w
        h := Screens_Software.1.h
    } else if (screen_name == "screen2") {    
        x := Screens_Software.2.x
        y := Screens_Software.2.y
        w := Screens_Software.2.w
        h := Screens_Software.2.h
    } else if (screen_name == "screen3") {
        x := Screens_Software.3.x
        y := Screens_Software.3.y
        w := Screens_Software.3.w
        h := Screens_Software.3.h
    }

    x := Round(x)
    y := Round(y)
    w := Round(w)
    h := Round(h)

    screenshot_keep_path := ""
    if (keep_path == "Backup") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Backup
    } else if (keep_path == "Tmp") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Tmp
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
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, x, y, w, h, file)
    Run %cmd%
}



; 软件设置界面截图保存
ScreenshotActivateSoftware(keep_path:="backup")
{
    if (not FileExist(Snipaste_EXE)) {
        return
    }
    if (keep_path = "Backup") {
        if (not FileExist(Snipaste_Screenshot_Path_Backup)) {
            return
        }
    }
    if (keep_path = "Tmp") {
        if (not FileExist(Snipaste_Screenshot_Path_Tmp)) {
            return
        }
    }

    screenshot_keep_path := ""
    if (keep_path = "Backup") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Backup
    } else if (keep_path = "Tmp") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Tmp
    }

    result := GetActiveWindowsInfo()
    win_process_name := result.win_process_name
    win_x := result.win_x
    win_y := result.win_y
    win_w := result.win_w
    win_h := result.win_h

    name:="", file:="", cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("[{1}]{2}", win_process_name, name)
    file := screenshot_keep_path . "\" . name . ".png"
    file := StrReplace(file, "\\", "\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, win_x, win_y, win_w, win_h, file)
    Run %cmd%

    
}



; 游戏截图
ScreenshotQuick()
{
    FormatTime, name, _, yyyy-MM-dd HH-mm-ss
    file := Snipaste_Screenshot_Path_Tmp "\" name ".png"
    cmd := Format("{1} snip --area {2} {3} {4} {5} -o ""{6}""", Snipaste_EXE, Screen1.x, Screen1.y, Screen1.w, Screen1.h, file)
    Run %cmd%
}



; 屏幕贴图
Snipaste(image:="", screens:="screen1")
{
    image_size := GetImageSize(image)
    image_w    := image_size["w"]
    image_h    := image_size["h"]

    if (screens=="screen1" or screens=="Screen1") {
        x := Screen1.x + Screen1.w/2 - image_w/2
        y := Screen1.y + Screen1.h/2 - image_h/2
    }
    if (screens=="screen2" or screens=="Screen2") {
        x := Screen2.x + Screen2.w/2 - image_w/2
        y := Screen2.y + Screen2.h/2 - image_h/2
    }
    x := Round(x)
    y := Round(y)

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste_EXE, image, x, y)
    Run %cmd%
}



; 删除软件自动保存的文件
DeleteSnipasteAutoSaveFile()
{
    if (not FileExist(Snipaste_Auto_Save_File)) {
        return
    }
    last_file := ""
    Loop, Files, %Snipaste_Auto_Save_File%
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