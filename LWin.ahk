#SingleInstance Force
#NoTrayIcon


<#=::Send {Volume_Up}
<#-::Send {Volume_Down}
<#/::Run, ms-settings: ;����
<#.::Run control ;�������
<#,::#x ; ϵͳ�˵�
<#v::#, ; ��ʾ��������Ӧ��
<#m::#k  ; �򿪡����ӡ����ٲ���.

<#]::#t  ;�л�������Ӧ�ã�Ԥ��
<#[::#+t ;�л�������Ӧ�ã�Ԥ��

LWin & Esc::Send #d

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

; PowerToy Run
LWin & LAlt::#^!Space  
LAlt & LWin::#^!Space
