
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
image := LTrim(image, ".\")
image := A_InitialWorkingDir . image

size := GetImageSize(image)
image_w := size.w
image_h := size.h
If (size.w > Screen.w) {
    image_w := "-1"
    image_h := size.h
}
If (size.h > Screen.h) {
    image_w := size.w
    image_h := "-1"
}
If (size.w > Screen.w and size.h > Screen.h) {
    image_w := Screen.w * 0.97
    image_h := "-1"
}

G := Gui()
G.Opt("-DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
G.MarginX := 1
G.MarginY := 1
G.Add("Picture", Format("+Border w{1} h{2}", image_w, image_h), image)
G.Show("Center NA")

RShift::ExitApp
