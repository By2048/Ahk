#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



 ^Esc::Return ;��ʼ�˵�
^+Esc::Return ;���������


