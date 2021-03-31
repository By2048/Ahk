
@title [Start Ahk]
@echo off

mode 40,25

cd /d %~dp0

set command=%1%

if "%command%"=="" (
    set command=start
)

if %command%==start (
    echo.
    start  D:\AutoHotkey\AutoHotkey.exe  .\Setup.ahk    
    @REM =========================================================
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\All.ahk      start
    echo   start .\Keys\All.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\Capslock.ahk start
    echo   start .\Keys\Capslock.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\LWin.ahk     start
    echo   start .\Keys\LWin.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RAlt.ahk     start
    echo   start .\Keys\RAlt.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RCtrl.ahk    start
    echo   start .\Keys\RCtrl.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RShift.ahk   start
    echo   start .\Keys\RShift.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RWin.ahk     start
    echo   start .\Keys\RWin.ahk
    @REM =========================================================
    start  D:\AutoHotkey\AutoHotkey.exe  .\Software\All.ahk  start
    echo   start .\Software\All.ahk
    @REM =========================================================
    Start  D:\AutoHotkey\AutoHotkey.exe  .\Input.ahk         start
    echo   start .\Input.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Loop.ahk          start
    echo   start .\Loop.ahk
    @REM =========================================================
    if exist %~dp0Private.ahk (
        start  D:\AutoHotkey\AutoHotkey.exe  .\Private.ahk   start
        echo   start .\Private.ahk
    )
    if exist %~dp0Test.ahk (
        start  D:\AutoHotkey\AutoHotkey.exe  .\Test.ahk      start
        echo   start .\Test.ahk
    )
    echo.
)

if %command%==stop (
    echo.
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\All.ahk       stop
    echo   stop .\Keys\All.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\Capslock.ahk  stop
    echo   stop .\Keys\Capslock.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\LWin.ahk      stop
    echo   stop .\Keys\LWin.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RAlt.ahk      stop
    echo   stop .\Keys\RAlt.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RCtrl.ahk     stop
    echo   stop .\Keys\RCtrl.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RShift.ahk    stop
    echo   stop .\Keys\RShift.ahk
    start  D:\AutoHotkey\AutoHotkey.exe  .\Keys\RWin.ahk      stop
    echo   stop .\Keys\RWin.ahk
    @REM =========================================================
    start  D:\AutoHotkey\AutoHotkey.exe  .\Software\All.ahk   stop
    echo   stop .\Software\All.ahk
    @REM =========================================================    
    Start  D:\AutoHotkey\AutoHotkey.exe .\Input.ahk           stop
    echo   stop .\Input.ahk
    start  D:\AutoHotkey\AutoHotkey.exe .\Loop.ahk            stop
    echo   stop .\Loop.ahk
    @REM =========================================================
    if exist %~dp0Private.ahk (
        start  D:\AutoHotkey\AutoHotkey.exe  .\Private.ahk    stop
        echo   stop .\Private.ahk
    )
    if exist %~dp0Test.ahk (
        start  D:\AutoHotkey\AutoHotkey.exe  .\Test.ahk       stop
        echo   stop .\Test.ahk
    )
    echo.
) 

ping -n 2 127.0.0.1 > nul
