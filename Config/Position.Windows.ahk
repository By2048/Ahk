
WW := 900
WH := 1500
Windows_Position_Default["_#32770_浏览文件夹"] := [CenterX(), CenterY(), WW, WH]
Windows_Position_Default["_#32770_浏览计算机"] := [CenterX(), CenterY(), WW, WH]

WW := 2020
WH := 1500
Windows_Position_Default["_#32770_打开"]    := [CenterX(), CenterY(), WW, WH]
Windows_Position_Default["_#32770_另存为"]   := [CenterX(), CenterY(), WW, WH]
Windows_Position_Default["_#32770_打开文件"] := [CenterX(), CenterY(), WW, WH]

WW := 1500
WH := 1500
Windows_Position_Default["_#32770_编辑环境变量"] := [CenterX(), CenterY(), WW, WH]

WW := 1000
WH := 1500
; 开启关闭 Windows 功能
Windows_Position_Default["OptionalFeatures_NativeHWNDHost"] := [CenterX(), CenterY(), WW, WH]

WW := 2400
WH := 1600
; 设置
Windows_Position_Default["ApplicationFrameHost_ApplicationFrameWindow"] := [CenterX(), CenterY(), WW, WH]

WW := Screen3.w   -6-6
WH := Screen3.h/2 -6-6
WX := Screen3.x   + 6
WY := Screen3.y   + 6
Windows_Position_Default["TaskMGR"] := [WX, WY, WW, WH]

WW := 2150
WH := 1250
Windows_Position_Default["Start"] := [CenterX(), CenterY(), WW, WH]

; D:\\   | 树 427 | 名称800  备注400    日期250              | 预览 600
; 回收站  | 树 427 | 名称500  原位置500  删除日期250  大小200  | 预览 600
; 其他   | 树 427 | 名称999   日期250    大小200              | 预览 600
WW := 2570
; WW := 1970
; WW := 2070
WH := 1700
Windows_Position_Default["Explorer"] := [CenterX(), CenterY(), WW, WH]
