#SingleInstance Force
#NoTrayIcon



if (not A_IsAdmin) {
    Run *RunAs "%A_ScriptFullPath%"
}



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
#+t::Return ;�����л�����������

#^d::return ;������������
#^F4::return ;�رյ�ǰ��������
#^Left::return ;�����л���������
#^Right::return ;�����л���������
; #,::Return ; ͸��������ʾ����



