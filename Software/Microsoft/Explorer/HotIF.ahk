﻿
#Include HotIF.Quick.ahk

#Include HotIF.32770.ahk

#Include HotIF.Desktop.ahk

#Include HotIF.Other.ahk

#Include HotIF.Base.ahk



#HotIf CheckWindowActive( "Explorer" )

    #IncludeAgain Key.ahk
    #IncludeAgain Key.Date.ahk

#HotIf
