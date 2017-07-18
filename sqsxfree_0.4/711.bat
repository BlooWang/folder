@echo off
@color 0A
pause
sc config Netman start= AUTO
sc start Netman
sc config rasman start= AUTO
sc start rasman
sc config tapisrv start= AUTO
sc start tapisrv
@echo           解除禁止完成 按任意键退出
@echo #####################################################
pause
exit
