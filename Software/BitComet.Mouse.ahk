
; 文件名称排序
NumpadHome::{
    SetControlDelay -1
    ControlClick "SysHeader321", "A"
}

; 全选
NumpadEnd::{
    ControlSetChecked True, "Button5", "A"
}

; 快速选择路径
NumpadPgUp::
NumpadPgDn::{
    SetControlDelay -1
    ControlClick "wxWindow1", "A"
    if InStr(A_ThisHotkey, "NumpadPgUp")
        Send "{Down}"
    if InStr(A_ThisHotkey, "NumpadPgDn")
        Send "{Up}"
}

; 文件大小排序
NumpadIns::MouseClickAndResetting(1094, 404, "Window")

; 选择下载文件夹
NumpadDel::{
    SetControlDelay -1
    ControlClick "Button2", "A"
}

~RButton::SetListView()
