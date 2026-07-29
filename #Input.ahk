
#NoTrayIcon
#SingleInstance Force
#HotString EndChars `t`n`s


:Xo:\Date::SendInput( FormatTime(A_Now, "yyyy-MM-dd") )

:Xo:\Time::SendInput( FormatTime(A_Now, "HH-mm-ss") )

:Xo:\DateTime::SendInput( FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss") )

:o:\---::{- 80}

:o:\===::{= 80}

:o:\Dism::DISM /Online /Cleanup-Image /RestoreHealth

:o:\Sfc::SFC /ScanNow

:o:\Admin::Administrator

:o:\WinAdmin::Windows\Administrator

:o:\PSL::PowerShell


#Include *i #Input.Private.ahk
