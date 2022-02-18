
@Title [Ahk]

@Echo Off

Mode 40,25

SetLocal

@REM ======================================================================

Set      Folder=%~dp0
Set  Config.ahk=%Folder%Config.ahk
Set    Init.ahk=%Folder%Init.ahk
Set  Screen.ahk=%Folder%Tool\Screen.ahk

@REM ======================================================================

@REM                       22                        -1
@REM Global AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"
For /f "delims=" %%A In ('FindStr ".*AutoHotkey.*" "Config.ahk"') Do Set AutoHotkey=%%A
Set AutoHotkey=%AutoHotkey:~22,-1%
If Not exist %AutoHotkey% (
    Msg %username% /time:9 配置文件错误 \ 未设置脚本执行文件路径 Config.ahk\AutoHotkey
    Exit
)
Set   AutoHotkeyDpiSoftware=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSoftware.exe%
Set     AutoHotkeyDpiSystem=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystem.exe%
Set AutoHotkeyDpiSystemPlus=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystemPlus.exe%

@REM ======================================================================

CD  /d  %Folder%

@REM ======================================================================

%AutoHotkey%  %Init.ahk%

%AutoHotkey%               %Screen.ahk%  
%AutoHotkeyDpiSoftware%    %Screen.ahk%  Software
%AutoHotkeyDpiSystem%      %Screen.ahk%  System
%AutoHotkeyDpiSystemPlus%  %Screen.ahk%  SystemPlus

@REM ======================================================================

Set  AHK=%AutoHotkey%
Set  Command=%1

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
    Ping -n 1 127.0.0.1 > nul
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

@REM ======================================================================

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

@REM ======================================================================

EndLocal

Ping -n 2 127.0.0.1 > nul

Exit
