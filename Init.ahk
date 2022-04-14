
#Include %A_WorkingDir%\Config.ahk

; ----------------------------------------------------------------------
; 私人配置文件填补
Global Private_File := {      "Input" : A_WorkingDir . "\Input.Private.ahk"                     ;
                       ,     "Confog" : A_WorkingDir . "\Config\Private.ahk"                    ;
                       ,        "COC" : A_WorkingDir . "\Software\Game\Android.COC.Private.ahk" ;
                       , "LOL.Client" : A_WorkingDir . "\Software\Game\LOL.Client.Private.ahk"  ;
                       ,   "LOL.Game" : A_WorkingDir . "\Software\Game\LOL.Game.Private.ahk"    }

FileEncoding UTF-8-RAW
For name, path In Private_File {
    if (not FileExist(path)) {
        FileAppend, "`; Private File `;", %path%
    }
}

; ----------------------------------------------------------------------
; 重置Global.ini
FileDelete, %INI%
FileAppend, `; Ahk Global Config `;, %INI%

; ----------------------------------------------------------------------
; DPI相关设置处理
; 复制可执行程序 并且在系统中手动设置DPI设置
Global   AutoHotkeyDpiSoftware := StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSoftware.exe"  )
Global     AutoHotkeyDpiSystem := StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystem.exe"    )
Global AutoHotkeyDpiSystemPlus := StrReplace(AutoHotkey, "AutoHotkey.exe", "AutoHotkeyDpiSystemPlus.exe")

If Not FileExist(AutoHotkeyDpiSoftware) {
    FileCopy, %AutoHotkey%, %AutoHotkeyDpiSoftware%
}
If Not FileExist(AutoHotkeyDpiSystem) {
    FileCopy, %AutoHotkey%, %AutoHotkeyDpiSystem%
}
If Not FileExist(AutoHotkeyDpiSystemPlus) {
    FileCopy, %AutoHotkey%, %AutoHotkeyDpiSystemPlus%
}

; ----------------------------------------------------------------------
