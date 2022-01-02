
@Title [Ahk]

@Echo Off

Mode 40,25

@REM ============================================

SetLocal

@REM ============================================

Set folder=%~dp0

@REM ============================================

Set Global_Ini=%folder%\Config\Global.ini

Del   %Global_Ini%
Echo  ; Ahk Global Config ; > %Global_Ini%

@REM ============================================

Set              AutoHotkey=D:\AutoHotkey\AutoHotkey.exe
Set   AutoHotkeyDpiSoftware=D:\AutoHotkey\AutoHotkeyDpiSoftware.exe
Set     AutoHotkeyDpiSystem=D:\AutoHotkey\AutoHotkeyDpiSystem.exe
Set AutoHotkeyDpiSystemPlus=D:\AutoHotkey\AutoHotkeyDpiSystemPlus.exe
Set                 Dpi_Ahk=%folder%\Dpi.ahk

CD  /d  %folder%

%AutoHotkey%               %Dpi_Ahk%  
%AutoHotkeyDpiSoftware%    %Dpi_Ahk%  Dpi.Software
%AutoHotkeyDpiSystem%      %Dpi_Ahk%  Dpi.System
%AutoHotkeyDpiSystemPlus%  %Dpi_Ahk%  Dpi.SystemPlus

@REM ============================================

Set       input_private_ahk=%folder%\Input.Private.ahk
Set      config_private_ahk=%folder%\Config\Private.ahk
Set android_coc_private_ahk=%folder%\Software\Android.COC.Private.ahk
Set         lol_private_ahk=%folder%\Software\LOL.Private.ahk

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

Set AHK=D:\AutoHotkey\AutoHotkey.exe

Set command=%1

@REM 运行游戏时结束Space.ahk
If "%command%"=="Stop_Space" (
    Start %AHK% .\Key\Space.ahk Stop
    Echo.
    Echo  Stop .\Key\Space.ahk
    Exit
)

@REM 直接启动
If "%command%"=="" (
    Set command=Start
    Start %AHK% .\Setup.ahk
    Echo.
    Echo  Start .\Setup.ahk
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
Echo.
Start %AHK%     .\Software\All.ahk    %command%
Echo  %command% .\Software\All.ahk
Echo.
Start %AHK%     .\Other\Dexpot.ahk    %command%
Echo  %command% .\Other\Dexpot.ahk
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
