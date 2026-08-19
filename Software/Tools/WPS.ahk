
RegisterSoftware("wps" , "WPS")


#HotIf CheckWindowActive( "EnableLoopback" )

    #+BackSpace::{
        ProcessClose "wpscloudsvr.exe"
        ProcessClose "wps.exe"
    }

#HotIf
