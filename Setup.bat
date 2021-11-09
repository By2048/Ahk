
@title [Ahk]
@echo off

mode 40,20

set AHK=D:\AutoHotkey\AutoHotkey.exe

set folder=%~dp0
set folder=%folder:\\=\%

set test_ahk=%folder%\Test.ahk
set test_ahk=%test_ahk:\\=\%

set private_ahk=%folder%\Config\Private.ahk
set private_ahk=%private_ahk:\\=\%

set ignore_lol_ahk=%folder%\Software\LOL.Ignore.ahk
set ignore_lol_ahk=%ignore_lol_ahk:\\=\%

set ignore_input_ahk=%folder%\Input.Ignore.ahk
set ignore_input_ahk=%ignore_input_ahk:\\=\%

cd /d %folder%

if not exist %private_ahk% (
    echo Create %private_ahk%
    echo ;Ignore File; > %private_ahk%
)
if not exist %ignore_lol_ahk% (
    echo Create %ignore_lol_ahk%
    echo ;Ignore File; > %ignore_lol_ahk%
)
if not exist %ignore_input_ahk% (
    echo Create %ignore_input_ahk%
    echo ;Ignore File; > %ignore_input_ahk%
)

set command=%1

if "%command%"=="" (
    set command=start
)

if %command%==start (
    echo.
    start %AHK% .\Setup.ahk    
    @REM =================================
    start %AHK% .\Key\All.ahk       start
    echo  start .\Key\All.ahk
    start %AHK% .\Key\Capslock.ahk  start
    echo  start .\Key\Capslock.ahk
    start %AHK% .\Key\LWin.ahk      start
    echo  start .\Key\LWin.ahk
    start %AHK% .\Key\RAlt.ahk      start
    echo  start .\Key\RAlt.ahk
    start %AHK% .\Key\RShift.ahk    start
    echo  start .\Key\RShift.ahk
    start %AHK% .\Key\RWin.ahk      start
    echo  start .\Key\RWin.ahk
    start %AHK% .\Key\Space.ahk     start
    echo  start .\Key\Space.ahk
    @REM =================================
    start %AHK% .\Software\All.ahk  start
    echo  start .\Software\All.ahk
    start %AHK% .\Key\RCtrl.ahk     start
    echo  start .\Key\RCtrl.ahk
    @REM =================================
    start %AHK% .\Other\Dexpot.ahk  start
    echo  start .\Other\Dexpot.ahk
    @REM =================================
    Start %AHK% .\Input.ahk         start
    echo  start .\Input.ahk
    start %AHK% .\Loop.ahk          start
    echo  start .\Loop.ahk
    @REM =================================
    if exist %test_ahk% (
        start %AHK% .\Test.ahk      start
        echo  start .\Test.ahk
    )
    echo.
)

if %command%==stop (
    echo.
    start %AHK% .\Key\All.ahk       stop
    echo  stop  .\Key\All.ahk
    start %AHK% .\Key\Capslock.ahk  stop
    echo  stop  .\Key\Capslock.ahk
    start %AHK% .\Key\LWin.ahk      stop
    echo  stop  .\Key\LWin.ahk
    start %AHK% .\Key\RAlt.ahk      stop
    echo  stop  .\Key\RAlt.ahk
    start %AHK% .\Key\RShift.ahk    stop
    echo  stop  .\Key\RShift.ahk
    start %AHK% .\Key\RWin.ahk      stop
    echo  stop  .\Key\RWin.ahk
    start %AHK% .\Key\Space.ahk     stop
    echo  stop  .\Key\Space.ahk
    @REM =================================
    start %AHK% .\Software\All.ahk  stop
    echo  stop  .\Software\All.ahk  
    start %AHK% .\Key\RCtrl.ahk     stop
    echo  stop  .\Key\RCtrl.ahk
    @REM =================================
    start %AHK% .\Other\Dexpot.ahk  stop
    echo  stop  .\Other\Dexpot.ahk
    @REM =================================
    Start %AHK% .\Input.ahk         stop
    echo  stop  .\Input.ahk
    start %AHK% .\Loop.ahk          stop
    echo  stop  .\Loop.ahk
    @REM =================================
    if exist %test_ahk% (
        start %AHK% .\Test.ahk      stop
        echo  stop  .\Test.ahk
    )
    echo.
) 

ping -n 2 127.0.0.1 > nul

exit
