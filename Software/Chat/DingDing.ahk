﻿

#If ( CheckWindowsActive("DingDing") )

    ; 发送消息
    ^Enter::Return
    !Enter::Send ^{Enter}

#If