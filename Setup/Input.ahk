
#Include %A_InitialWorkingDir%\Config\All.ahk
#Include %A_InitialWorkingDir%\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t


:*:\Date::{
    SendInput FormatTime(A_Now, "yyyy-MM-dd")
}

:*:\Time::{
    SendInput FormatTime(A_Now, "HH-mm-ss")
}

:*:\DateTime::{
    SendInput FormatTime(A_Now, "yyyy-MM-dd HH-mm-ss")
}

:*:\---::{- 80}
:*:\###::{# 80}
:*:\///::{/ 80}


:o:\Dism::DISM /Online /Cleanup-image /Restorehealth

:o:\Sfc::sfc /scannow



#Include %A_InitialWorkingDir%\Setup\Input.Private.ahk
