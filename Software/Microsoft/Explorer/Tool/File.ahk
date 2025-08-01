﻿
ErFlash()
{
    Sleep 333
    Loop 5 {
        Sleep 111
        Send "{Right}"
        Sleep 33
        Send "{Left}"
    }
}


ErDelete()
{
    Send "!y"
    Sleep 99
    Send "{Space}"
}


ErDeleteForever()
{
    Sleep 99
    Send "{Esc}"
    Sleep 33
    Send "+{Delete}"
    Sleep 66
    Send "!y"
    Sleep 99
    If WinWaitActive("ahk_exe explorer.exe ahk_class CabinetWClass", "", 3)
        Send "{Space}"
}


ErGetFocusedItem()
{
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! hwnd )
        return
    path := ""
    for Win in ComObject("Shell.Application").Windows
        if ( Win.hwnd == hwnd )
            path := Win.Document.FocusedItem.Path
    return path
}


ErGetSelectedItems()
{
    paths := []
    hwnd := WinActive("ahk_exe explorer.exe ahk_class CabinetWClass")
    if ( ! hwnd )
        return paths
    for Win in ComObject("Shell.Application").Windows
        if ( Win.hwnd == hwnd )
            for item in Win.Document.SelectedItems
                paths.Push(item.Path)
    return paths
}
