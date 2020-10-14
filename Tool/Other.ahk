#include %A_WorkingDir%\Other\Private.ahk
#include %A_WorkingDir%\Libs\Gdip_All.ahk
#include %A_WorkingDir%\Tool\Help.ahk

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
    MsgBox, %PC_USER% \ %PC_PWD%
    if (not PC_USER or not PC_PWD) {
        HelpText(" PC_USER/PC_PWD -> (Other/Private.ahk) ")
    }
    RunAs, %PC_USER%, %PC_PWD%
    Run %command%
    RunAs
}