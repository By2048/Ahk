
#Include %A_WorkingDir%\Config\All.ahk
#Include %A_WorkingDir%\Tool\File.ahk
#Include %A_WorkingDir%\Tool\Windows.ahk
#Include %A_WorkingDir%\Tool\Change.ahk
#Include %A_WorkingDir%\Tool\Help.ahk



RunNormalUser(command)
{
    if InStr(command,".lnk") {
        command := Format("C:\Windows\Explorer.exe {}", command) 
    }

    if (A_UserName="Administrator") {
        Run %command%
        return
    }

    if (StrLen(PC_USERNAME)=0 and StrLen(PC_PASSWORD)=0) {
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
ScreenShot(screens="screen1", keep_path="backup")
{
    if (not FileExist(Snipaste_EXE)) {
        return
    }
    if (keep_path="backup") {
        if (not FileExist(Snipaste_Screenshot_Path_Backup)) {
            return
        }
    }
    if (keep_path="tmp") {
        if (not FileExist(Snipaste_Screenshot_Path_Tmp)) {
            return
        }
    }

    if (screens=="screen1") {
        x := GlobalValueGet("Screen1.Dpi.Software", "x")
        y := GlobalValueGet("Screen1.Dpi.Software", "y")
        w := GlobalValueGet("Screen1.Dpi.Software", "w")
        h := GlobalValueGet("Screen1.Dpi.Software", "h")
    } else if (screens=="screen2") {    
        x := GlobalValueGet("Screen2.Dpi.Software", "x")
        y := GlobalValueGet("Screen2.Dpi.Software", "y")
        w := GlobalValueGet("Screen2.Dpi.Software", "w")
        h := GlobalValueGet("Screen2.Dpi.Software", "h")
    } else if (screens=="screen3") {
        x := GlobalValueGet("Screen3.Dpi.Software", "x")
        y := GlobalValueGet("Screen3.Dpi.Software", "y")
        w := GlobalValueGet("Screen3.Dpi.Software", "w")
        h := GlobalValueGet("Screen3.Dpi.Software", "h")
    }

    x := Round(x)
    y := Round(y)
    w := Round(w)
    h := Round(h)

    screenshot_keep_path := ""
    if (keep_path="backup") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Backup
    } else if (keep_path="tmp") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Tmp
    }

    if (not screenshot_keep_path) {
        return
    }

    screens_name:=StrReplace(screens,"screen")
    name:="", file:="", cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{1}[{2}]",name,screens_name)
    file := screenshot_keep_path "\" name ".png"
    file := StrReplace(file,"\\","\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, x, y, w, h, file)
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



; 软件设置界面截图保存
ScreenshotActivateSoftware()
{
    if (not FileExist(Snipaste_EXE)) {
        return
    }

    result := GetActiveWindowsInfo()
    win_process_name := result.win_process_name
    win_x := result.win_x
    win_y := result.win_y
    win_w := result.win_w
    win_h := result.win_h

    name:="", file:="", cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{2}[{1}]",win_process_name,name)
    file := Snipaste_Screenshot_Path_Backup "\" name ".png"
    file := StrReplace(file,"\\","\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, win_x, win_y, win_w, win_h, file)
    Run %cmd%

    ; 修复文件名大小写问题
    Sleep, 1000
    file_lower := Format("{:L}",file)
    FileMove, %file_lower%, %file%
}



; 屏幕贴图
Snipaste(image="",screens="screen1")
{
    image_size := GetImageSize(image)
    image_w    := image_size["w"]
    image_h    := image_size["h"]

    if (screens="screen1" or screens="Screen1") {
        x := Screen1.x + Screen1.w/2 - image_w/2
        y := Screen1.y + Screen1.h/2 - image_h/2
    }
    if (screens="screen2" or screens="Screen2") {
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
