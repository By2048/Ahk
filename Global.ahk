
; 屏幕信息
Global Screens := {} ;所有屏幕相关信息
Global Screen  := {} ;主窗口信息

; 缓存过期时间 毫秒
Global Cache_Expire_Time := 500

; 当前窗口信息缓存 处理同一进程重复窗口信息获取问题
Global window := {}

; 各种状态信息
Global status := {}
