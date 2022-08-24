
@Title [Ahk]

@Echo Off

Mode 40,27

CD  /d  %~dp0

Echo  =========== %CD% ===========

SetLocal

::#region Init Ahk Files
Set       Folder=%~dp0
Set   Config.ahk=.\Config\Base.ahk
Set     Init.ahk=.\Other\Init.ahk
Set    Setup.ahk=.\Other\Setup.ahk
Set   Screen.ahk=.\Tool\Screen.ahk
Set     Keys.ahk=.\Key\All.ahk
Set     LWin.ahk=.\Key\LWin.ahk
Set     RWin.ahk=.\Key\RWin.ahk
Set     Ctrl.ahk=.\Key\Ctrl.ahk
Set      Alt.ahk=.\Key\Alt.ahk
Set    Shift.ahk=.\Key\Shift.ahk
Set    Space.ahk=.\Key\Space.ahk
Set CapsLock.ahk=.\Key\CapsLock.ahk
Set    Input.ahk=.\Other\Input.ahk
Set     Loop.ahk=.\Other\Loop.ahk
Set   Dexpot.ahk=.\Other\Dexpot.ahk
Set Software.ahk=.\Software\All.ahk
::#endregion

CD  /d  %Folder%

::#region Init Ahk Exe
@REM                22                 -1
@REM AutoHotkey := "D:\Xxx\AutoHotkey.exe"
For /f "delims=" %%A In ('FindStr ".*AutoHotkey.exe" %Config.ahk%') Do Set AutoHotkey=%%A
Set AutoHotkey=%AutoHotkey:~22,-1%
If Not Exist %AutoHotkey% (
    Msg %username% /time:9 配置文件错误 \ 未设置脚本执行文件路径 Config\Base.ahk
    Exit
)
Set   AutoHotkeyDpiSoftware=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSoftware.exe%
Set     AutoHotkeyDpiSystem=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystem.exe%
Set AutoHotkeyDpiSystemPlus=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystemPlus.exe%
::#endregion

::#region Run Command | Start | Stop | ForceStop | ForceStart | StopSpace
Set  AHK=%AutoHotkey%
Set  Command=%1

If "%Command%"=="" (
    Set Command=Start
)

@REM 运行游戏时结束Space.ahk
If "%Command%"=="StopSpace" (
    Start  %AHK%  %Space.ahk%  Stop
    Echo.
    Echo  Stop  %Space.ahk%
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
    Start  %AHK%  %Setup.ahk%
    Echo.
    Echo   Start  %Setup.ahk%
)
::#endregion

::#region AutoHotkey Run Script
Echo.
Start  %AHK%      %Keys.ahk%      %Command%
Echo   %Command%  %Keys.ahk%
Echo.
Start  %AHK%      %LWin.ahk%      %Command%
Echo   %Command%  %LWin.ahk%
Start  %AHK%      %RWin.ahk%      %Command%
Echo   %Command%  %RWin.ahk%
Echo.
Start  %AHK%      %Ctrl.ahk%      %Command%
Echo   %Command%  %Ctrl.ahk%
Start  %AHK%      %Alt.ahk%       %Command%
Echo   %Command%  %Alt.ahk%
Start  %AHK%      %Shift.ahk%     %Command%
Echo   %Command%  %Shift.ahk%
Echo.
Start  %AHK%      %Space.ahk%     %Command%
Echo   %Command%  %Space.ahk%
Start  %AHK%      %CapsLock.ahk%  %Command%
Echo   %Command%  %CapsLock.ahk%
Echo.
Start  %AHK%      %Input.ahk%     %Command%
Echo   %Command%  %Input.ahk%
Start  %AHK%      %Loop.ahk%      %Command%
Echo   %Command%  %Loop.ahk%
Start  %AHK%      %Dexpot.ahk%    %Command%
Echo   %Command%  %Dexpot.ahk%
Echo.
Start  %AHK%      %Software.ahk%  %Command%
Echo   %Command%  %Software.ahk%
::#endregion

EndLocal

Ping -n 2 127.0.0.1 > nul

Exit
