
; 软件中控件的列宽
SetColumnWidth(control, config)
{
    if ( ! control ) || ( ! config )
        return
    if ( ! window.id )
        return
    rule := "ahk_id " . window.id
    for ( index, width in config ) {
        index := index - 1
        width := Round(width)
        SendMessage(Message.LVM_SETCOLUMNWIDTH, index, width, control, rule)
    }
}


SetEditPrefix(control)
{
    key := StrReplace(A_ThisHotkey, "~", "")
    key := StrReplace(A_ThisHotkey, "<", "")
    key := StrReplace(A_ThisHotkey, ">", "")
    if ( ! Folders.Prefix.Has(key) )
        return
    text := ControlGetText(control, "A")
    if ( ! text )
        return
    for ( _key, _code in Folders.Prefix )
        text := LTrim(text, _code)
    if ( GetKeyState("LAlt") ) {
        text := Format("{1} {2}", Folders.Prefix.Get(key), LTrim(text))
    } else if ( GetKeyState("RAlt") ) {
        text := Format("{2} {1}", Folders.Prefix.Get(key), LTrim(text))
    } else {
        text := Format("{1} {2}", Folders.Prefix.Get(key), LTrim(text))
    }
    text := Trim(text)
    ControlSetText(text, control, "A")
    if ( InStr(key, "Esc") )
        ControlSend("{End}", control, "A")
    else
        ControlSend("{Home}{Right 2}", control, "A")
}
