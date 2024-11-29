
#SingleInstance Force


$\::
Esc::
Enter::
BackSpace::
AppsKey::
RShift::{
    Send "{Blind}{vkFF}"
    ExitApp()
}

scale := 0.98

border := 0

;--------------------------------------------------------------------------------;

if ( A_Args.Length != 1 ) {
    MsgBox("传入参数错误")
    ExitApp()
}

image := A_Args[1]

if ( ! image ) {
    MsgBox("未传入图片路径")
    ExitApp()
}

; 不是绝对路径 是相对路径
if ( ! InStr(image, ":") ) {
    image := LTrim(image, ".\")
    image := A_InitialWorkingDir . "\" . image
}

if ( ! FileExist(image) ) {
    MsgBox("未传入图片路径")
    ExitApp()
}

check := False
stems := "png jpg jpeg bmp gif"
for stem In StrSplit(stems, " ") {
    if ( InStr(image, stem) ) {
        check := True
        break
    }
}

if ( ! check ) {
    MsgBox("未传入图片路径")
    ExitApp()
}

image := Trim(image, "`'")

G := Gui()
G.MarginX := 1
G.MarginY := 1
G.Opt("-DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption -Border")
GPic := G.Add("Picture", format("+Border"), image)
GPic.GetPos(&_, &_, &image_w, &image_h)

if ( ! image_w ) || ( ! image_h )
    ExitApp()

scale_wh := 1
if ( image_w > A_ScreenWidth && image_h > A_ScreenHeight )
    scale_wh := Min(A_ScreenWidth / image_w, A_ScreenHeight / image_h)
else if ( image_w > A_ScreenWidth )
    scale_wh := A_ScreenWidth / image_w
else if ( image_h > A_ScreenHeight )
    scale_wh := A_ScreenHeight / image_h

image_w := image_w * scale_wh * scale
image_h := image_h * scale_wh * scale
image_w := Round(image_w)
image_h := Round(image_h)

GPic.Move(border, border, image_w, image_h)

G.Show(Format("w{} h{} Center NA ", image_w + border * 2, image_h + border * 2))
