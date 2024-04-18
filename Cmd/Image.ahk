
#SingleInstance Force

image := ""

if (not image and A_Args.Length != 1) {
    MsgBox "未传入图片路径"
    ExitApp
}

if A_Args.Length == 1
    image := A_Args[1]

; 不是绝对路径 是相对路径
if (not InStr(image, ":")) {
    image := LTrim(image, ".\")
    image := A_InitialWorkingDir . "\" . image
}

if (not FileExist(image)) {
    MsgBox "未传入图片路径"
    ExitApp
}

check := False
stems := "png jpg jpeg bmp gif"
for stem In StrSplit(stems, " ") {
    if InStr(image, stem) {
        check := True
        break
    }
}

if (not check) {
    MsgBox "未传入图片路径"
    ExitApp
}

scale := 0.98

image := Format("'{}'", image)
command := "D:\Git\usr\bin\file.exe" . " " . image
result := ComObject("WScript.Shell").Exec(command).StdOut.ReadAll()
result := StrReplace(result, " x ", "x")
find_pos := RegExmatch(result, ", (\d+x\d+),", &find_result)

if not find_pos
    ExitApp

if (find_pos) {
    size_wh := StrSplit(find_result[1], "x")
    image_w := size_wh[1]
    image_h := size_wh[2]
}
if (not image_w OR not image_h)
    ExitApp

if InStr(image, ".jpg") and InStr(result, "PNG image data") {
    old_file := image
    new_file := StrReplace(image, ".jpg", ".png")
    if not FileExist(new_file)
        FileMove old_file, new_file
}

if (image_w > A_ScreenWidth and image_h > A_ScreenHeight) {
    scale_w := image_w / A_ScreenWidth
    scale_h := image_h / A_ScreenHeight
    scale_max := 1 / Max(scale_w, scale_h)
    image_w := image_w * scale_max * scale
    image_h := image_h * scale_max * scale
    image_w := Round(image_w)
    image_h := Round(image_h)
} else if (image_w > A_ScreenWidth) {
    image_w := A_ScreenWidth * scale
    image_w := Round(image_w)
    image_h := "-1"
} else if (image_h > A_ScreenHeight) {
    image_h := A_ScreenHeight * scale
    image_h := Round(image_h)
    image_w := "-1"
}

G := Gui()
G.Opt("-DPIScale +AlwaysOnTop +Disabled +Owner -SysMenu -Caption")
G.MarginX := 1
G.MarginY := 1
try {
    image := Trim(image, "`'")
    G.Add("Picture", format("+Border w{1} h{2}", image_w, image_h), image)
} catch {
    MsgBox "加载图片失败"
}
G.Show("Center NA")

\::
Esc::
Enter::
CapsLock::
BackSpace::
AppsKey::
RShift::{
    SetCapsLockState "Off"
    ExitApp
}
