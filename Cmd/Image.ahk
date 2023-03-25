
#Include ..\Config.ahk
#Include ..\Config\Screen.ahk
#Include ..\Config\Software.ahk
#Include ..\Tool\Global.ahk
#Include ..\Tool\File.ahk

#SingleInstance Force

If (A_Args.Length != 1) {
    MsgBox "未传入图片路径"
    Exit
}

image := A_Args[1]

If (Not InStr(image, ":")) {
    image := LTrim(image, ".\")
    image := A_InitialWorkingDir . "\" . image
}

scale := 0.98

size := GetImageSize(image)
image_w := size.w
image_h := size.h
If (size.w > Screen.w) {
    image_w := Screen.w * scale
    image_h := "-1"
}
If (size.h > Screen.h) {
    image_h := Screen.h * scale
    image_w := "-1"
}
If (size.w > Screen.w and size.h > Screen.h) {
    scale_w := size.w / Screen.w
    scale_h := size.h / Screen.h
    scale_max := 1 / Max(scale_w, scale_h)
    image_w := size.w * scale_max * scale
    image_h := size.h * scale_max * scale
}

G := Gui()
G.Opt("-DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
G.MarginX := 1
G.MarginY := 1
G.Add("Picture", Format("+Border w{1} h{2}", image_w, image_h), image)
G.Show("Center NA")

\::
Enter::
RShift::{
    ExitApp
}
