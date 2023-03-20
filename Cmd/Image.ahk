
#Include E:\Project\Ahk\

#Include Config.ahk
#Include Config\Screen.ahk

#Include Config\All.ahk
#Include Config\Init.ahk
#Include Config\Init.ahk
#Include Config\KeyMap.ahk
#Include Config\Message.ahk
#Include Config\Position.ahk
#Include Config\Software.ahk

#Include Tool\Global.ahk
#Include Tool\File.ahk
#Include Tool\Change.ahk
#Include Tool\Help.ahk
#Include Tool\Other.ahk
#Include Tool\Window.ahk
#Include Tool\Language.ahk


If (A_Args.Length != 1) {
    MsgBox "未传入图片路径"
    Exit
}

image := A_Args[1]
image := LTrim(image, ".\")
image := A_InitialWorkingDir . image

size := GetImageSize(image)
image_w := size.w
image_h := size.h

If (image_w > Screen.w) {
    w := "-1"
    h := image_h
}
If (image_h > Screen.h) {
    w := image_w
    h := "-1"
}
If (image_w > Screen.w and image_h > Screen.h) {
    w := Screen.w
    h := "-1"
}

G := Gui()
G.Opt("-DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
G.MarginX := 1
G.MarginY := 1
G.Add("Picture", Format("+Border w{1} h{2}", w, h), image)
G.Show("Center NA")

RShift::ExitApp
