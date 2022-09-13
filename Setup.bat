
@Title [Ahk]

@Echo Off

Mode 35,20

CD  /d  %~dp0

Echo  ======== %CD% ========

SetLocal

::#region Init Ahk Files
Set       Folder=%~dp0
Set   Config.ahk=.\Config.ahk
Set     Init.ahk=.\Init.ahk
Set   Screen.ahk=.\Tool\Screen.ahk
Set     Base.ahk=.\Setup\Base.ahk
Set   Dexpot.ahk=.\Setup\Dexpot.ahk
Set     Game.ahk=.\Setup\Game.ahk
Set    Input.ahk=.\Setup\Input.ahk
Set      Key.ahk=.\Setup\Key.ahk
Set     Loop.ahk=.\Setup\Loop.ahk
Set Software.ahk=.\Setup\Software.ahk
::#endregion

CD  /d  %Folder%

::#region Init Ahk Exe
@REM                22                 -1
@REM AutoHotkey := "D:\Xxx\AutoHotkey.exe"
For /f "delims=" %%A In ('FindStr ".*AutoHotkey.exe" %Config.ahk%') Do Set AutoHotkey=%%A
Set AutoHotkey=%AutoHotkey:~22,-1%
If Not Exist %AutoHotkey% (
    Msg %username% /time:9 配置文件错误 \ 未设置脚本执行文件路径 Config.ahk
    Exit
)
Set   AutoHotkeyDpiSoftware=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSoftware.exe%
Set     AutoHotkeyDpiSystem=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystem.exe%
Set AutoHotkeyDpiSystemPlus=%AutoHotkey:AutoHotkey.exe=AutoHotkeyDpiSystemPlus.exe%
::#endregion

::#region Run Command | Start | Stop | ForceStop | ForceStart
Set  AHK=%AutoHotkey%
Set  Command=%1

If "%Command%"=="" (
    Set Command=Start
)

If "%Command%"=="GameMode" (
    Start  %AHK%  %Key.ahk%       Stop
    Start  %AHK%  %Input.ahk%     Stop
    Start  %AHK%  %Loop.ahk%      Stop
    Start  %AHK%  %Dexpot.ahk%    Stop
    Start  %AHK%  %Software.ahk%  Stop
    Start  %AHK%  %Game.ahk%      Start
    Exit
)

Start  %AHK%  %Game.ahk%  Stop

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
    Start  %AHK%  %Base.ahk%
    Echo.
    Echo   Start  %Base.ahk%
    Echo.
)
::#endregion

::#region AutoHotkey Run Script
Echo.
Start  %AHK%      %Key.ahk%      %Command%
Echo   %Command%  %Key.ahk%
Start  %AHK%      %Dexpot.ahk%    %Command%
Echo   %Command%  %Dexpot.ahk%
Start  %AHK%      %Input.ahk%     %Command%
Echo   %Command%  %Input.ahk%
Start  %AHK%      %Loop.ahk%      %Command%
Echo   %Command%  %Loop.ahk%
Start  %AHK%      %Software.ahk%  %Command%
Echo   %Command%  %Software.ahk%
Echo.
::#endregion

EndLocal

Ping -n 2 127.0.0.1 > nul

Exit
