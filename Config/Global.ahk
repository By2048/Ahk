
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 工具类中使用的全局变量在此配置 ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Tool\Init.ahk\InitConfig()
global init_config_show_status := False

; Tool\Help.ahk\HelpImage()
global help_text_show_status := False

; Tool\Help.ahk\HelpText()
global help_image_show_status := False

; Tool\KeyMap.ahk\show_hide_key_config()
global key_map_show_status := False

; Software\Android.ahk
global software_android_rshift_loop    := [ 1, 2, 3, 4, 5, 6, 7 ]
global software_android_rshift_current := 0

; Software\VSCode.ahk
global software_vscode_ralt := False

; Loop.ahk
global loop_ignore_process_name := []
loop_ignore_process_name.Push( "LOL_TX"            )
loop_ignore_process_name.Push( "LOL_Client"        )
loop_ignore_process_name.Push( "LOL_Game"          )
loop_ignore_process_name.Push( "GetWindowText"     )

; Tool\Windows.ahk
global game_process_name := []
game_process_name.Push( "LOL_TX"     )
game_process_name.Push( "LOL_Client" )
game_process_name.Push( "LOL_Game"   )

; Software\LOL.ahk
global lol_x  := 0
global lol_y  := 0
global lol_x1 := 55
global lol_y1 := 400
global lol_x2 := 55
global lol_y2 := 550
global lol_x3 := 55
global lol_y3 := 710
global lol_x4 := 55
global lol_y4 := 880

; Software\CloudMusic.ahk
global cloud_music_volume := -1

; Config\Global.ahk
global hotkeys_show_status  := False ; 是否正在显示图片
global hotkeys_images       := []    ; 显示的图片组
global hotkeys_index        := 1     ; 显示图片的序号
global hotkeys_total        := 1     ; 显示图片组的数量
global hotkeys_title        := ""    ; 激活的应用窗口标题
global hotkeys_process_name := ""    ; 激活的应用


