; �������� Dextop ��ݼ�����չ (���ֿ�ݼ���Winϵͳ��ͻ���ڴ˴����м��ݴ���)

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}

; �л�����
<#1::#^!1 ; LWin 1 -> Win Ctrl Alt 1
<#2::#^!2 ; LWin 2 -> Win Ctrl Alt 2
<#3::#^!3 ; LWin 3 -> Win Ctrl Alt 3
<#q::#^!q ; LWin q -> Win Ctrl Alt q
<#w::#^!w ; LWin w -> Win Ctrl Alt w
<#e::#^!e ; LWin e -> Win Ctrl Alt e
<#a::#^!a ; LWin a -> Win Ctrl Alt a
<#s::#^!s ; LWin s -> Win Ctrl Alt s
<#d::#^!d ; LWin d -> Win Ctrl Alt d

; �ƶ�����
<#+1::#^!+1 ; LWin Shift 1 -> Win Ctrl Alt Shift 1
<#+2::#^!+2 ; LWin Shift 2 -> Win Ctrl Alt Shift 2
<#+3::#^!+3 ; LWin Shift 3 -> Win Ctrl Alt Shift 3
<#+q::#^!+q ; LWin Shift q -> Win Ctrl Alt Shift q
<#+w::#^!+w ; LWin Shift w -> Win Ctrl Alt Shift w
<#+e::#^!+e ; LWin Shift e -> Win Ctrl Alt Shift e
<#+a::#^!+a ; LWin Shift a -> Win Ctrl Alt Shift a
<#+s::#^!+s ; LWin Shift s -> Win Ctrl Alt Shift s
<#+d::#^!+d ; LWin Shift d -> Win Ctrl Alt Shift d


; ��һ������
<#CapsLock::
    Send #^!+{CapsLock}
    SetCapsLockState, Off
Return

; ȫ��Ԥ��
LWin & LCtrl::#^!+F12

; ����Ŀ¼ 
LWin & Alt::#^!+F1

; ����͸����
<#PgUp::<#^!+PgUp
<#PgDn::<#^!+PgDn
