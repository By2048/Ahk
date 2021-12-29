
@Title [Ahk]
@Echo off

Mode 40,25

@REM ============================================

SetLocal

@REM ============================================

Set AHK=D:\AutoHotkey\AutoHotkey.exe

Set folder=%~dp0
Set folder=%folder:\\=\%

Set test_ahk=%folder%\Test.ahk
Set test_ahk=%test_ahk:\\=\%
Set input_private_ahk=%folder%\Input.Private.ahk
Set input_private_ahk=%input_private_ahk:\\=\%

Set config_private_ahk=%folder%\Config\Private.ahk
Set config_private_ahk=%config_private_ahk:\\=\%

Set android_coc_private_ahk=%folder%\Software\Android.COC.Private.ahk
Set android_coc_private_ahk=%android_coc_private_ahk:\\=\%
Set lol_private_ahk=%folder%\Software\LOL.Private.ahk
Set lol_private_ahk=%lol_private_ahk:\\=\%


@REM ============================================

If Not Exist %input_private_ahk% (
    Echo Create %input_private_ahk%
    Echo ;Private File; > %input_private_ahk%
)
If Not Exist %config_private_ahk% (
    Echo Create %config_private_ahk%
    Echo ;Private File; > %config_private_ahk%
)
If Not Exist %android_coc_private_ahk% (
    Echo Create %android_coc_private_ahk%
    Echo ;Private File; > %android_coc_private_ahk%
)
If Not Exist %lol_private_ahk% (
    Echo Create %lol_private_ahk%
    Echo ;Private File; > %lol_private_ahk%
)

@REM ============================================

CD  /d  %folder%

Set command=%1

@REM 运行游戏时结束Space.ahk
If "%command%"=="Stop_Space" (
    Start %AHK% .\Key\Space.ahk Stop
    Echo.
    Echo Stop .\Key\Space.ahk
    Exit
)

@REM 直接运行脚本 Start_Ahk.bat / Setup.bat
If "%command%"=="" (
    Set command=Start
    Start %AHK% .\Setup.ahk
    Echo.
    Echo Start .\Setup.ahk
)

@REM ============================================
Echo.
Start %AHK%     .\Key\All.ahk         %command%
Echo  %command% .\Key\All.ahk
Start %AHK%     .\Key\Capslock.ahk    %command%
Echo  %command% .\Key\Capslock.ahk
Start %AHK%     .\Key\LWin.ahk        %command%
Echo  %command% .\Key\LWin.ahk
Start %AHK%     .\Key\PrintScreen.ahk %command%
Echo  %command% .\Key\PrintScreen.ahk
Start %AHK%     .\Key\RAlt.ahk        %command%
Echo  %command% .\Key\RAlt.ahk
Start %AHK%     .\Key\RCtrl.ahk       %command%
Echo  %command% .\Key\RCtrl.ahk
Start %AHK%     .\Key\RShift.ahk      %command%
Echo  %command% .\Key\RShift.ahk
Start %AHK%     .\Key\RWin.ahk        %command%
Echo  %command% .\Key\RWin.ahk
Start %AHK%     .\Key\Space.ahk       %command%
Echo  %command% .\Key\Space.ahk
@REM ============================================
Echo.
Start %AHK%     .\Software\All.ahk    %command%
Echo  %command% .\Software\All.ahk
@REM ============================================
Echo.
Start %AHK%     .\Other\Dexpot.ahk    %command%
Echo  %command% .\Other\Dexpot.ahk
@REM ============================================
Echo.
Start %AHK%     .\Loop.ahk            %command%
Echo  %command% .\Loop.ahk
Start %AHK%     .\Input.ahk           %command%
Echo  %command% .\Input.ahk
@REM ============================================

EndLocal

@REM ============================================

Ping -n 2 127.0.0.1 > nul

Exit
