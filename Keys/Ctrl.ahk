#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



 ^Esc::Return ;开始菜单
^+Esc::Return ;任务管理器


