#SingleInstance Force
#NoTrayIcon



MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}

#if MouseIsOver("ahk_class Shell_TrayWnd")
    WheelUp::Send {Volume_Up}
    WheelDown::Send {Volume_Down}
#if




#x::Return ; ϵͳ�˵�
#k::Return ; �򿪡����ӡ����ٲ���.
#m::Return ; ��С�����д��ڡ�

#F1::Return ;ϵͳ����
#PrintScreen::Return ;����
#Pause::Return ;�������\���п��������\ϵͳ 

#r::return  ;Run
#i::Return  ;��ϵͳ����
#u::Return  ;��ʾ������
#+s::return ;ԭ����ͼ

#t::Return  ;�����л�����������
#+t::Return

#^d::return ;������������
#^F4::return ;�رյ�ǰ��������
#^Left::return ;�����л���������
#^Right::return ;�����л���������

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

^+Esc::Return ;���������

