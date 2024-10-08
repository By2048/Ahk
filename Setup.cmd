
@Title [Ahk]

@Echo Off

Mode 33,22

CD  /d  %~dp0

Echo.
Echo  ======= %CD% =======
Echo.

SetLocal

:: Start      Stop
:: ForceStart ForceStop
Set Command=%1
If "%Command%"=="" (
    Set Command=Start
)
If "%Command%"=="ForceStop" (
    @Echo Off
    TaskKill  /f /im  AutoHotkey.exe
    @Echo On
    Exit
)

:: Init AutoHotkey Exe
::                15                    -1
:: AutoHotkey := "D:\Xxx\Xx\AutoHotkey.exe"
For /f "delims=" %%A In ('FindStr ".*AutoHotkey.exe" .\Config.ahk') Do Set AutoHotkey=%%A
Set AutoHotkey=%AutoHotkey:~15,-1%
If Not Exist %AutoHotkey% (
    Msg %username% /time:9 配置文件错误 \ 未设置脚本执行文件路径 Config.ahk
    Exit
)
Set AHK=%AutoHotkey%

:: Init AutoHotkey Files
Set        @.ahk=.\@.ahk
Set     Base.ahk=.\#Base.ahk
Set    Input.ahk=.\#Input.ahk
Set      Key.ahk=.\#Key.ahk
Set Software.ahk=.\#Software.ahk

If "%Command%"=="ForceStart" (
    @Echo Off
    Taskkill  /f /im  AutoHotkey.exe
    Ping -n 1 127.0.0.1 > nul
    @Echo On
    Set Command=Start
)

:: 脚本入口
Echo.
Start  %AHK%      %Base.ahk%
Echo   %Command%  %Base.ahk%

:: 主要使用的脚本
Echo.
Start  %AHK%      %Key.ahk%       %Command%
Echo   %Command%  %Key.ahk%
Start  %AHK%      %Input.ahk%     %Command%
Echo   %Command%  %Input.ahk%
Start  %AHK%      %Software.ahk%  %Command%
Echo   %Command%  %Software.ahk%
Echo.

:: 临时性的脚本
Start  %AHK%      %@.ahk%
Echo   %Command%  %@.ahk%

EndLocal

Ping -n 2 127.0.0.1 > nul

Exit
