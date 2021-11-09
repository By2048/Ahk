; Init


    
; w:=600*2
; h:=800*2
; Progress, b zh0 fs15 fm19 c01 x%x% y%y% w%w% h%h%, %content%, %title%, "Source Code Pro"

; SplashImage, Off
; SplashImage, %image%, X%x% Y%y% H%h% W%w% B1


; Progress, Off

; Progress, b fs19 zh0, `n Close All Script `n, , Courier New
; Sleep, 1000
; Progress, Off

; Progress, b fs19 zh0 x%x% y%y% w%w% h%h%, %data%,  , Courier New



; Capslock &  p::MouseMoveDC( 0, -5)
; Capslock & `;::MouseMoveDC( 0,  5)
; Capslock &  l::MouseMoveDC(-5,  0)
; Capslock &  '::MouseMoveDC( 5,  0)

; Capslock & w::MouseMoveDC(  0, -50)
; Capslock & s::MouseMoveDC(  0,  50)
; Capslock & a::MouseMoveDC(-50,   0)
; Capslock & d::MouseMoveDC(                                                                        50,   0)

; Capslock &    Up::MouseMoveDC(   0, -100)
; Capslock &  Down::MouseMoveDC(   0,  100)
; Capslock &  Left::MouseMoveDC(-100,    0)
; Capslock & Right::MouseMoveDC( 100,    0)

; Capslock &   Tab::LButton
; Capslock & Space::MButton
; Capslock & Shift::RButton


