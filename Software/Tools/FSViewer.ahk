
FSViewer :=
{
    Refresh : 0 ,
    Move_win_top_bottom : "None" ,
    Collection  : Map( "Default" , Folders.Temp ) ,
    ImageInput  : Folders.Cache "#Image" ,
    ImageOutput : Folders.Cache "~Image" ,
    Control : {}
}


RegisterSoftware( "FSViewer" , "FSViewer" )

RegisterHelpInfo( "FSViewer" , FilePath(A_LineFile, "FSViewer.Private.help") )

RegisterPosition( "FSViewer_#32770_另存为" , Position(1414 , 1000) )
RegisterPosition( "FSViewer_TBatchConvert.UnicodeClass_批量转换*"    , Position(1500 , 999) )


#Include *i FSViewer.Private.ahk
#Include *i FSViewer.Tool.ahk


#HotIf CheckWindowActive( "FSViewer" , "TFullScreenWindow" )

    ; \ Up::fsviewer_refresh_image()

#HotIf


#HotIf CheckWindowActive( "FSViewer" , "TTntForm.UnicodeClass" , "删除文件夹" )
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
    #\:: fsviewer_move_position()
    #+\::fsviewer_move_position()
    BackSpace & Delete::
    {
        ControlFocus("TJamShellTree.UnicodeClass1", "A")
        if ( ControlGetClassNN(ControlGetFocus("A")) == "TJamShellTree.UnicodeClass1" )
            Send "{AppsKey}{Up 4}{Enter}"
    }
#HotIf


#HotIf CheckWindowActive( "FSViewer" )

    ;   F5::Return ;刷新
    ;   F7::Return ;随机排序
    ;  F10::Return ;切换焦点
    ;  F11::Return ;全屏

    Help::VSCodeWorkSpace("FSViewer")

    FSViewer.move_win_top_bottom := "None"

    AppsKey::fsviewer_move_folder()

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

    Delete::{
        control_name := ""
        try control_name := ControlGetClassNN(ControlGetFocus("A"))
        if ( control_name == "TJamShellTree.UnicodeClass1" )
            Send "{AppsKey}{Up 4}{Enter}"
        else
            Send "{Delete}"
    }

    Esc::{
        if ( InStr(A_PriorHotkey , A_ThisHotkey) )
            if ( A_TimeSincePriorHotkey < 456 )
               Send "{Esc}"
    }

    BackSpace::{
        Send "{F5}"
        if ( InStr(A_PriorHotkey , A_ThisHotkey) )
            if ( A_TimeSincePriorHotkey < 456 )
               Send "!x"
    }

    ; BackSpace & \::Send "{Esc}"
    ; \ & BackSpace::Send "{Esc}"

    ; `::Send "c"
    ; Tab::Send "m"

    `::Send "m1"

    1::Send "m2"
    2::Send "m3"
    3::Send "m4"
    4::Send "m5"

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

    RAlt::Return
    RAlt Up::Send "{Delete}{Enter}"

    ,::Send "{Home}!{Left}{Home}"
    .::Send "{End}!{Right}"
    /::{
        EN()
        Sleep 99
        Send "m"
        Send "^{Tab 3}"
        Send "{Esc}"
        Sleep 99
        Send "{F5}"
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

    +Tab::{
        Send "{F12}"
        Sleep 999
        ControlSetChecked(-1 , "TMyCheckBox.UnicodeClass2", "A") ;自动切换下一个目录
        Sleep 666
        ControlClick("TMyButton.UnicodeClass5", "A") ;确定
    }

    ; 图片转码
    +BackSpace::{
        Send "{F10}"
        Send "{Right 9}"
        Send "{Down 3}"
        Send "{Enter}"
        Sleep 333
        MoveWindowDefault()
    }

    #Include FSViewer.Joy.ahk
    #Include FSViewer.Mouse.ahk

#HotIf
