
@Title [Ahk]

@Echo Off

Mode 40,25

@REM ============================================

SetLocal

@REM ============================================

Set Folder=%~dp0

@REM ============================================

Set Global.ini=%Folder%\Config\Global.ini

Del   %Global.ini%
Echo  ; Ahk Global Config ; > %Global.ini%

@REM ============================================

Set              AutoHotkey=D:\AutoHotkey\AutoHotkey.exe
Set   AutoHotkeyDpiSoftware=D:\AutoHotkey\AutoHotkeyDpiSoftware.exe
Set     AutoHotkeyDpiSystem=D:\AutoHotkey\AutoHotkeyDpiSystem.exe
Set AutoHotkeyDpiSystemPlus=D:\AutoHotkey\AutoHotkeyDpiSystemPlus.exe
Set                 Dpi.ahk=%Folder%\Dpi.ahk

CD  /d  %Folder%

%AutoHotkey%               %Dpi.ahk%  
%AutoHotkeyDpiSoftware%    %Dpi.ahk%  Dpi.Software
%AutoHotkeyDpiSystem%      %Dpi.ahk%  Dpi.System
%AutoHotkeyDpiSystemPlus%  %Dpi.ahk%  Dpi.SystemPlus

@REM ============================================

Set       Input.Private.ahk=%Folder%\Input.Private.ahk
Set             Private.ahk=%Folder%\Config\Private.ahk
Set Android.COC.Private.ahk=%Folder%\Software\Android.COC.Private.ahk
Set         LOL.Private.ahk=%Folder%\Software\LOL.Private.ahk

If Not Exist %Input.Private.ahk% (
    Echo Create %Input.Private.ahk%
    Echo ; Private File ; > %Input.Private.ahk%
)
If Not Exist %Private.ahk% (
    Echo Create %Private.ahk%
    Echo ; Private File ; > %Private.ahk%
)
If Not Exist %Android.COC.Private.ahk% (
    Echo Create %Android.COC.Private.ahk%
    Echo ; Private File ; > %Android.COC.Private.ahk%
)
If Not Exist %LOL.Private.ahk% (
    Echo Create %LOL.Private.ahk%
    Echo ; Private File ; > %LOL.Private.ahk%
)

@REM ============================================

CD  /d  %Folder%

Set AHK=D:\AutoHotkey\AutoHotkey.exe

Set Command=%1

@REM 运行游戏时结束Space.ahk
If "%Command%"=="StopSpace" (
    Start %AHK% .\Key\Space.ahk Stop
    Echo.
    Echo  Stop .\Key\Space.ahk
    Exit
)

If "%Command%"=="ForceStop" (
    @Echo Off
    TaskKill  /f /im  AutoHotkey.exe
    @Echo On
    Exit
)

If "%Command%"=="ForceStart" (
    @Echo Off
    TaskKill  /f /im  AutoHotkey.exe
    @Echo On
    Set Command=
)

@REM 直接启动
If "%Command%"=="" (
    Set Command=Start
    Start %AHK% .\Setup.ahk
    Echo.
    Echo  Start .\Setup.ahk
)

@REM ============================================

Echo.
Start %AHK%     .\Key\All.ahk         %Command%
Echo  %Command% .\Key\All.ahk
Start %AHK%     .\Key\Capslock.ahk    %Command%
Echo  %Command% .\Key\Capslock.ahk
Start %AHK%     .\Key\LWin.ahk        %Command%
Echo  %Command% .\Key\LWin.ahk
Start %AHK%     .\Key\PrintScreen.ahk %Command%
Echo  %Command% .\Key\PrintScreen.ahk
Start %AHK%     .\Key\RAlt.ahk        %Command%
Echo  %Command% .\Key\RAlt.ahk
Start %AHK%     .\Key\RCtrl.ahk       %Command%
Echo  %Command% .\Key\RCtrl.ahk
Start %AHK%     .\Key\RShift.ahk      %Command%
Echo  %Command% .\Key\RShift.ahk
Start %AHK%     .\Key\RWin.ahk        %Command%
Echo  %Command% .\Key\RWin.ahk
Start %AHK%     .\Key\Space.ahk       %Command%
Echo  %Command% .\Key\Space.ahk
Echo.
Start %AHK%     .\Software\All.ahk    %Command%
Echo  %Command% .\Software\All.ahk
Echo.
Start %AHK%     .\Other\Dexpot.ahk    %Command%
Echo  %Command% .\Other\Dexpot.ahk
Echo.
Start %AHK%     .\Loop.ahk            %Command%
Echo  %Command% .\Loop.ahk
Start %AHK%     .\Input.ahk           %Command%
Echo  %Command% .\Input.ahk

@REM ============================================

EndLocal

@REM ============================================

Ping -n 2 127.0.0.1 > nul

Exit
