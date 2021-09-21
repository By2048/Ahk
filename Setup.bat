
@title [Ahk]
@echo off

mode 40,25

set AHK=D:\AutoHotkey\AutoHotkey.exe

set folder=%~dp0
set folder=%folder:\\=\%

set test_ahk=%folder%\Test.ahk
set test_ahk=%test_ahk:\\=\%

set private_ahk=%folder%\Private.ahk
set private_ahk=%private_ahk:\\=\%

set ignore_lol_ahk=%folder%\Software\LOL.Ignore.ahk
set ignore_lol_ahk=%ignore_lol_ahk:\\=\%

cd /d %folder%

if not exist %private_ahk% (
    echo Create %private_ahk%
    echo ;Ignore File; > %private_ahk%
)
if not exist %ignore_lol_ahk% (
    echo Create %ignore_lol_ahk%
    echo ;Ignore File; > %ignore_lol_ahk%
)

set command=%1%

if "%command%"=="" (
    set command=start
)

if %command%==start (
    echo.
    start %AHK% .\Setup.ahk    
    @REM =========================================================
    start %AHK% .\Keys\All.ahk      start
    echo  start .\Keys\All.ahk
    start %AHK% .\Keys\Capslock.ahk start
    echo  start .\Keys\Capslock.ahk
    start %AHK% .\Keys\LWin.ahk     start
    echo  start .\Keys\LWin.ahk
    start %AHK% .\Keys\RAlt.ahk     start
    echo  start .\Keys\RAlt.ahk
    start %AHK% .\Keys\RShift.ahk   start
    echo  start .\Keys\RShift.ahk
    start %AHK% .\Keys\RWin.ahk     start
    echo  start .\Keys\RWin.ahk
    @REM =========================================================
    start %AHK% .\Software\All.ahk  start
    echo  start .\Software\All.ahk
    start %AHK% .\Keys\RCtrl.ahk    start
    echo  start .\Keys\RCtrl.ahk
    @REM =========================================================
    start %AHK% .\Other\Dexpot.ahk  start
    echo  start .\Other\Dexpot.ahk
    @REM =========================================================
    Start %AHK% .\Input.ahk         start
    echo  start .\Input.ahk
    start %AHK% .\Loop.ahk          start
    echo  start .\Loop.ahk
    @REM =========================================================
    if exist %private_ahk% (
        start %AHK% .\Private.ahk   start
        echo  start .\Private.ahk
    )
    if exist %test_ahk% (
        start %AHK% .\Test.ahk      start
        echo  start .\Test.ahk
    )
    echo.
)

if %command%==stop (
    echo.
    start %AHK% .\Keys\All.ahk      stop
    echo  stop  .\Keys\All.ahk
    start %AHK% .\Keys\Capslock.ahk stop
    echo  stop  .\Keys\Capslock.ahk
    start %AHK% .\Keys\LWin.ahk     stop
    echo  stop  .\Keys\LWin.ahk
    start %AHK% .\Keys\RAlt.ahk     stop
    echo  stop  .\Keys\RAlt.ahk
    start %AHK% .\Keys\RShift.ahk   stop
    echo  stop  .\Keys\RShift.ahk
    start %AHK% .\Keys\RWin.ahk     stop
    echo  stop  .\Keys\RWin.ahk
    @REM =========================================================    
    start %AHK% .\Software\All.ahk  stop
    echo  stop  .\Software\All.ahk  
    start %AHK% .\Keys\RCtrl.ahk    stop
    echo  stop  .\Keys\RCtrl.ahk
    @REM =========================================================    
    start %AHK% .\Other\Dexpot.ahk  stop
    echo  stop  .\Other\Dexpot.ahk
    @REM =========================================================
    Start %AHK% .\Input.ahk         stop
    echo  stop  .\Input.ahk
    start %AHK% .\Loop.ahk          stop
    echo  stop  .\Loop.ahk
    @REM =========================================================
    if exist %private_ahk% (
        start %AHK% .\Private.ahk   stop
        echo  stop  .\Private.ahk
    )
    if exist %test_ahk% (
        start %AHK% .\Test.ahk      stop
        echo  stop  .\Test.ahk
    )
    echo.
) 

ping -n 2 127.0.0.1 > nul

exit
