
RegisterSoftware( "NeeView" , "NeeView" )

RegisterPosition( "NeeView__设置" , Position(-100 , -100) )


#Include *i NeeView.Private.ahk


#HotIf CheckWindowActive( "NeeView",
                          "HwndWrapper[NeeView;;7a9aa0d5-c1d6-4521-9f02-4b8ee51a2dcc]" ,
                          "NeeView" )

    Insert::Send "{Enter}"

#HotIf


#HotIf CheckWindowActive( "NeeView" )

    AppsKey::Send "{F24}"

    Help::VSCodeWorkSpace("NeeView")

    b::
    g::
    l::
    {
        if ( InStr(A_PriorHotkey , A_ThisHotkey) && ( A_TimeSincePriorHotkey < 456 ) )
            Send "+" A_ThisHotkey
    }

    #Include *i NeeView.Mouse.ahk
    #Include *i NeeView.Joy.ahk

#HotIf
