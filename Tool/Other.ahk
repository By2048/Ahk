#include %A_WorkingDir%\Tool\Screen.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Other\Private.ahk



RunNormalUser(command)
{
    if (not PC_USER or not PC_PWD) {
        HelpText(" PC_USER/PC_PWD -> (Other/Private.ahk) ", , ,3000)
    }
    RunAs, %PC_USER%, %PC_PWD%
    Run %command%
    RunAs
}



Screenshot(screens="screen1")
{
    if (screens="screen1") {
        x:=screen_1_x
        y:=screen_1_y
        w:=screen_1_w
        h:=screen_1_h
    } else if (screens="screen2") {
        x:=screen_2_x/screen_1_zoom
        y:=screen_2_y/screen_1_zoom
        w:=screen_2_w*screen_2_zoom/screen_1_zoom
        h:=screen_2_h*screen_2_zoom/screen_1_zoom
    } else if (screens="screen3") {
        x:=screen_3_x/screen_1_zoom
        y:=screen_3_y/screen_1_zoom
        w:=screen_3_w*screen_3_zoom/screen_1_zoom
        h:=screen_3_h*screen_3_zoom/screen_1_zoom
    }

    x:=Round(x)
    y:=Round(y)
    w:=Round(w)
    h:=Round(h)

    snipaste:="D:\Snipaste\Snipaste.exe"
    path:="R:\Screens"
    screens_name:=StrReplace(screens,"screen")
    name:=""
    file:=""
    cmd:=""

    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss][%screens_name%]
    file=%path%\%name%.png
    cmd=%snipaste% snip --area %x% %y% %w% %h% -o %file%
    Run %cmd%

    SetTimer, delete_last_file, -1000
}



delete_last_file()
{
    default_folder := "E:\Snipaste\"
    default_folder := default_folder . "*.png"
    last_file:=""
    Loop, Files, %default_folder% 
    {
        last_file:=A_LoopFileFullPath
    }
    FileDelete %last_file%
}



show_pos()
{
    MouseGetPos, xpos, ypos 
    data := xpos "|" ypos
    HelpText(data,"center", ,3000)
}



; 显示激活的窗口名
global current_activate_progress_name:=""
ShowActivateProcessName()
{
    WinGet, name, ProcessName, A
    name:=RTrim(name,"exe")
    name:=RTrim(name,"EXE")
    name:=RTrim(name,".")
    if (name="Code") {
        name:="VSCode"
    } else if (name:="chrome") {
        name:="Chrome"
    }
    global current_activate_progress_name
    if (name!=current_activate_progress_name) {
        current_activate_progress_name:=name
        HelpText(name,"center","screen3")
    }
}
