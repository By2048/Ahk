
fsviewer_refresh_image()
{
    if ( FSViewer.refresh == -1 )
        return
    if ( FSViewer.refresh == 0 ) {
        if ( FileExist("V:\#Cache\%Image\(0First0).png") )
            FSViewer.refresh := 1
        else
            FSViewer.refresh := -1
    }
    Arg.backslash_cnt := Arg.backslash_cnt + 1
    if ( Arg.backslash_cnt <= 5 )
        Send "{F5}"
    else if ( Mod(Arg.backslash_cnt, 3) == 0 )
        Send "{F5}"
    ; if ( Arg.backslash_cnt < 22 && Mod(Arg.backslash_cnt, 3) == 0 )
        ; Send "{F5}"
    ; if ( Arg.backslash_cnt < 99 && Mod(Arg.backslash_cnt, 7) == 0 )
        ; Send "{F5}"
    ; if ( (Arg.sh_cnt, 11) == 0 )
        ; Send "{F5}"
}


fsviewer_powershell_switch()
{
    rule := "ahk_exe psl.exe"
    if ( ! WinExist(rule) ) {
        FSViewer.move_win_top_bottom := "None"
        FSViewer.refresh := -1
        return
    }
    if ( FSViewer.move_win_top_bottom == "None" ) {
        WinMoveTop(rule)
        FSViewer.move_win_top_bottom := "Top"
    } else if ( FSViewer.move_win_top_bottom == "Top" ) {
        WinMoveBottom(rule)
        FSViewer.move_win_top_bottom := "Bottom"
    } else if ( FSViewer.move_win_top_bottom == "Bottom" ) {
        WinMoveTop(rule)
        FSViewer.move_win_top_bottom := "Top"
    } else {
        WinMoveTop(rule)
        FSViewer.move_win_top_bottom := "Top"
    }
}


fsviewer_activate_left_menu()
{
    CoordMode("Mouse", "Window")

    ctl := "TJamShellTree.UnicodeClass1"

    ctl_offset_x := -33
    ctl_offset_y := 55
    ctl_x := window.controls.%ctl%.x
    ctl_y := window.controls.%ctl%.y
    ctl_w := window.controls.%ctl%.w
    ctl_h := window.controls.%ctl%.h

    pos_x := ctl_x + ctl_w + ctl_offset_x
    pos_y := ctl_y + ctl_offset_y

    color := SubStr( PixelGetColor(pos_x, pos_y) , -6)
    if ( color != "404040" )
        return

    ControlFocus(ctl, "A")

    ; #Include *i %A_InitialWorkingDir%\Config\Debug.ahk
    ; OutputDebug ctl_x "|" ctl_y "|" ctl_w "|" ctl_h
    ; DebugGuiControl(ctl_x, ctl_y, ctl_w, ctl_h)
    ; MouseMove(pos_x, pos_y, 0)

    MouseGetPos(&mouse_x, &mouse_y)

    MouseClick("Left", pos_x, pos_y , 1, 0)

    Send "^{Left 5}"
    Send "{AppsKey}"

    MouseMove(mouse_x, mouse_y, 0)
}


fsviewer_delete_folder()
{
    if ( CheckWindowActive("FSViewer", "TTntForm.UnicodeClass", "删除文件夹") ) {
        Send "!y"
        return
    }
    fsviewer_activate_left_menu()
    Send "{Up 4}{Enter}"
}


fsviewer_move_folder()
{
    fsviewer_activate_left_menu()
    Send "{Down 7}{Enter}"
}


fsviewer_move_folder_test()
{
    ctl_edit_folder := "TTntEdit.UnicodeClass1"
    ctl_btn_move    := "TMyButton.UnicodeClass4"
    fsviewer_activate_left_menu()
    Send "{Down 7}{Enter}"
    ; Send "^{Tab 3}"
    Sleep 123
    GetActiveWindowInfo(false)
    if ( ! ( InStr(window.title, "移动") && InStr(window.title, "到文件夹") ) )
        return
    folder_current := ControlGetText(ctl_edit_folder, "A")
    ControlSetText("V:\#\", ctl_edit_folder, "A")
    ControlFocus(ctl_btn_move, "A")
    ; MsgBox folder_current
}


fsviewer_move_to_collection(name:="")
{
    HelpText("`n  "  name "  `n", "CenterDown", "Screen")

    if ( ! InStr(name, ":\") )
        name := StrReplace(name, " ", "")

    EN()
    fsviewer_move_folder()
    Sleep 234

    ctl_edit_folder := "TTntEdit.UnicodeClass1"
    ctl_btn_move    := "TMyButton.UnicodeClass4"

    GetActiveWindowInfo(false)

    win_title := window.title
    if ( ! ( InStr(win_title, "移动") && InStr(win_title, "到文件夹") ) )
        return

    folder_name := RegExReplace(win_title, "(移动 `")(.*)(`" 到文件夹)", "$2")
    if ( folder_name == "#" || folder_name == "~" || folder_name == "~ ~ ~" )
        return
    if ( folder_name == "#Image" || folder_name == "%Image" || folder_name == "~Image")
        return

    if ( InStr(name, ":\") )
        folder_move := name
    else
        folder_move := FSViewer.Collection.Get(name)
    folder_current := ControlGetText(ctl_edit_folder, "A")
    ControlSetText(folder_move, ctl_edit_folder, "A")
    Sleep 123

    ControlFocus(ctl_btn_move, "A")
    ControlClick(ctl_btn_move, "A")

    Sleep 555
    HelpText()
}


fsviewer_move_position()
{
    Send "{Blind}{vkFF}"
    total_width     := A_ScreenWidth
    total_height    := A_ScreenHeight
    MoveWindowPosition(Position(total_width , total_height))

    if ( A_ThisHotkey == "#\" ) {
        folder_width    := 425
        thumbnail_width := 870
    } else if ( A_ThisHotkey == "#+\" ) {
        folder_width    := 700
        thumbnail_width := 150
    }

    window   := GetActiveWindowInfo(False)
    ctl_name := "TJamShellTree.UnicodeClass1"
    ctl_info := window.controls.%ctl_name%
    if ( Abs(ctl_info.w - folder_width) > 15 ) {
        MouseGetPos(&x_origin, &y_origin)
        MouseMove(ctl_info.w , ctl_info.y + ctl_info.h / 2)
        offset := GetOffset("X")
        MoveControlUDLR(ctl_info, "Right", folder_width, offset)
        MouseMove(x_origin, y_origin, 0)
    }

    window   := GetActiveWindowInfo(False)
    ctl_name := "TTntListView.UnicodeClass1"
    ctl_info := window.controls.%ctl_name%
    if ( Abs(ctl_info.w - thumbnail_width) > 10 ) {
        MouseGetPos(&x_origin, &y_origin)
        MouseMove(ctl_info.x + ctl_info.w , ctl_info.y + ctl_info.h / 2)
        offset := GetOffset("X")
        MoveControlUDLR(ctl_info, "Right", folder_width + thumbnail_width, offset)
        MouseMove(x_origin, y_origin, 0)
    }

    Send "{F10}"
    Send "{Right 4}{Enter}"
    Send "{Down 2}{Enter}"
    if ( A_ThisHotkey == "#\" )
        Send "{Enter}"
    else if ( A_ThisHotkey == "#+\" )
        Send "{Down 2}{Enter}"
}
