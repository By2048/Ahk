@echo off
@Title Start Ahk

mode 30,20
cd /d %~dp0



start .\Setup.ahk
start .\Keys\All.ahk
start .\Keys\AppsKey.ahk
start .\Keys\Capslock.ahk
start .\Keys\Ctrl.ahk
start .\Keys\LAlt.ahk
start .\Keys\LWin.ahk
start .\Keys\RAlt.ahk
start .\Keys\RShift.ahk
start .\Keys\RWin.ahk
start .\Keys\Win.ahk
Start .\Other\Dexpot.ahk
Start .\Other\Input.ahk
start .\Other\Keyboard.ahk
start .\Other\Loop.ahk
start .\Other\Software.ahk

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



if exist  %~dp0Other\Private.ahk (
    start .\Other\Private.ahk
    echo start .\Other\Private.ahk
)
if exist %~dp0Test.ahk (
    start .\Test.ahk
    echo start .\Test.ahk
)



ping -n 2 127.0.0.1 > nul

