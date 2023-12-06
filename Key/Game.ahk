
<#Tab::AltTab

>^/::Run "E:\Script\Software\Chrome.bat", A_InitialWorkingDir, "Hide"
>^Esc::Run "TaskMgr"
>^AppsKey::{
    SetNumLockState "Off"
    SetCapsLockState "Off"
    SetScrollLockState "Off"
}

<#Home::Send "#^!{Home}"
<#End::Send "#^!{End}"
<#PgUp::Send "{Volume_Up}"
<#PgDn::Send "{Volume_Down}"

; ------------------------------------------------- ;

~Space & w::Return
~Space & s::Return
~Space & a::Return
~Space & d::Return

~Space & g::Return
~Space & h::Return
~Space & f::Return
~Space & j::Return

~Space &    Up::Return
~Space &  Down::Return
~Space &  Left::Return
~Space & Right::Return

~Space & LAlt::Return
~Space & RAlt::Return

~Space &      Tab::Return
~Space & CapsLock::Return
~Space &    Shift::Return

; ------------------------------------------------- ;

LWin::Return

#Tab::Return
#+Tab::Return
#Enter::Return
#+Enter::Return
#Space::Return
#+Space::Return
#CapsLock::Return
#+CapsLock::Return

^Esc::Return
^+Esc::Return

^Space::Return
!Space::Return

!Tab::Return
!+Tab::Return

#Esc::Return
#F1::Return
#F2::Return
#F3::Return
#F4::Return
#F5::Return
#F6::Return
#F7::Return
#F8::Return
#F9::Return
#F10::Return
#F11::Return
#F12::Return

#`::Return
#1::Return
#2::Return
#3::Return
#4::Return
#5::Return
#6::Return
#7::Return
#8::Return
#9::Return
#0::Return
#=::Return
#-::Return

#q::Return
#w::Return
#e::Return
#r::Return
#t::Return
#y::Return
#u::Return
#i::Return
#o::Return
#p::Return
#a::Return
#s::Return
#d::Return
#f::Return
#g::Return
#h::Return
#j::Return
#k::Return
#l::Return
#z::Return
#x::Return
#c::Return
#v::Return
#b::Return
#n::Return
#m::Return

#[::Return
#]::Return
#\::Return

#,::Return
#.::Return
#/::Return

#Up::Return
#Down::Return
#Left::Return
#Right::Return

LWin & LAlt::Return
LWin & LCtrl::Return
