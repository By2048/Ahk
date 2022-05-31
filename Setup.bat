
@Title [Ahk]

@Echo Off

Mode 40,27

CD  /d  %~dp0

Echo  =========== %CD% ===========

SetLocal

@REM ======================================================================

Set      Folder=%~dp0
Set  Config.ahk=%Folder%Config.ahk
Set    Init.ahk=%Folder%Init.ahk
Set  Screen.ahk=%Folder%Tool\Screen.ahk

@REM ======================================================================

@REM                15                        -1
@REM AutoHotkey := "D:\AutoHotkey\AutoHotkey.exe"
For /f "delims=" %%A In ('FindStr ".*AutoHotkey.exe" "Config.ahk"') Do Set AutoHotkey=%%A
Set AutoHotkey=%AutoHotkey:~15,-1%
If Not Exist %AutoHotkey% (
    Msg %username% /time:9 配置文件错误 \ 未设置脚本执行文件路径 Config.ahk\AutoHotkey
    Exit
)
Set   AutoHotkeyDpiSoftware=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSoftware.exe%
Set     AutoHotkeyDpiSystem=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystem.exe%
Set AutoHotkeyDpiSystemPlus=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystemPlus.exe%

@REM ======================================================================

CD  /d  %Folder%

@REM ======================================================================

Set  AHK=%AutoHotkey%
Set  Command=%1

@REM Command | Start | Stop | ForceStop | ForceStart | StopSpace

If "%Command%"=="" (
    Set Command=Start
)

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
    Set Command=Start
)

If "%Command%"=="Start" (
    %AutoHotkey%  %Init.ahk%
    %AutoHotkey%               %Screen.ahk%  
    %AutoHotkeyDpiSoftware%    %Screen.ahk%  Software
    %AutoHotkeyDpiSystem%      %Screen.ahk%  System
    %AutoHotkeyDpiSystemPlus%  %Screen.ahk%  SystemPlus
    Start %AHK% .\Setup.ahk
    Echo.
    Echo  Start .\Setup.ahk
)

@REM ======================================================================

Echo.
Start %AHK%     .\Input.ahk           %Command%
Echo  %Command% .\Input.ahk
Start %AHK%     .\Loop.ahk            %Command%
Echo  %Command% .\Loop.ahk
Echo.
Start %AHK%     .\Key\All.ahk         %Command%
Echo  %Command% .\Key\All.ahk
Echo.
Start %AHK%     .\Key\LWin.ahk        %Command%
Echo  %Command% .\Key\LWin.ahk
Start %AHK%     .\Key\RWin.ahk        %Command%
Echo  %Command% .\Key\RWin.ahk
Echo.
Start %AHK%     .\Key\Ctrl.ahk        %Command%
Echo  %Command% .\Key\Ctrl.ahk
Start %AHK%     .\Key\Alt.ahk         %Command%
Echo  %Command% .\Key\Alt.ahk
Start %AHK%     .\Key\Shift.ahk       %Command%
Echo  %Command% .\Key\Shift.ahk
Echo.
Start %AHK%     .\Key\Space.ahk       %Command%
Echo  %Command% .\Key\Space.ahk
Start %AHK%     .\Key\Capslock.ahk    %Command%
Echo  %Command% .\Key\Capslock.ahk
Start %AHK%     .\Key\Other.ahk       %Command%
Echo  %Command% .\Key\Other.ahk
Echo.
Start %AHK%     .\Other\Dexpot.ahk    %Command%
Echo  %Command% .\Other\Dexpot.ahk
Echo.
Start %AHK%     .\Software\All.ahk    %Command%
Echo  %Command% .\Software\All.ahk

@REM ======================================================================

EndLocal

Ping -n 2 127.0.0.1 > nul

Exit
