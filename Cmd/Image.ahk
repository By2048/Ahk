
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

x := Screen.x + (Screen.w - image_w) / 2
y := Screen.y + (Screen.h - image_h) / 2
x := Round(x)
y := Round(y)

cmd := Format("{1} paste --files {} --pos {} {}", Snipaste, image, x, y)
Run cmd
