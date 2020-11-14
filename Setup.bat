@Title Start Ahk

@echo off

mode 40,25
cd /d %~dp0

set command=%1%

if "%command%"=="" (
    set "command=start"
)

if "%command%"=="stop" (

    echo.
    
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\All.ahk        /f /r  stop
    echo stop .\Keys\All.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RCtrl.ahk      /f /r  stop
    echo stop .\Keys\RCtrl.ahk
    
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r  stop
    echo stop .\Keys\Capslock.ahk
      
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r  stop
    echo stop .\Keys\LWin.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r  stop
    echo stop .\Keys\RAlt.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r  stop
    echo stop .\Keys\RShift.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r  stop
    echo stop .\Keys\RWin.ahk

    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Dexpot.ahk    /f /r  stop
    echo stop .\Other\Dexpot.ahk

    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Input.ahk     /f /r  stop
    echo stop .\Other\Input.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Loop.ahk      /f /r  stop
    echo stop .\Other\Loop.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software.ahk  /f /r  stop
    echo stop .\Other\Software.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software_Program.ahk  /f /r  stop
    echo stop .\Other\Software_Program.ahk
    
    if exist %~dp0Other\Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Other\Private.ahk /f /r stop
        echo stop .\Other\Private.ahk
    )
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Test.ahk /f /r stop
        echo stop .\Test.ahk
    )
    
    echo.
) 



if "%command%"=="start" (
    
    echo.

    start D:\AutoHotkey\AutoHotkey.exe .\Setup.ahk           /f /r
    echo start .\Setup.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\All.ahk        /f /r
    echo start .\Keys\All.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RCtrl.ahk      /f /r
    echo start .\Keys\RCtrl.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r
    echo start .\Keys\Capslock.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r
    echo start .\Keys\LWin.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r
    echo start .\Keys\RAlt.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r
    echo start .\Keys\RShift.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r
    echo start .\Keys\RWin.ahk

    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Dexpot.ahk    /f /r
    echo start .\Other\Dexpot.ahk

    Start D:\AutoHotkey\AutoHotkey.exe .\Other\Input.ahk     /f /r
    echo start .\Other\Input.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Loop.ahk      /f /r
    echo start .\Other\Loop.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software.ahk  /f /r
    echo start .\Other\Software.ahk

    start D:\AutoHotkey\AutoHotkey.exe .\Other\Software_Program.ahk  /f /r
    echo start .\Other\Software_Program.ahk

    if exist %~dp0Other\Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Other\Private.ahk /f /r
        echo start .\Other\Private.ahk
    )
    
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Test.ahk /f /r
        echo start .\Test.ahk
    )

    echo.

)

ping -n 2 127.0.0.1 > nul


