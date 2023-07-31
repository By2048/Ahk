
#Include ..\Config\All.ahk
#Include ..\Tool\Base.ahk

#NoTrayIcon
#SingleInstance Force
#Hotstring EndChars `t


:o:\Date::{
    SendInput FormatTime(A_Now, "yyyy-MM-dd")
}

:o:\Time::{
    SendInput FormatTime(A_Now, "HH-mm-ss")
}

:o:\DateTime::{
    SendInput FormatTime(A_Now, "yyyy-MM-dd_HH-mm-ss")
}

:o:\---::{- 80}
:o:\===::{= 80}

:o:\Dism::DISM /Online /Cleanup-image /Restorehealth

:o:\Sfc::sfc /scannow


#Include Input.Private.ahk
