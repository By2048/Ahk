@echo off
@Title Start Ahk

mode 40,20
cd /d %~dp0

start .\Setup.ahk

start .\Keys\All.ahk
start .\Keys\AppsKey.ahk
start .\Keys\Capslock.ahk
start .\Keys\LAlt.ahk
start .\Keys\LWin.ahk
start .\Keys\RAlt.ahk
start .\Keys\RShift.ahk
start .\Keys\RWin.ahk

Start .\Other\Dexpot.ahk
Start .\Other\Input.ahk
start .\Other\Keyboard.ahk
start .\Other\Loop.ahk
start .\Other\Software.ahk
start .\Other\Windows.ahk


if exist  %~dp0Other\Private.ahk (
    start .\Other\Private.ahk
)
if exist %~dp0Test.ahk (
    start .\Test.ahk
)

echo  --------------------------

ping -n 2 127.0.0.1 > nul

