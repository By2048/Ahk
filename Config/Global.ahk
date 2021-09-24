
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
loop_ignore_process_name.Push( "LOL_TX"     )
loop_ignore_process_name.Push( "LOL_Client" )
loop_ignore_process_name.Push( "LOL_Game"   )


; Tool\Windows.ahk
global game_process_name := []
game_process_name.Push( "LOL_TX"     )
game_process_name.Push( "LOL_Client" )
game_process_name.Push( "LOL_Game"   )
game_process_name.Push( "Steam"      )
game_process_name.Push( "Android"    )
