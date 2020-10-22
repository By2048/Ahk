@Title Start Ahk

@echo off

mode 30,20
cd /d %~dp0

set command=%1%

if "%command%"=="" (
    set command=start
)

if "%command%"=="stop" (
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\All.ahk        /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\AppsKey.ahk    /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Ctrl.ahk       /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LAlt.ahk       /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Win.ahk        /f /r  stop
    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Dexpot.ahk    /f /r  stop
    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Input.ahk     /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Keyboard.ahk  /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Loop.ahk      /f /r  stop
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software.ahk  /f /r  stop
    echo.
    echo stop .\Keys\All.ahk
    echo stop .\Keys\AppsKey.ahk
    echo stop .\Keys\Capslock.ahk
    echo stop .\Keys\Ctrl.ahk
    echo stop .\Keys\LAlt.ahk
    echo stop .\Keys\LWin.ahk
    echo stop .\Keys\RAlt.ahk
    echo stop .\Keys\RShift.ahk
    echo stop .\Keys\RWin.ahk
    echo stop .\Keys\Win.ahk
    echo stop .\Other\Dexpot.ahk
    echo stop .\Other\Input.ahk
    echo stop .\Other\Keyboard.ahk
    echo stop .\Other\Loop.ahk
    echo stop .\Other\Software.ahk
    if exist %~dp0Other\Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Other\Private.ahk /f /r stop
    )
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Test.ahk /f /r stop
    )
) 

if "%command%"=="start" (
    start D:\AutoHotkey\AutoHotkey.exe .\Setup.ahk           /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\All.ahk        /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\AppsKey.ahk    /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Ctrl.ahk       /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LAlt.ahk       /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Win.ahk        /f /r
    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Dexpot.ahk    /f /r
    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Input.ahk     /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Keyboard.ahk  /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Loop.ahk      /f /r
    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software.ahk  /f /r
    echo.
    echo start .\Setup.ahk
    echo start .\Keys\All.ahk
    echo start .\Keys\AppsKey.ahk
    echo start .\Keys\Capslock.ahk
    echo start .\Keys\Ctrl.ahk
    echo start .\Keys\LAlt.ahk
    echo start .\Keys\LWin.ahk
    echo start .\Keys\RAlt.ahk
    echo start .\Keys\RShift.ahk
    echo start .\Keys\RWin.ahk
    echo start .\Keys\Win.ahk
    echo start .\Other\Dexpot.ahk
    echo start .\Other\Input.ahk
    echo start .\Other\Keyboard.ahk
    echo start .\Other\Loop.ahk
    echo start .\Other\Software.ahk
    if exist %~dp0Other\Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Other\Private.ahk /f /r
    )
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Test.ahk /f /r
    )
)

ping -n 2 127.0.0.1 > nul
