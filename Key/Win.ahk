
#Include Win.Dexpot.ahk
#Include Win.Other.ahk
#Include Win.Left.ahk
#Include Win.Right.ahk

#Include *i Win.Setting.Private.ahk
#Include *i Win.Fxx.Private.ahk


; 调整显示器亮度 基于 Twinkle 软件
#Home::  ;主显示器 +
#End::   ;主显示器 -
#+Home:: ;副显示器 +
#+End::{ ;副显示器 -
    Switch A_ThisHotkey {
        Case "#Home"  : Send "#^!{Home}"
        Case "#End"   : Send "#^!{End}"
        Case "#+Home" : Send "#^!+{Home}"
        Case "#+End"  : Send "#^!+{End}"
    }
}

; 窗口全屏
#Enter:: Send "^!{Enter}"
#+Enter::Send "^!+{Enter}"

; UI缩放快捷键
#0:: Send "^!0"
#+0::Send "^!+0"
#-:: Send "^!-"
#+-::Send "^!+-"
#=:: Send "^!="
#+=::Send "^!+="

;声音
#PgUp::Send "{Volume_Up}"
#PgDn::Send "{Volume_Down}"
#+PgUp::
#+PgDn::{
    Send "{Volume_Down}{Volume_Up}" ;显示声音调整UI
    ; 调整音量时 不能准确调整到指定数值 存在小数点偏差
    volume_offset  := 5
    volume_steps   := [ 9, 22, 33, 44, 50, 55, 66, 77, 88, 100 ]
    volume_current := Round(SoundGetVolume())
    for index, volume in volume_steps {
        if ( Abs(volume_current - volume) < volume_offset ) {
            if ( InStr(A_ThisHotkey, "PgDn") ) {
                if ( index == 1 )
                    SoundSetVolume(volume_steps[1])
                else
                    SoundSetVolume(volume_steps[index - 1])
            } else if ( InStr(A_ThisHotkey, "PgUp") ) {
                if ( index == volume_steps.Length )
                    SoundSetVolume(volume_steps[-1])
                else
                    SoundSetVolume(volume_steps[index + 1])
            }
            break
        }
    }
}
