#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



<#Tab::AltTab

<#=::Send {Volume_Up}
<#-::Send {Volume_Down}
<#/::Run, ms-settings: ;����
<#.::Run control ;�������
<#,::#x ; ϵͳ�˵�
<#v::#, ; ��ʾ��������Ӧ��
<#n::#k  ; �򿪡����ӡ����ٲ���.

<#]::#t  ;�л�������Ӧ�ã�Ԥ��
<#[::#+t ;�л�������Ӧ�ã�Ԥ��

<#m::Send #d  ;�л���������Ӧ�ý���

; �����ļ�·��
<#c::	
    send ^c
    clipboard = %clipboard%
return

; ��ʾ����������
<#0:: 
    if !WinExist("ahk_class Shell_TrayWnd") {
        WinShow ahk_class Shell_TrayWnd
    } else {
        WinHide ahk_class Shell_TrayWnd
    }
return