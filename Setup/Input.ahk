
#NoTrayIcon
#SingleInstance Force
#HotString EndChars `t`n`s


:o:\Date::{
    SendInput( FormatTime(A_Now, "yyyy-MM-dd") )
}

:o:\Time::{
    SendInput( FormatTime(A_Now, "HH-mm-ss") )
}

:o:\DateTime::{
    SendInput( FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss") )
}

:o:\---::{- 80}

:o:\===::{= 80}

:o:\Dism::DISM /Online /Cleanup-Image /RestoreHealth

:o:\Sfc::SFC /ScanNow


#Include *i Input.Private.ahk
