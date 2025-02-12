
RegisterPosition("_#32770"           , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveFile"  , Position(1522 , 1122) )
RegisterPosition("_#32770_SaveVideo" , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览"       , Position(1522 , 1122) )
RegisterPosition("_#32770_打开"       , Position(1522 , 1122) )
RegisterPosition("_#32770_另存为"     , Position(1522 , 1122) )
RegisterPosition("_#32770_打开文件"    , Position(1522 , 1122) )
RegisterPosition("_#32770_选择文件夹"  , Position(1522 , 1122) )
RegisterPosition("_#32770_浏览文件夹"  , Position(666 , 1122)  )
RegisterPosition("_#32770_浏览计算机"  , Position(666 , 1122)  )



#HotIf CheckWindowActive( "" , "#32770" , "*删除*" )
    Delete::Send "{Esc}"
    Insert::{
        win := GetActiveWindowInfo()
        if ( win.process_name == "Explorer" ) {
            Send "!y"
            Sleep 99
            Send "{Space}"
        } else if ( win.process_name == "FreeFileSync" ) {
            Send "{Enter}"
        } else if ( win.process_name == "BitComet" ) {
            ControlClick("Button1", "A")
            Send "{Enter}"
        } else {
            Send "!y"
        }
    }
    BackSpace::{
        win := GetActiveWindowInfo()
        if ( win.process_name == "Explorer" ) {
            DelFile() {
                Send "{Esc}"
                Sleep 33
                Send "+{Delete}"
                Sleep 66
                Send "!y"
                Sleep 99
                Send "{Space}"
            }
            SetTimer(DelFile, -99)
        } else if ( win.process_name == "BitComet" ) {
            ControlClick("Button2", "A")
            Sleep 99
            Send "{Enter}"
        } else {
            Send "!y"
        }
    }
    Numpad9::Send "{Enter}"  ; 上
    Numpad3::Send "{Esc}"    ; 下
#HotIf



#HotIf    CheckWindowActive( "" , "#32770" , "打开|打开文件|选择文件|选择文件夹" )
       || CheckWindowActive( "" , "#32770" , "更改图标|另存为|浏览" )
       || CheckWindowActive( "" , "#32770" , "SaveFile|SaveVideo" )
       || CheckWindowActive( "" , "#32770" , "图像另存为" )

    #IncludeAgain .\Microsoft\Explorer\Key.ahk

    ; 文件名修改框
    ~CapsLock::ControlFocus("Edit1", "A")

    ~NumLock::{
        name := ControlGetText("Edit1", "A")
        name := Trim(name)
        ControlSetText(name, "Edit1", "A")
        Send "!s"
    }

    Insert::
    NumpadHome::{
        name := ControlGetText("Edit1", "A")
        ; 
        name := StrReplace(name, A_Tab, " ")
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        ; 
        name := StrReplace(name, "video_", "")
        name := StrReplace(name, " - ", " ")
        ; 
        name := StrReplace(name, "#", " ")
        name := StrReplace(name, "@", " ")
        name := StrReplace(name, "|", " ")
        name := StrReplace(name, "\", " ")
        name := StrReplace(name, "/", " ")
        name := StrReplace(name, ":", " ")
        name := StrReplace(name, "，", " ")
        name := StrReplace(name, "：", " ")
        ; 
        ; name := StrReplace(name, ",", " ")
        ; name := StrReplace(name, "。", " ")
        ; 
        name := StrReplace(name, Chr(10), " ")
        name := StrReplace(name, Chr(13), " ")
        ; 
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        name := StrReplace(name, "  " , " ")
        name := LTrim(name)
        ; 
        name := name . " "
        ; 
        ControlSetText(name, "Edit1", "A")
        ControlFocus("Edit1", "A")
        Send "{End}"
    }
    NumpadEnd::ControlSetText(A_Clipboard, "Edit1", "A")

    NumpadPgDn::ErSetPathNext()
    NumpadPgUp::ErSetPathPrev()

    ![::ErActivateLeft()
    !]::ErActivateRight()
    !\::ErActivateMenu()

    NumpadIns::WinClose("A")

    ; 默认位置
    NumpadDel::
    #\::{
        MoveWindowDefault()
        try {
            window := GetActiveWindowInfo(False)
            info := window.controls.DirectUIHWND2  ;左侧信息栏
            MoveControlUDLR(info, "Left", 300, 6)
        } catch {
            return
        }
        Send "^!7"  ;平铺模式
    }

#HotIf



#HotIf CheckWindowActive( "" , "#32770" )
    +;::SendInput( FormatTime(A_Now, "yyyy-MM-dd") )
    +'::SendInput( FormatTime(A_Now, "HH-mm-ss"  ) )
#HotIf
