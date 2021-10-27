
; 过时的: 不推荐在新脚本中使用这些命令
; SplashImage, %image%, X%image_x% Y%image_y% W%image_w% H%image_h% B1   ;全屏幕居中
; SplashImage, %image%, B1  ; 去除任务栏屏幕居中


; ; w := 200
; w := image_w
; h := 62
; x := screen_1.w/2 - w/2
; ; y := screen_1.h - h - 5 ; 屏幕底部
; y := screen_1.h/2 + image_h/2 + 3 ; 图片底部
; w := w/2
; h := h/2
; Progress, b fs19 zh0 X%x% Y%y% W%w% H%h%, %hotkeys_index%/%hotkeys_total%


; SplashImage, Off
; Progress, Off
