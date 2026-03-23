
RegisterSoftware( "FSViewer" , "FSViewer" )

RegisterHelpInfo( "FSViewer" , FilePath(A_LineFile, "FSViewer.help") )

RegisterPosition( "FSViewer_#32770_另存为" , Position(1414 , 1000) )
RegisterPosition( "FSViewer_TBatchConvert.UnicodeClass_批量转换*"    , Position(1800 , 1200) )


#Include *i FSViewer.Private.ahk


#HotIf CheckWindowActive( "FSViewer" , "" , " 批量转换* " )

    ; 小尺寸
    -::
    =::
    {
        ; 选择webp
        ControlClick("TTntComboBox.UnicodeClass2", "A")
        Sleep 333
        Send "{Down 9}"
        Send "{Enter}"
        Sleep 666
        ; 设置
        ControlClick("TMyButton.UnicodeClass4", "A")
        Sleep 666
        if ( A_ThisHotkey == "-" )
            ControlClick("TMyRadioButton.UnicodeClass2", "A") ; 90%
        if ( A_ThisHotkey == "=" )
            ControlClick("TMyRadioButton.UnicodeClass1", "A") ; 无损
        Sleep 333
        ControlClick("TMyButton.UnicodeClass3", "A") ; 确定
        Sleep 666
        ;
        ; 设置大小
        ControlClick("TMyButton.UnicodeClass3", "A") ; 高级属性
        Sleep 666
        if ( A_ThisHotkey == "-" )
            ControlClick("TMyRadioButton.UnicodeClass2", "A") ; 以一边为基础改变大小
        if ( A_ThisHotkey == "=" )
            ControlClick("TMyRadioButton.UnicodeClass3", "A") ; 百分比
        Sleep 333
        ControlClick("TMyButton.UnicodeClass5", "A") ; 确定
    }

    ; 转换图片为小图片
    F12::{
        folder_current := Trim( ControlGetText("TTntEdit.UnicodeClass1", "A") , "\" )
        folder_input   := "V:\#\#Image"
        folder_output  := "V:\#\~Image"
        if ( folder_current != folder_input ) {
            ControlSetText(folder_input,  "TTntEdit.UnicodeClass1", "A") ;文件夹 输入
            ControlSetText(folder_output, "TTntEdit.UnicodeClass2", "A") ;文件夹 输出
            ControlSend("{Enter}", "TTntEdit.UnicodeClass1", "A") ;确定
            Sleep 999
            ControlClick("TPngBitBtn.UnicodeClass4", "A") ;全部添加
        } else {
            ControlClick("TPngBitBtn.UnicodeClass1", "A") ;开始
        }
    }

#HotIf



#HotIf CheckWindowActive( "FSViewer" , "TTntForm.UnicodeClass" , "删除文件夹" )
    CapsLock::{
        Send "!y"
    }
    Esc::{
        Send "!n"
    }
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "" , "删除*" )
    Delete::Send "!n"
    Insert::Send "!y"
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "" , " 图像转换 " )
    F10::Send "{Esc}"
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "" , "另存为" )
    $[::Send "["
    $]::Send "]"
    $\::Send "\"
    $p::Send "p"
    $`::Send "``"
    $BackSpace::Send "{BackSpace}"
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "TFullScreenWindow" )
    FSViewerShowProgrssBar() {
        Send "{F5}"
        MouseGetPos(&mouse_x, &mouse_y)
        if ( Abs(mouse_x - Screen.w/2) > 5 ) || ( mouse_y > 5 )
            MouseMove(Screen.w/2, 0, 0)
        else
            MouseMove(Screen.w - 300, Screen.h - 300, 0)
    }
    AppsKey::{
        FSViewerShowProgrssBar()
    }
#HotIf


#HotIf CheckWindowActive( "FSViewer" , "FastStoneImageViewerMainForm.UnicodeClass" )

    #\::
    #+\::{
        Send "{Blind}{vkFF}"
        total_width     := A_ScreenWidth
        total_height    := A_ScreenHeight
        MoveWindowPosition(Position(total_width , total_height))

        if ( A_ThisHotkey == "#\" ) {
            folder_width    := 425
            thumbnail_width := 870
        } else if ( A_ThisHotkey == "#+\" ) {
            folder_width    := 700
            thumbnail_width := 150
        }

        window   := GetActiveWindowInfo(False)
        ctl_name := "TJamShellTree.UnicodeClass1"
        ctl_info := window.controls.%ctl_name%
        if ( Abs(ctl_info.w - folder_width) > 15 ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove(ctl_info.w , ctl_info.y + ctl_info.h / 2)
            offset := GetOffset("X")
            MoveControlUDLR(ctl_info, "Right", folder_width, offset)
            MouseMove(x_origin, y_origin, 0)
        }

        window   := GetActiveWindowInfo(False)
        ctl_name := "TTntListView.UnicodeClass1"
        ctl_info := window.controls.%ctl_name%
        if ( Abs(ctl_info.w - thumbnail_width) > 10 ) {
            MouseGetPos(&x_origin, &y_origin)
            MouseMove(ctl_info.x + ctl_info.w , ctl_info.y + ctl_info.h / 2)
            offset := GetOffset("X")
            MoveControlUDLR(ctl_info, "Right", folder_width + thumbnail_width, offset)
            MouseMove(x_origin, y_origin, 0)
        }

        Send "{F10}"
        Send "{Right 4}{Enter}"
        Send "{Down 2}{Enter}"
        if ( A_ThisHotkey == "#\" )
            Send "{Enter}"
        else if ( A_ThisHotkey == "#+\" )
            Send "{Down 2}{Enter}"
    }

#HotIf


#HotIf CheckWindowActive( "FSViewer" )

    ;   F5::Return ;刷新
    ;   F7::Return ;随机排序
    ;  F10::Return ;切换焦点
    ;  F11::Return ;全屏

    fsviewer_activate_left_menu()
    {
        CoordMode("Mouse", "Screen")
        MouseGetPos(&x, &y)
        Arg.mouse_x := x
        Arg.mouse_y := y
        MouseMove(7, A_ScreenHeight/2 , 0)
        Sleep 99
        ctl := "TJamShellTree.UnicodeClass1"
        ControlFocus(ctl, "A")
        Sleep 99
        if ( ControlGetClassNN(ControlGetFocus("A")) != ctl )
            return
        Send "^{Left 33}"
        Send "{AppsKey}"
    }

    AppsKey::{
        fsviewer_activate_left_menu()
        Send "{Down 7}"
        Send "{Enter}"
        MouseMove(Arg.mouse_x, Arg.mouse_y, 0)
    }

    F1::
    F2::
    F3::
    F4::
    F5::
    F6::
    F7::
    F8::
    F9::
    {
        EN()
        fsviewer_activate_left_menu()
        Send "{Down 7}"
        Send "{Enter}"
        MouseMove(Arg.mouse_x, Arg.mouse_y, 0)
        Sleep 555
        Try WinActivate("ahk_exe FSViewer.exe ahk_class TCopyMoveFolder.UnicodeClass")
        Send "^{Tab 3}"
        Sleep 111
        key := StrReplace(A_ThisHotkey, "F", "")
        Send key
    }

    ; 清理缩略图缓存
    F10::{
        Send "{F10}"
        Send "{Right 10}"
        Send "{Down 4}"
        Send "{Enter}"
        Sleep 333
        ControlClick("TMyButton.UnicodeClass4", "A") ;清理
        Sleep 666
        ControlClick("TTntButton.UnicodeClass2", "A") ;确定
    }

    ; 创建缩略图缓存
    F11::{
        EN()
        Send "{F10}"
        Send "{Right 10}"
        Send "{Down 3}"
        Send "{Enter}"
        Sleep 333
        ControlClick("TMyButton.UnicodeClass3", "A") ;添加
        Send "{Left 22}"
        Send "{Right}"
        Send "{Down 2}"
        Send "{Right}"
        Send "Ram"
        Send "{Right 2}"
        Send "{Enter}"
        Sleep 666
        ControlClick("TMyButton.UnicodeClass2", "A") ;扫描
    }

    ; 转换图片为小图片
    F12::{
        Send "{F10}"
        Send "{Right 9}"
        Send "{Down 3}"
        Send "{Enter}"
        ; Sleep 666
        ; text := WinGetText("A")
        ; text := Trim(text, " " )
        ; text := Trim(text, "`n")
        ; text := StrSplit(text, "`n")[1]
        ; text := Trim(text)
        ; HelpText(text, "Center")
        ; if ( text != "批量转换" )
        ;     Send "^{Tab}"
    }

    ; 批量重命名
    ; F12::{
    ;     Send "{F10}"
    ;     Send "{Right 9}"
    ;     Send "{Down 3}"
    ;     Send "{Enter}"
    ;     Sleep 666
    ;     text := WinGetText("A")
    ;     text := Trim(text, " " )
    ;     text := Trim(text, "`n")
    ;     text := StrSplit(text, "`n")[1]
    ;     text := Trim(text)
    ;     if ( text != "批量重命名" )
    ;         Send "^{Tab}"
    ; }

    CapsLock::{
        fsviewer_activate_left_menu()
        Send "{Up 4}"
        Send "{Enter}"
        Sleep 99
        MouseMove(Arg.mouse_x, Arg.mouse_y, 0)
    }

    `::Send "c"
    Tab::Send "m"

    [::Send "{Left}"
    ]::Send "{Left}"

    `;::Send "{Home}"
     '::Send "{End}"

    \::{
        Send "{Right}"
        Sleep 123
    }
    Home::{
        Sleep 369
        Send "{Right}"
    }
    PgUp::{
        Send "{Right}"
        Sleep 99
    }
    PgDn::{
        Send "{Right}"
        Sleep 55
    }
    End::{
        Send "{Right}"
        Sleep 11
    }

    ,::Send "{Home}!{Left}{Home}"
    .::Send "{End}!{Right}"
    /::{
        EN()
        Sleep 99
        Send "m"
        Send "^{Tab 3}"
        Send "{Esc}"
    }

    ^r::Send "{F2}"

    !1::
    ![::{
        ControlFocus("TJamShellTree.UnicodeClass1" , "A")
    }
    !2::
    !]::{
        ControlFocus("TTntListView.UnicodeClass1"  , "A")
    }
    !3::
    !\::{
        ControlFocus("TImageEnView1"               , "A")
    }

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
