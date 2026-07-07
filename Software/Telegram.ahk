
RegisterHelpInfo( "Telegram" , FilePath(A_LineFile, "Telegram.help") )

Telegram :=
{
    CurrentTitle : "" ,
    LastTitle    : "" ,
    Folders      : []
}

#Include *i Telegram.Private.ahk


#HotIf CheckWindowActive("Telegram" , "Qt*" , "Media*")
    NumpadHome::Send "^="
    NumpadEnd:: Send "^-"
    NumpadPgDn::Send "{Right}"
    NumpadPgUp::Send "{Left}"
    NumpadIns:: Send "{AppsKey}{Up 2}{Enter}"
    NumpadDel:: Send "{Enter}"
#HotIf


#HotIf CheckWindowActive("Telegram" , "#32770" , "SaveFile|SaveVideo" )
    NumLock::Send "!s"
    ~CapsLock::{
        Telegram.CurrentTitle := WinGetTitle("A")
        folder_current := ControlGetText("ToolbarWindow324", "A")
        folder_current := StrReplace(folder_current, "地址: ")
        win_title := Telegram.CurrentTitle
        win_class := WinGetClass("A")
        ; if ( win_class != "#32770" || win_title != "Save File" )
        ;     return
        move_folder := TG_get_folder_by_title(Telegram.LastTitle)
        if ( ! move_folder )
            return
        if ( folder_current == move_folder )
            return
        ; HelpText(folder_current " >>> " move_folder)
        Send "!d"
        Send "{Backspace}"
        Sleep 111
        SendText move_folder
        Sleep 111
        Send "{Enter}"
        Sleep 333
        ControlFocus("DirectUIHWND2", "A")
        ; _ := WinGetTitle("A")
        ; _ := ControlGetText("Edit2", "A")
        ; HelpText(xxx)
        ; ControlSetText(move_folder, "Edit2", "A")
        ; Sleep 333
        ; ControlSend("{Enter}", "Edit2", "A")
        SetCapsLockState("Off")
    }
#HotIf


#HotIf CheckWindowActive("Telegram" , "" , "Telegraph")

    CapsLock::
    NumLock::
    AppsKey::
    {
        MouseClickTool(window.w - 40, 60, "Window", "Left")
        Sleep 111
        Send "{Down}"
        Sleep 33
        Send "{Enter}"
    }
    NumpadHome::WinClose("A")
    NumpadEnd::WinClose("A")
    Shift::WinClose("A")

#HotIf


#HotIf CheckWindowActive("Telegram")

    ; F1::{
    ;     MouseClickTool(753, 81, "Screen")
    ;     Sleep 666
    ;     MouseClickTool(864, 770, "Screen")
    ; }

    ; F2::{
    ;     MouseClickTool(2505, 1383, "Screen")
    ; }

    ; CapsLock::{
    ;     title := window.title
    ;     Send "^f"
    ;     Send title
    ; }

    ~*LButton::{
        try {
            Telegram.LastTitle := WinGetTitle("A")
        }
    }

    NumLock::   Send "{Esc}"
    NumpadHome::Send "^c"
    NumpadEnd:: Send "^v"
    NumpadPgDn::Send "{Enter}"
    NumpadPgUp::TG_forward_saved_message()
    NumpadIns:: Send "^{PgDn}"
    NumpadDel:: Send "^{PgUp}"

    #BackSpace::Return
    #+BackSpace::Return

    <#p::
    <#\::
    <#+\::
    <#[::
    <#]::
    <#+[::
    <#+]::
    {
        Send "{Blind}{vkFF}"
        if ( window.title == "SavedMessages" && InStr(A_ThisHotkey, "#\") ) {
            MoveWindowPosition( Position("[Center][2]", -20, 0.7) )
            return
        } else if ( window.title == "Telegraph" && InStr(A_ThisHotkey, "#\") ) {
            MoveWindowPosition( Position(2222, 1234) )
            return
        }
        offset := 12
        hight  := Screen1.h - offset * 2
        left_mian   := Screen1.w * 17/25 - offset * 1.5
        right_mini  := Screen1.w *  8/25 - offset * 1.5
        left_split  := Screen1.w *   1/2 - offset * 1.5
        right_split := Screen1.w *   1/2 - offset * 1.5
        if ( InStr(A_ThisHotkey, "#\") )
            pos := Position( "[Center][1]", Screen1.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "#+\") )
            pos := Position( "[Center][2]", Screen2.w - offset , Screen2.h * 3/5 )
        if ( InStr(A_ThisHotkey, "#p") )
            pos := Position( offset , "Center" , Screen.w - offset * 2 , hight )
        if ( InStr(A_ThisHotkey, "#[") )
            pos := Position( offset , "Center" , left_mian , hight )
        if ( InStr(A_ThisHotkey, "#]") )
            pos := Position( Screen1.w - right_mini - offset , "Center" , right_mini , hight )
        if ( InStr(A_ThisHotkey, "#+[") )
            pos := Position( offset , "Center" , left_split , hight )
        if ( InStr(A_ThisHotkey, "#+]") )
            pos := Position( Screen1.w - right_split - offset , "Center" , right_split , hight )
        MoveWindowPosition(pos)
    }

#HotIf


TG_forward_saved_message()
{
    Send "{RButton}"
    Sleep 333
    image := A_InitialWorkingDir . "\Image\Software\Telegram\forward.png"
    MouseClickImage(image)
    Sleep 333
    image := A_InitialWorkingDir . "\Image\Software\Telegram\saved_message.png"
    MouseClickImage(image)
}

TG_saved_file()
{
    Send "{RButton}"
    Sleep 99
    image := A_InitialWorkingDir . "\Image\Software\Telegram\save_file.png"
    MouseClickImage(image)
}
