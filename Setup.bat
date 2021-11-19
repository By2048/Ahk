
@title [Ahk]
@echo off

mode 40,25

@REM ============================================

set AHK=D:\AutoHotkey\AutoHotkey.exe

set folder=%~dp0
set folder=%folder:\\=\%

set test_ahk=%folder%\Test.ahk
set test_ahk=%test_ahk:\\=\%

set config_private_ahk=%folder%\Config\Private.ahk
set config_private_ahk=%config_private_ahk:\\=\%

set lol_private_ahk=%folder%\Software\LOL.Private.ahk
set lol_private_ahk=%lol_private_ahk:\\=\%

set input_private_ahk=%folder%\Input.Private.ahk
set input_private_ahk=%input_private_ahk:\\=\%

cd /d %folder%

@REM ============================================

if not exist %config_private_ahk% (
    echo Create %config_private_ahk%
    echo ;Private File; > %config_private_ahk%
)
if not exist %lol_private_ahk% (
    echo Create %lol_private_ahk%
    echo ;Private File; > %lol_private_ahk%
)
if not exist %input_private_ahk% (
    echo Create %input_private_ahk%
    echo ;Private File; > %input_private_ahk%
)

@REM ============================================

set command=%1

@REM 直接运行脚本 Start_Ahk.bat / Setup.bat
if "%command%"=="" (
    set command=start
    start %AHK% .\Setup.ahk
)

@REM ============================================
echo.
start %AHK%     .\Key\All.ahk         %command%
echo  %command% .\Key\All.ahk
start %AHK%     .\Key\Capslock.ahk    %command%
echo  %command% .\Key\Capslock.ahk
start %AHK%     .\Key\LWin.ahk        %command%
echo  %command% .\Key\LWin.ahk
start %AHK%     .\Key\PrintScreen.ahk %command%
echo  %command% .\Key\PrintScreen.ahk
start %AHK%     .\Key\RAlt.ahk        %command%
echo  %command% .\Key\RAlt.ahk
start %AHK%     .\Key\RCtrl.ahk       %command%
echo  %command% .\Key\RCtrl.ahk
start %AHK%     .\Key\RShift.ahk      %command%
echo  %command% .\Key\RShift.ahk
start %AHK%     .\Key\RWin.ahk        %command%
echo  %command% .\Key\RWin.ahk
start %AHK%     .\Key\Space.ahk       %command%
echo  %command% .\Key\Space.ahk
@REM ============================================
echo.
start %AHK%     .\Software\All.ahk    %command%
echo  %command% .\Software\All.ahk
@REM ============================================
echo.
start %AHK%     .\Other\Dexpot.ahk    %command%
echo  %command% .\Other\Dexpot.ahk
@REM ============================================
echo.
start %AHK%     .\Loop.ahk            %command%
echo  %command% .\Loop.ahk
start %AHK%     .\Input.ahk           %command%
echo  %command% .\Input.ahk
@REM ============================================
echo.
if exist %test_ahk% (
    start %AHK%     .\Test.ahk        %command%
    echo  %command% .\Test.ahk
)
@REM ============================================

ping -n 2 127.0.0.1 > nul

exit
