
Screens := {
    Main    : {} ,
    Default : {} ,
    Backup  : {} ,
    Other   : {}
}

Screens.Count   := MonitorGetCount()

Screens.Primary := MonitorGetPrimary()

Loop Screens.Count {
    obj := {}
    obj.id   := A_Index
    obj.name := MonitorGetName(obj.id)
    MonitorGet(obj.id, &Left, &Top, &Right, &Bottom)
    obj.x  := Left   + 0
    obj.y  := Top    + 0
    obj.xx := Right  + 0
    obj.yy := Bottom + 0
    obj.w  := obj.xx - obj.x
    obj.h  := obj.yy - obj.y
    obj.width  := obj.w
    obj.height := obj.h
    if ( obj.id == Screens.Primary ) {
        Screens.Main    := obj
        Screens.Default := obj
    } else {
        Screens.Backup := obj
        Screens.Other  := obj
    }
}

Screen := Screens.Default
