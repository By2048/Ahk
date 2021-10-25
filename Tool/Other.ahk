
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\File.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\Help.ahk



RunNormalUser(command)
{
    if InStr(command,".lnk") {
        command := Format("C:\Windows\Explorer.exe {}", command) 
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
Screenshot(screens="screen1",keep_path="backup")
{
    if (not FileExist(Snipaste_EXE)) {
        Return
    }
    if (keep_path="backup") {
        if (not FileExist(Snipaste_Screenshot_Path_Backup)) {
            Return
        }
    }
    if (keep_path="tmp") {
        if (not FileExist(Snipaste_Screenshot_Path_Tmp)) {
            Return
        }
    }

    if (screens="screen1") {
        x:=screen_1_x
        y:=screen_1_y
        w:=screen_1_w
        h:=screen_1_h
    } else if (screens="screen2") {
        x:=screen_2_x/screen_1_dpi
        y:=screen_2_y/screen_1_dpi
        w:=screen_2_w*screen_2_dpi/screen_1_dpi
        h:=screen_2_h*screen_2_dpi/screen_1_dpi
    } else if (screens="screen3") {
        x:=screen_3_x/screen_1_dpi
        y:=screen_3_y/screen_1_dpi
        w:=screen_3_w*screen_3_dpi/screen_1_dpi
        h:=screen_3_h*screen_3_dpi/screen_1_dpi
    }

    x:=Round(x)
    y:=Round(y)
    w:=Round(w)
    h:=Round(h)

    screenshot_keep_path := ""
    if (keep_path="backup") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Backup
    } else if (keep_path="tmp") {
        screenshot_keep_path := Snipaste_Screenshot_Path_Tmp
    }

    if (not screenshot_keep_path) {
        Return
    }

    screens_name:=StrReplace(screens,"screen")
    name:="", file:="", cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    name := Format("{1}[{2}]",name,screens_name)
    file := screenshot_keep_path "\" name ".png"
    file := StrReplace(file,"\\","\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, x, y, w, h, file)
    Run %cmd%

    SetTimer, delete_snipaste_auto_save_file, -1000
}



; 游戏截图
Screenshot_Quick()
{
    FormatTime, name, _, yyyy-MM-dd HH-mm-ss
    file := Snipaste_Screenshot_Path_Tmp "\" name ".png"
    cmd := Format("{1} snip --area {2} {3} {4} {5} -o ""{6}""", Snipaste_EXE, screen_1_x, screen_1_y, screen_1_w, screen_1_h, file)
    Run %cmd%
    SetTimer, delete_snipaste_auto_save_file, -1000
}



; 软件设置界面截图保存
Screenshot_Activate_Software()
{
    if (not FileExist(Snipaste_EXE)) {
        Return
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

    SetTimer, delete_snipaste_auto_save_file, -1000
    
    ; 修复文件名大小写问题
    Sleep, 1000
    file_lower := Format("{:L}",file)
    FileMove, %file_lower%, %file%
}



; 屏幕贴图
Snipaste(image="",screens="screen1")
{
    image_size := GetImageSize(image)
    image_w    := image_size[1]
    image_h    := image_size[2]

    if (screens="screen1" or screens="screen_1") {
        x := screen_1_x + screen_1_w/2 - image_w/2
        y := screen_1_y + screen_1_h/2 - image_h/2
    }
    if (screens="screen2" or screens="screen_2") {
        x := screen_2_x + screen_2_w/2 - image_w/2
        y := screen_2_y + screen_2_h/2 - image_h/2
    }
    x := Round(x)
    y := Round(y)

    cmd := Format("{1} paste --files {} --pos {} {}", Snipaste_EXE, image, x, y)
    Run %cmd%
}



; 删除软件自动保存的文件
delete_snipaste_auto_save_file()
{
    if (not FileExist(Snipaste_Auto_Save_File)) {
        Return
    }
    last_file := ""
    Loop, Files, %Snipaste_Auto_Save_File%
    {
        last_file := A_LoopFileFullPath
    }
    FileDelete %last_file%
}
