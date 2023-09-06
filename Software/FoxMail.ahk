
#HotIf CheckWindowActive( "FoxMail" )

    ; 收取所有邮件
    F4::Return
    AppsKey::Send "{F4}"

    <#\::{
        MoveWindowToPosition(Position(2233,1250))

        ; 邮箱列表
        InitWindowArgs()
        GetActiveWindowInfo()
        info   := window.controls.TVirtualDrawTree2
        width  := 300
        offset := 8
        MoveControlUDLR(info, 0, 0, 0, width, offset)

        ; 邮件列表
        InitWindowArgs()
        GetActiveWindowInfo()
        info   := window.controls.TVirtualDrawTree1
        width  := 850
        offset := 8
        MoveControlUDLR(info, 0, 0, 0, width, offset)
    }

#HotIf
