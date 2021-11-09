
#include %A_WorkingDir%\Config\All.ahk
#include %A_WorkingDir%\Tool\Base.ahk
#include %A_WorkingDir%\Tool\Help.ahk
#include %A_WorkingDir%\Tool\Mouse.ahk
#include %A_WorkingDir%\Tool\Other.ahk
#include %A_WorkingDir%\Tool\Windows.ahk

#SingleInstance Force
#NoTrayIcon



$Space::Space
; ~Space::Space

Space &  p::MouseMoveDC( 0, -5)
Space & `;::MouseMoveDC( 0,  5)
Space &  l::MouseMoveDC(-5,  0)
Space &  '::MouseMoveDC( 5,  0)

Space & w::MouseMoveDC(  0, -50)
Space & s::MouseMoveDC(  0,  50)
Space & a::MouseMoveDC(-50,   0)
Space & d::MouseMoveDC( 50,   0)

Space &    Up::MouseMoveDC(   0, -100)
Space &  Down::MouseMoveDC(   0,  100)
Space &  Left::MouseMoveDC(-100,    0)
Space & Right::MouseMoveDC( 100,    0)

Space & LAlt::LButton
Space & RAlt::RButton

Space &      Tab::RButton
Space & Capslock::MButton
Space &    Shift::LButton
