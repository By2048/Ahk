#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



LWin & Tab:: 
    win_tab:=true
    If (GetKeyState("Shift","P")) {
        Send {Alt Down}{Shift Down}{Tab}
    } else {
        Send {Alt Down}{Tab}
    }
return

#If (win_tab)
    ~*LWin Up::
        Send {Shift Up}{Alt Up}
        win_tab:=false 
    return
#If



<#=::Send {Volume_Up}
<#-::Send {Volume_Down}

<#,::#x ; ϵͳ�˵�
<#.::Run control ;�������
<#/::Run, ms-settings: ;����

<#]::#t  ;�л�������Ӧ�ã�Ԥ��
<#[::#+t ;�л�������Ӧ�ã�Ԥ��

<#v::#, ; ��ʾ��������Ӧ��
<#n::#k  ; �򿪡����ӡ����ٲ���.
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