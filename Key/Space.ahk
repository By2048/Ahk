﻿
~Space::Return

~Space & w::MouseMoveDC(  0, -50)
~Space & s::MouseMoveDC(  0,  50)
~Space & a::MouseMoveDC(-50,   0)
~Space & d::MouseMoveDC( 50,   0)

~Space & g::MouseMoveDC( 0, -1)
~Space & h::MouseMoveDC( 0,  1)
~Space & f::MouseMoveDC(-1,  0)
~Space & j::MouseMoveDC( 1,  0)

~Space & b::{
    CoordMode("Mouse", "Screen")
    MouseMove(A_ScreenWidth/2 , A_ScreenHeight-123 , 0)
}

~Space &    Up::MouseMoveDC(   0, -100)
~Space &  Down::MouseMoveDC(   0,  100)
~Space &  Left::MouseMoveDC(-100,    0)
~Space & Right::MouseMoveDC( 100,    0)
 
~Space & LAlt::Send "{LButton}"
~Space & RAlt::Send "{RButton}"

~Space &      Tab::Send "{LButton}"
~Space & CapsLock::Send "{MButton}"
~Space &    Shift::Send "{RButton}"
