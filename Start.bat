@echo off
@Title Start All Ahk

mode 40,20

cd /d %~dp0

start ALL.ahk

start Dexpot.ahk
start Software.ahk
start Loop.ahk
start Windows.ahk

start Keys.ahk
start Capslock.ahk
start RShift.ahk
start AppsKey.ahk
start LAlt.ahk
start RAlt.ahk
start LWin.ahk
start RWin.ahk

start Keyboard.ahk

echo.    
echo  --------------------------
echo  - Strat ALL      Success -
echo  - Strat Dexpot   Success -
echo  - Strat Software Success -
echo  - Strat Loop     Success -
echo  - Strat Windows  Success -
echo  - Strat Keys     Success -
echo  - Strat RShift   Success -
echo  - Strat Capslock Success -
echo  - Strat LWin     Success -
echo  - Strat RWin     Success -
echo  - Strat LAlt     Success -
echo  - Strat RAlt     Success -
echo  - Strat AppsKey  Success -
echo  - Strat Keyboard Success -

if exist %~dp0Private.ahk (
    start Private.ahk
    echo  - Strat Private  Success -
)
if exist %~dp0Test.ahk (
    start Test.ahk
    echo  - Strat Test     Success -
)

echo  --------------------------

ping -n 2 127.0.0.1 > nul




