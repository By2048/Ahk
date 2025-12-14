
UnZipPath := [ Folders.Temp , Folders.Ram ]

#Include *i Zip.Tool.Private.ahk


ZipSetPassword(password) {
    ControlSetText(password, "Edit3", "A")
}
ZipSetPath(path) {
    path := StrReplace(path, "\\", "\")
    ControlSetText(path, "Edit1", "A")
}
ZipSetPathPrev() {
    path := ControlGetText("Edit1", "A")
    path := LoopList(UnZipPath, path, -1)
    ZipSetPath(path)
}
ZipSetPathNext() {
    path := ControlGetText("Edit1", "A")
    path := LoopList(UnZipPath, path, +1)
    ZipSetPath(path)
}


ZipSetGuiText() 
{
    ctl_folder := "Edit2"
    title := StrLower(window.title)
    rule  := "ahk_id " window.id
    name  := ControlGetText(ctl_folder, rule)

    #Include *i Zip.AutoGuiText.Private.ahk

    rename := FileRename(name)
    rename := RTrim(rename, "\")
    rename := RTrim(rename, " ")
    ControlSetText(rename, ctl_folder, rule)
    ControlFocus(ctl_folder, rule)
    Send "{End}"
}


ZipSetGuiPos()
{
    GetActiveWindowInfo(False)

    SetControlDelay(-1)

    rule := "ahk_id " window.id

    ctl_path_info      := "Static1"
    ctl_path_input     := "Edit1"
    ctl_path_combobox  := "ComboBox1"
    ctl_path_select    := "Button1"

    ctl_folder_check := "Button2"
    ctl_folder_input := "Edit2"

    ctl_mode_info   := "Static2"
    ctl_mode_select := "ComboBox2"

    ctl_over_info   := "Static3"
    ctl_over_select := "ComboBox3"

    ctl_password_input := "Edit3"
    ctl_password_wrap  := "Button4"
    ctl_password_check := "Button5"

    ctl_repeat   := "Button3"
    ctl_security := "Button6"

    ctl_yes            := "Button7"
    ctl_no             := "Button8"
    ctl_help           := "Button9"

    ; --------------------------------------------------------------------------------- ;

    if ( ! InStr( ControlGetText(ctl_path_info, rule) , "X" ) )
        return

    ControlSetText("解压到", ctl_path_info, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_path_input%.x + 60
    ctl_y := window.controls.%ctl_path_input%.y - 35 - 10
    ctl_w := window.controls.%ctl_path_input%.w - 60
    ctl_h := window.controls.%ctl_path_input%.h + 90
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_path_input, rule)
    
    ctl_x := window.controls.%ctl_path_combobox%.x + 60
    ctl_y := window.controls.%ctl_path_combobox%.y - 35
    ctl_w := window.controls.%ctl_path_combobox%.w - 60
    ctl_h := window.controls.%ctl_path_combobox%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_path_combobox, rule)
    
    ctl_x := window.controls.%ctl_path_select%.x
    ctl_y := window.controls.%ctl_path_select%.y - 35
    ctl_w := window.controls.%ctl_path_select%.w
    ctl_h := window.controls.%ctl_path_select%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_path_select, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_folder_check%.x
    ctl_y := window.controls.%ctl_folder_check%.y - 33
    ctl_w := window.controls.%ctl_folder_check%.w
    ctl_h := window.controls.%ctl_folder_check%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_folder_check, rule)
    
    ctl_x := window.controls.%ctl_folder_input%.x
    ctl_y := window.controls.%ctl_folder_input%.y - 33
    ctl_w := window.controls.%ctl_path_input%.w   + 70
    ctl_h := window.controls.%ctl_folder_input%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_folder_input, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_mode_info%.x
    ctl_y := window.controls.%ctl_mode_info%.y - 10
    ctl_w := window.controls.%ctl_mode_info%.w
    ctl_h := window.controls.%ctl_mode_info%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_mode_info, rule)
    
    ctl_x := window.controls.%ctl_mode_select%.x + 90
    ctl_y := window.controls.%ctl_mode_select%.y - 45
    ctl_w := window.controls.%ctl_mode_select%.w - 90
    ctl_h := window.controls.%ctl_mode_select%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_mode_select, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_over_info%.x
    ctl_y := window.controls.%ctl_over_info%.y - 95
    ctl_w := window.controls.%ctl_over_info%.w
    ctl_h := window.controls.%ctl_over_info%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_over_info, rule)
    
    ctl_x := window.controls.%ctl_over_select%.x + 90
    ctl_y := window.controls.%ctl_over_select%.y - 130
    ctl_w := window.controls.%ctl_over_select%.w - 90
    ctl_h := window.controls.%ctl_over_select%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_over_select, rule)
    
    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_password_wrap%.x
    ctl_y := window.controls.%ctl_password_wrap%.y + 10
    ctl_w := window.controls.%ctl_password_wrap%.w 
    ctl_h := window.controls.%ctl_password_wrap%.h - 10
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_wrap, rule)

    ctl_x := window.controls.%ctl_password_input%.x
    ctl_y := window.controls.%ctl_password_input%.y + 10
    ctl_w := window.controls.%ctl_password_input%.w
    ctl_h := window.controls.%ctl_password_input%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_input, rule)

    ctl_x := window.controls.%ctl_password_check%.x
    ctl_y := window.controls.%ctl_password_check%.y + 10
    ctl_w := window.controls.%ctl_password_check%.w
    ctl_h := window.controls.%ctl_password_check%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_check, rule)

    ; --------------------------------------------------------------------------------- ;
        
    ctl_x := 20
    ctl_y := window.controls.%ctl_repeat%.y + 10
    ctl_w := window.controls.%ctl_repeat%.w - 90
    ctl_h := window.controls.%ctl_repeat%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_repeat, rule)

    ctl_x := 20
    ctl_y := window.controls.%ctl_security%.y
    ctl_w := window.controls.%ctl_security%.w 
    ctl_h := window.controls.%ctl_security%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_security, rule)
    
    ; --------------------------------------------------------------------------------- ;

    ControlHide(ctl_help, rule)
    
    ctl_x := window.controls.%ctl_help%.x
    ctl_y := window.controls.%ctl_help%.y - 130
    ctl_w := window.controls.%ctl_yes%.w 
    ctl_h := window.controls.%ctl_yes%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_yes, rule)
    
    ctl_x := window.controls.%ctl_no%.x
    ctl_y := window.controls.%ctl_no%.y - 130
    ctl_w := window.controls.%ctl_no%.w 
    ctl_h := window.controls.%ctl_no%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_no, rule)
    
    ; --------------------------------------------------------------------------------- ;
    
    x := window.x
    y := window.y
    w := window.w
    h := window.h - 130
    SetWindow(x, y, w, h)

    WinRedraw(rule)

    ControlFocus(ctl_yes, rule)
}
