
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
    obj.x := Left
    obj.y := Top
    obj.w := Right  - Left
    obj.h := Bottom - Top
    if ( obj.id == Screens.Primary ) {
        Screens.Main    := obj
        Screens.Default := obj
    } else {
        Screens.Backup := obj
        Screens.Other  := obj
    }
}

Screen := Screens.Default
