; �������� Dextop ��ݼ�����չ 
; ���ֿ�ݼ���Winϵͳ��ͻ���޷�ͨ���������ʵ��
; �ڴ˴����м��ݴ���

#SingleInstance Force
#NoTrayIcon

if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}

; �л�����
<#1::#^!1
<#2::#^!2
<#3::#^!3
<#q::#^!q
<#w::#^!w
<#e::#^!e
<#a::#^!a
<#s::#^!s
<#d::#^!d

; �ƶ�����
<#+1::#^!+1
<#+2::#^!+2
<#+3::#^!+3
<#+q::#^!+q
<#+w::#^!+w
<#+e::#^!+e
<#+a::#^!+a
<#+s::#^!+s
<#+d::#^!+d

; ��һ������
<#CapsLock::
    Send #^!+{CapsLock}
    SetCapsLockState, Off
Return

; ����Ŀ¼ 
LWin & LAlt::#^!+F1

; ȫ��Ԥ��
LWin & LCtrl::#^!+F2

;��С����ϵͳ����
<#Esc::#^!+Esc

;DexTab�����л���
<#`::<#^!+`

; ����͸����
<#PgUp::#^!+PgUp
<#PgDn::#^!+PgDn
