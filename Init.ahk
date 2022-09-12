
#Include %A_WorkingDir%\Config.ahk

; -------------------------------------------------------------------------------------------------
; 私有配置文件填补
FILES := {     "Confog" : A_WorkingDir . "\Config\Private.ahk"                    ;
         ,      "Input" : A_WorkingDir . "\Setup\Input.Private.ahk"               ;
         ,        "COC" : A_WorkingDir . "\Software\Game\Android.COC.Private.ahk" ;
         , "LOL.Client" : A_WorkingDir . "\Software\Game\LOL.Client.Private.ahk"  ;
         ,   "LOL.Game" : A_WorkingDir . "\Software\Game\LOL.Game.Private.ahk"    }

FileEncoding UTF-8-RAW
For name, path In FILES {
    If (not FileExist(path)) {
        FileAppend, "`; Private File `;", %path%
    }
}

; -------------------------------------------------------------------------------------------------
; DPI相关设置处理
; 复制可执行程序 并且在系统中手动设置DPI设置
AHKS := { "AutoHotkeyDpiSoftware"   : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSoftware.exe"  ) ;
        , "AutoHotkeyDpiSystem"     : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystem.exe"    ) ;
        , "AutoHotkeyDpiSystemPlus" : StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystemPlus.exe") }

For name, path In AHKS {
    If (not FileExist(path)) {
        If Not FileExist(path) {
            FileCopy, %AutoHotkey%, %path%
        }
    }
}
