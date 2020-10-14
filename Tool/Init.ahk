#SingleInstance Force


if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}


CheckEnv()
{
    txt=ScreenCount=%screen_count%
    Progress, m2 b fs18 zh0, %txt%`n`nStart Success, , , Courier New
    Sleep, 500
    Progress, Off
}

