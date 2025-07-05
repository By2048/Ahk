
UnZipPath := [ Folders.Temp , Folders.Ram ]

ZipSetPassword(password) {
    ControlSetText(password, "Edit3", "A")
}
ZipSetPath(path) {
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


ZipSetName()
{
    name   := ControlGetText("Edit2", "A")
    rename := FileRename(name)
    rename := Trim(rename)
    ControlSetText(rename, "Edit2", "A")
    ControlFocus("Edit2", "A")
    Send "{End}"
}


ZipSetGui()
{
    GetActiveWindowInfo(False)

    SetControlDelay(-1)

    rule := "ahk_id " window.id

    ctl_path           := "Edit1"
    ctl_folder         := "Edit2"
    ctl_password_input := "Edit3"
    ctl_password_wrap  := "Button4"
    ctl_password_check := "Button5"
    ctl_security       := "Button6"
    ctl_yes            := "Button7"
    ctl_no             := "Button8"
    ctl_help           := "Button9"

    if ( Abs(window.controls.%ctl_path%.w - window.controls.%ctl_folder%.w) < 99 )
        return

    ctl_x := window.controls.%ctl_path%.x
    ctl_y := window.controls.%ctl_path%.y
    ctl_w := window.controls.%ctl_path%.w
    ctl_h := window.controls.%ctl_path%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_path, rule)

    ctl_x := window.controls.%ctl_folder%.x
    ctl_y := window.controls.%ctl_folder%.y
    ctl_w := window.controls.%ctl_path%.w   + 70
    ctl_h := window.controls.%ctl_folder%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_folder, rule)

    ; --------------------------------------------------------------------------------- ;
    
    ctl_x := window.controls.%ctl_security%.x
    ctl_y := window.controls.%ctl_security%.y + 35
    ctl_w := window.controls.%ctl_security%.w
    ctl_h := window.controls.%ctl_security%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_security, rule)
    
    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ctl_password_check%.x
    ctl_y := window.controls.%ctl_password_check%.y + 50
    ctl_w := window.controls.%ctl_password_check%.w
    ctl_h := window.controls.%ctl_password_check%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_check, rule)

    ctl_x := window.controls.%ctl_password_input%.x
    ctl_y := window.controls.%ctl_password_input%.y + 50
    ctl_w := window.controls.%ctl_password_input%.w
    ctl_h := window.controls.%ctl_password_input%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_input, rule)

    ctl_x := window.controls.%ctl_password_wrap%.x
    ctl_y := window.controls.%ctl_password_wrap%.y + 50
    ctl_w := window.controls.%ctl_password_wrap%.w 
    ctl_h := window.controls.%ctl_password_wrap%.h - 10
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_password_wrap, rule)
    
    ; --------------------------------------------------------------------------------- ;
    
    ; 确定 取消 帮助
    ctl_x := window.controls.%ctl_path%.x - 5
    ctl_y := window.controls.%ctl_help%.y - 40
    ctl_w := window.controls.%ctl_help%.w 
    ctl_h := window.controls.%ctl_help%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_help, rule)
    
    ctl_x := window.controls.%ctl_help%.x
    ctl_y := window.controls.%ctl_help%.y - 40
    ctl_w := window.controls.%ctl_yes%.w 
    ctl_h := window.controls.%ctl_yes%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_yes, rule)
    
    ctl_x := window.controls.%ctl_no%.x
    ctl_y := window.controls.%ctl_no%.y - 40
    ctl_w := window.controls.%ctl_no%.w 
    ctl_h := window.controls.%ctl_no%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ctl_no, rule)
    
    ; --------------------------------------------------------------------------------- ;

    x := window.x
    y := window.y
    w := window.w
    h := window.h - 40
    SetWindow(x, y, w, h)

    ControlFocus(ctl_yes, rule)
    
    ControlSetText(RTrim(ControlGetText(ctl_folder, rule), "\"), ctl_folder, rule)  

    #Include *i Zip.Tool.Snippet.ahk

}
