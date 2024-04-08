
; 文件名称排序
F2::{
    SetControlDelay -1
    ControlClick "SysHeader321", "A"
}

; 全选
F3::{
    ControlSetChecked True, "Button5", "A"
}

; 快速选择路径
F6::
F7::{
    SetControlDelay -1
    ControlClick "wxWindow1", "A"
    if InStr(A_ThisHotkey, "F6")
        Send "{Down}"
    if InStr(A_ThisHotkey, "F7")
        Send "{Up}"
}

; 文件大小排序
F10::MouseClickAndResetting(1094, 404, "Window")

; 选择下载文件夹
F11::{
    SetControlDelay -1
    ControlClick "Button2", "A"
}

~RButton::SetListView()
