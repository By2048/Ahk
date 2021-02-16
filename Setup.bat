
@Title Start Ahk
@Echo off

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
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r  stop
    echo stop .\Keys\Capslock.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r  stop
    echo stop .\Keys\LWin.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r  stop
    echo stop .\Keys\RAlt.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RCtrl.ahk      /f /r  stop
    echo stop .\Keys\RCtrl.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r  stop
    echo stop .\Keys\RShift.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r  stop
    echo stop .\Keys\RWin.ahk
    @REM ===============================================================
    start D:\AutoHotkey\AutoHotkey.exe .\Software\All.ahk    /f /r  stop
    echo stop .\Software\All.ahk
    @REM ===============================================================    
    Start D:\AutoHotkey\AutoHotkey.exe .\Input.ahk           /f /r  stop
    echo stop .\Input.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Loop.ahk            /f /r  stop
    echo stop .\Loop.ahk
    @REM ===============================================================
    if exist %~dp0Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe      .\Private.ahk /f /r stop
        echo stop .\Private.ahk
    )
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe         .\Test.ahk /f /r stop
        echo stop .\Test.ahk
    )
    echo.

) 



if "%command%"=="start" (
    
    echo.
    start D:\AutoHotkey\AutoHotkey.exe .\Setup.ahk           /f /r
    echo start .\Setup.ahk
    @REM =========================================================
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\All.ahk        /f /r
    echo start .\Keys\All.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\Capslock.ahk   /f /r
    echo start .\Keys\Capslock.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\LWin.ahk       /f /r
    echo start .\Keys\LWin.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RAlt.ahk       /f /r
    echo start .\Keys\RAlt.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RCtrl.ahk      /f /r
    echo start .\Keys\RCtrl.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RShift.ahk     /f /r
    echo start .\Keys\RShift.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Keys\RWin.ahk       /f /r
    echo start .\Keys\RWin.ahk
    @REM =========================================================
    start D:\AutoHotkey\AutoHotkey.exe .\Software\All.ahk    /f /r
    echo start .\Software\All.ahk
    @REM =========================================================
    Start D:\AutoHotkey\AutoHotkey.exe .\Input.ahk           /f /r
    echo start .\Input.ahk
    start D:\AutoHotkey\AutoHotkey.exe .\Loop.ahk            /f /r
    echo start .\Loop.ahk
    @REM =========================================================
    if exist %~dp0Private.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Private.ahk /f /r
        echo start .\Private.ahk
    )
    if exist %~dp0Test.ahk (
        start D:\AutoHotkey\AutoHotkey.exe .\Test.ahk /f /r
        echo start .\Test.ahk
    )
    echo.

)

ping -n 2 127.0.0.1 > nul
