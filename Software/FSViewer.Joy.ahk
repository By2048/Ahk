
; 上
Numpad8::
{
    Send "{Right}"
}

; 下
Numpad2::
{
    Send "{Left}"
}

; 左
Numpad4::
{
    Send "{Right}"
    Sleep 99
}

; 右
Numpad6::
{
    Send "{Right}"
    Sleep 33
}

;---------------------------------;

; 上
Numpad9::fsviewer_delete_folder()

; 下
Numpad3::fsviewer_move_to_collection(FSViewerCollection.Collection)

; 左
Numpad7::fsviewer_move_to_collection(FSViewerCollection.CartoonOther)

; 右
Numpad1::fsviewer_move_to_collection(FSViewerCollection.Cartoon)

;---------------------------------;

NumpadAdd:: Send "!{Right}"

NumpadMult::Send "{Home}"

NumpadDiv:: Send "{End}"

NumpadSub:: Send "!{Left}"
