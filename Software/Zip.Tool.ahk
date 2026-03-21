
UnZipPath := [ LN("Temp") , LN("Cache") ]


#Include *i Zip.Tool.Private.ahk


ZipSetName(password) {
    ControlSetText(password, ZipControl.EditFolderName, "A")
}
ZipSetPassword(password) {
    ControlSetText(password, ZipControl.EditPassword, "A")
}
ZipSetPath(path) {
    path := StrReplace(path, "\\", "\")
    ControlSetText(path, ZipControl.EditFolderPath, "A")
}
ZipSetPathPrev() {
    path := ControlGetText(ZipControl.EditFolderPath, "A")
    path := LoopList(UnZipPath, path, -1)
    ZipSetPath(path)
}
ZipSetPathNext() {
    path := ControlGetText(ZipControl.EditFolderPath, "A")
    path := LoopList(UnZipPath, path, +1)
    ZipSetPath(path)
}


ZipGuiInit()
{
    if ( InStr(window.title, "确认文件替换") ) {
        MoveWindowPosition( Position(820,588) )
        ControlGetPos(&x, &y, &w, &h, ZipControl.ReplaceFile.ButtonRename, "A")
        ControlMove(x,  , w, h, ZipControl.ReplaceFile.ButtonCancel, "A")
        ControlFocus(ZipControl.ReplaceFile.ButtonCancel, "A")
        ControlSend("{Tab}", ZipControl.ReplaceFile.ButtonNoAll, "A")
    }
    if ( InStr(window.title, "解压") ) {
        ZipSetGuiPos()
        ZipSetGuiText()
        return
    }
}


ZipSetGuiText()
{
    title := StrLower(window.title)
    rule  := "ahk_id " window.id
    name  := ControlGetText(ZipControl.EditFolderName, rule)

    #Include *i Zip.Tool.Auto.Private.ahk

    rename := FileRename(name)
    rename := RTrim(rename, "\")
    rename := RTrim(rename, " ")
    ControlSetText(rename, ZipControl.EditFolderName, rule)
    ControlFocus(ZipControl.EditFolderName, rule)
    Send "{End}"
}


ZipSetGuiPos()
{
    GetActiveWindowInfo(False)

    SetControlDelay(-1)

    rule := "ahk_id " window.id

    ; --------------------------------------------------------------------------------- ;

    if ( ! InStr( ControlGetText(ZipControl.StaticUnzipTo, rule) , "X" ) )
        return

    ControlSetText("解压到", ZipControl.StaticUnzipTo, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ZipControl.EditFolderPath%.x + 60
    ctl_y := window.controls.%ZipControl.EditFolderPath%.y - 35 - 10
    ctl_w := window.controls.%ZipControl.EditFolderPath%.w - 60
    ctl_h := window.controls.%ZipControl.EditFolderPath%.h + 90
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.EditFolderPath, rule)

    ctl_x := window.controls.%ZipControl.ComboBoxFolderPath%.x + 60
    ctl_y := window.controls.%ZipControl.ComboBoxFolderPath%.y - 35
    ctl_w := window.controls.%ZipControl.ComboBoxFolderPath%.w - 60
    ctl_h := window.controls.%ZipControl.ComboBoxFolderPath%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ComboBoxFolderPath, rule)

    ctl_x := window.controls.%ZipControl.ButtonSelectPath%.x
    ctl_y := window.controls.%ZipControl.ButtonSelectPath%.y - 35
    ctl_w := window.controls.%ZipControl.ButtonSelectPath%.w
    ctl_h := window.controls.%ZipControl.ButtonSelectPath%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonSelectPath, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ZipControl.ButtonUserFolder%.x
    ctl_y := window.controls.%ZipControl.ButtonUserFolder%.y - 33
    ctl_w := window.controls.%ZipControl.ButtonUserFolder%.w
    ctl_h := window.controls.%ZipControl.ButtonUserFolder%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonUserFolder, rule)

    ctl_x := window.controls.%ZipControl.EditFolderName%.x
    ctl_y := window.controls.%ZipControl.EditFolderName%.y - 33
    ctl_w := window.controls.%ZipControl.EditFolderPath%.w   + 70
    ctl_h := window.controls.%ZipControl.EditFolderName%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.EditFolderName, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ZipControl.StaticPathMode%.x
    ctl_y := window.controls.%ZipControl.StaticPathMode%.y - 10
    ctl_w := window.controls.%ZipControl.StaticPathMode%.w
    ctl_h := window.controls.%ZipControl.StaticPathMode%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.StaticPathMode, rule)

    ctl_x := window.controls.%ZipControl.ComboBoxPathMode%.x + 90
    ctl_y := window.controls.%ZipControl.ComboBoxPathMode%.y - 45
    ctl_w := window.controls.%ZipControl.ComboBoxPathMode%.w - 90
    ctl_h := window.controls.%ZipControl.ComboBoxPathMode%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ComboBoxPathMode, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ZipControl.StaticOverMode%.x
    ctl_y := window.controls.%ZipControl.StaticOverMode%.y - 95
    ctl_w := window.controls.%ZipControl.StaticOverMode%.w
    ctl_h := window.controls.%ZipControl.StaticOverMode%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.StaticOverMode, rule)

    ctl_x := window.controls.%ZipControl.ComboBoxOverMode%.x + 90
    ctl_y := window.controls.%ZipControl.ComboBoxOverMode%.y - 130
    ctl_w := window.controls.%ZipControl.ComboBoxOverMode%.w - 90
    ctl_h := window.controls.%ZipControl.ComboBoxOverMode%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ComboBoxOverMode, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := window.controls.%ZipControl.ButtonPasswordWrap%.x
    ctl_y := window.controls.%ZipControl.ButtonPasswordWrap%.y + 10
    ctl_w := window.controls.%ZipControl.ButtonPasswordWrap%.w
    ctl_h := window.controls.%ZipControl.ButtonPasswordWrap%.h - 10
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonPasswordWrap, rule)

    ctl_x := window.controls.%ZipControl.EditPassword%.x
    ctl_y := window.controls.%ZipControl.EditPassword%.y + 10
    ctl_w := window.controls.%ZipControl.EditPassword%.w
    ctl_h := window.controls.%ZipControl.EditPassword%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.EditPassword, rule)

    ctl_x := window.controls.%ZipControl.ButtonShowPassword%.x
    ctl_y := window.controls.%ZipControl.ButtonShowPassword%.y + 10
    ctl_w := window.controls.%ZipControl.ButtonShowPassword%.w
    ctl_h := window.controls.%ZipControl.ButtonShowPassword%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonShowPassword, rule)

    ; --------------------------------------------------------------------------------- ;

    ctl_x := 20
    ctl_y := window.controls.%ZipControl.ButtonIgnoreRepeatFolder%.y + 10
    ctl_w := window.controls.%ZipControl.ButtonIgnoreRepeatFolder%.w - 90
    ctl_h := window.controls.%ZipControl.ButtonIgnoreRepeatFolder%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonIgnoreRepeatFolder, rule)

    ctl_x := 20
    ctl_y := window.controls.%ZipControl.ButtonRestoreSecurity%.y
    ctl_w := window.controls.%ZipControl.ButtonRestoreSecurity%.w
    ctl_h := window.controls.%ZipControl.ButtonRestoreSecurity%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonRestoreSecurity, rule)

    ; --------------------------------------------------------------------------------- ;

    ControlHide(ZipControl.ButtonHelp, rule)

    ctl_x := window.controls.%ZipControl.ButtonHelp%.x
    ctl_y := window.controls.%ZipControl.ButtonHelp%.y - 130
    ctl_w := window.controls.%ZipControl.ButtonYes%.w
    ctl_h := window.controls.%ZipControl.ButtonYes%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonYes, rule)

    ctl_x := window.controls.%ZipControl.ButtonNo%.x
    ctl_y := window.controls.%ZipControl.ButtonNo%.y - 130
    ctl_w := window.controls.%ZipControl.ButtonNo%.w
    ctl_h := window.controls.%ZipControl.ButtonNo%.h
    ControlMove(ctl_x, ctl_y, ctl_w, ctl_h, ZipControl.ButtonNo, rule)

    ; --------------------------------------------------------------------------------- ;

    x := window.x
    y := window.y
    w := window.w
    h := window.h - 130
    SetWindow(x, y, w, h)

    WinRedraw(rule)

    ControlFocus(ZipControl.ButtonYes, rule)
}
