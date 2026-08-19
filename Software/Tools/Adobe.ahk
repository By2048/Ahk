
RegisterSoftware("Adobe Premiere Pro" , "PR")

#HotIf CheckWindowActive( "PR" )
    #\::{
        x := 2
        y := 0
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight + 9
        MoveWindowPosition( [ x, y, w, h ] )
    }
#HotIf



RegisterSoftware("Photoshop" , "PS")

#HotIf CheckWindowActive( "PS" )
    #\::{
        x := 0
        y := 0
        w := A_ScreenWidth
        h := A_ScreenHeight
        MoveWindowPosition( [ x, y, w, h ] )
    }
    #+\::{
        x := 40
        y := 20
        w := A_ScreenWidth  - x * 2
        h := A_ScreenHeight - y * 2
        MoveWindowPosition( [ x, y, w, h ] )
    }
#HotIf