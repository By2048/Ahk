wz0314 2016-03-21 原文
取消IE代理服务器

*************************************************************************************************

@echo off

echo 开始设置取消xproxy代理..........

echo 现在程序将关闭您的浏览器。。。。。
taskkill /f /im iexplore.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "" /f
color 2
echo 已取消代理服务器上网
echo 按任意键关闭此对话框
pause>nul

***************************************************************************************************

设置IE代理服务器

***************************************************************************************************

@echo off
echo 开始设置proxy代理..........
echo 现在程序将关闭您的浏览器。。。。。
taskkill /f /im iexplore.exe
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d "192.168.20.228:8889" /f
color 2
echo 已成功设置代理服务器上网
echo 按任意键关闭此对话框
pause>nul