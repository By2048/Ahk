
#include %A_WorkingDir%\Config.ahk
#include %A_WorkingDir%\Private.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\Help.ahk



RunNormalUser(command)
{
    if (not PC_USER or not PC_PWD) {
        HelpText(" PC_USER/PC_PWD - (./Tool/Private.ahk) ",  ,  ,3000)
    } else {
        RunAs, %PC_USER%, %PC_PWD%
        Run, %command%
        RunAs
    }
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

    screens_name:=StrReplace(screens,"screen")
    name:="" ,file:="" ,cmd:=""
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss][%screens_name%]
    file := Snipaste_Screenshot_Path "\" name ".png"
    file := StrReplace(file,"\\","\")
    cmd  := Format("{1} snip --area {2} {3} {4} {5} -o {6}", Snipaste_EXE, x, y, w, h, file)
    Run %cmd%

    SetTimer, delete_snipaste_auto_save_file, -1000
}



delete_snipaste_auto_save_file()
{
    last_file := ""
    Loop, Files, %Snipaste_Auto_Save_File%
    {
        last_file := A_LoopFileFullPath
    }
    FileDelete %last_file%
}



show_pos()
{
    MouseGetPos, xpos, ypos 
    data := xpos "|" ypos
    HelpText(data,"center", ,3000)
}
