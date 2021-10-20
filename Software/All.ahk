
#include %A_WorkingDir%\Config\All.ahk

#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Change.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk
#include %A_WorkingDir%\Tool\KeyMap.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Image.ahk
#include %A_WorkingDir%\Tool\Language.ahk

#include %A_WorkingDir%\Software\Android.ahk
#include %A_WorkingDir%\Software\Chrome.ahk
#include %A_WorkingDir%\Software\CloudMusic.ahk
#include %A_WorkingDir%\Software\DingDing.ahk
#include %A_WorkingDir%\Software\Explorer.ahk
#include %A_WorkingDir%\Software\FFRenamePro.ahk
#include %A_WorkingDir%\Software\FSViewer.ahk
#include %A_WorkingDir%\Software\Geek.ahk
#include %A_WorkingDir%\Software\JetBrains.ahk
#include %A_WorkingDir%\Software\LOL.ahk
#include %A_WorkingDir%\Software\Maye.ahk
#include %A_WorkingDir%\Software\Notepad++.ahk
#include %A_WorkingDir%\Software\Postman.ahk
#include %A_WorkingDir%\Software\PotPlayer.ahk
#include %A_WorkingDir%\Software\PyCharm.ahk
#include %A_WorkingDir%\Software\Q-Dir.ahk
#include %A_WorkingDir%\Software\Snipaste.ahk
#include %A_WorkingDir%\Software\SumatraPDF.ahk
#include %A_WorkingDir%\Software\TIM.ahk
#include %A_WorkingDir%\Software\VMware.ahk
#include %A_WorkingDir%\Software\VSCode.ahk
#include %A_WorkingDir%\Software\Wallpaper.ahk
#include %A_WorkingDir%\Software\WeChat.ahk
#include %A_WorkingDir%\Software\Windows.Ahk
#include %A_WorkingDir%\Software\WindowsTerminal.Ahk
#include %A_WorkingDir%\Software\Wps.ahk
#include %A_WorkingDir%\Software\Xshell.ahk

#SingleInstance Force
#NoTrayIcon

; 任务栏滚动鼠标调整音量
#if ( CheckWindowsActive("Explorer" , "Shell_TrayWnd") )
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if
