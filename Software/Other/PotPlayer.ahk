﻿
#If ( CheckWindowsActive("PotPlayer") )

    ; 2倍数播放
    >!2::Send {c 10}

    >+Delete::Send +{Delete}

    !CapsLock::Send !{F4}

#If