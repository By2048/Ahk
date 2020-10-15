#include %A_WorkingDir%\Libs\Gdip_All.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Other\Private.ahk

#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



GetImageSize(image)
{
    GDIPToken:=Gdip_Startup()
    pBM:=Gdip_CreateBitmapFromFile(image)
    W:=Gdip_GetImageWidth(pBM)
    H:=Gdip_GetImageHeight(pBM)   
    Gdip_DisposeImage(pBM)
    Gdip_Shutdown(GDIPToken)
    data:=[W,H]
    Return data
}



RunNormalUser(command)
{
    if (not PC_USER or not PC_PWD) {
        HelpText(" PC_USER/PC_PWD -> (Other/Private.ahk) ")
        Sleep, 3000
        HelpText()
    }
    RunAs, %PC_USER%, %PC_PWD%
    Run %command%
    RunAs
}



Screenshot()
{
    snipaste=D:\Snipaste\Snipaste.exe
    path=R:\Screens
    FormatTime, name,  , [yyyy-MM-dd][HH-mm-ss]
    file=%path%\%name%.png
    x:=0
    y:=0
    w:=A_ScreenWidth
    h:=A_ScreenHeight
    cmd=%snipaste% snip --area %x% %y% %w% %h% -o %file%
    Run %cmd%
}


