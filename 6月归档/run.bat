@echo off
color 1f
mode con: cols=100 lines=36
title Windows 10 �Ż�С����

set TempFile_Name=%SystemRoot%\System32\BatTestUACin_SysRt%Random%.batemp
( echo "BAT Test UAC in Temp" >%TempFile_Name% ) 1>nul 2>nul
if exist %TempFile_Name% (
del %TempFile_Name% 1>nul 2>nul
goto menu
) else (
goto failed
)

:menu
cls
echo.
echo.
echo                   ��ѡ����Ҫִ�еĲ���
echo.
echo                     1.ϵͳ����
echo.
echo                     2.Appx����
echo.
echo                     3.ϵͳ����
echo.
echo                     4.office����
echo.
echo                     5.����
echo.
echo                     E.�˳�
echo.
echo                                          by. Jay666 ��������
echo.     
echo.
set /p bg= ������ѡ��Ķ�Ӧ�ı��:
if %bg%==1 goto settings
if %bg%==2 goto appx
if %bg%==3 goto activation
if %bg%==4 goto office
if %bg%==5 goto other
if %bg%==E exit
goto error

:settings
cls
echo.
title ϵͳ����
echo   =====================================================================
echo                        Windows 10 ϵͳ����                      
echo   =====================================================================
echo.
echo  ��1��ȥ������С��ͷ����׺�Ͷ���ͼ��
echo  ��2�����ص�����OneDrive              
echo  ��3�����ص��������ƶ��豸��U�̣�
echo  ��R������                            ��E���˳�
echo.
set /p set=��������Ҫ���ö�Ӧ�ı��:
if %set%==1 goto set1
if %set%==2 goto set2
if %set%==3 goto set3
if /i %set%==R goto menu
if /i %set%==E exit
goto error

:set1
cls
echo.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 29 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
taskkill /f /im explorer.exe
start explorer
echo.
pause
goto settings

:set2
cls
echo.
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v Attributes /t REG_DWORD /d 0xf090004d /f
reg add "HKEY_CLASSES_ROOT\WOW6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v Attributes /t REG_DWORD /d 0xf090004d /f
taskkill /f /im explorer.exe
start explorer
echo.
pause
goto settings

:set3
cls
echo.
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
taskkill /f /im explorer.exe
start explorer
echo.
pause
goto settings

:appx
cls
echo.
title Appx����
echo   =====================================================================
echo                        Windows 10 Appx����                     
echo   =====================================================================
echo.
echo   PS:һ��ж�أ�������OneNote��Sticky Notes��3D Builder��SkypeԤ����
echo                ����¼���������Ӻ�ʱ�ӡ���Ϣ
echo.
echo  ��1��һ��ж��
echo.
echo   ����ѡ�ã�
echo.
echo  ��A��Groove����                      ��B����Ӱ�����
echo  ��C��������                          ��D����ͼ
echo.
echo  ��F����װ��������Ӧ��
echo.
echo  ��R������                            ��E���˳�
echo.
set /p app= ������ѡ��Ķ�Ӧ�ı��:
if /i %app%==show goto show
if /i %app%==del goto del
if %app%==1 goto app1
if /i %app%==A goto appA
if /i %app%==B goto appB
if /i %app%==C goto appC
if /i %app%==D goto appD
if /i %app%==F goto appF
if /i %app%==R goto menu
if /i %app%==E exit
goto error

:app1
cls
echo.
powershell "Get-AppxPackage *people* | Remove-AppxPackage"
powershell "Get-AppxPackage *OneNote* | Remove-AppxPackage"
powershell "Get-AppxPackage *Sticky* | Remove-AppxPackage"
powershell "Get-AppxPackage *sky* | Remove-AppxPackage"
powershell "Get-AppxPackage *Alarm* | Remove-AppxPackage"
powershell "Get-AppxPackage *soundrec* | Remove-AppxPackage"
powershell "Get-AppxPackage *solit* | Remove-AppxPackage"
powershell "Get-AppxPackage *messaging* | Remove-AppxPackage"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:appA
cls
echo.
powershell "Get-AppxPackage *ZuneMusic* | Remove-AppxPackage"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:appB
cls
echo.
powershell "Get-AppxPackage *ZuneVideo* | Remove-AppxPackage"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:appC
cls
echo.
powershell "Get-AppxPackage *calc* | Remove-AppxPackage"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:appD
cls
echo.
powershell "Get-AppxPackage *Maps* | Remove-AppxPackage"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:appF
cls
echo.
powershell "Get-AppxPackage -AllUsers| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register ��$($_.InstallLocation)\AppXManifest.xml��}"
echo ִ����ɣ������������һ���˵�
pause >nul
goto appx

:other
cls
echo.
title ��������
echo   =====================================================================
echo                        Windows 10 ��������                  
echo   =====================================================================
echo.
echo   > �ر�������
echo       WIN10����---�豸(��������ӡ�������)--�������رռ���
echo   > �ر��Զ�����:
echo       WIN10����---�豸(��������ӡ�������)--�Զ����ţ��رռ���
echo   > �û��˻�����
echo       ������� ---�û��˻�---�����û��˻�����
echo   >  ���ѽ��
echo       ������� ---���ѽ��---����������
echo   > ��ȫ��ά����Ϣ��ʾ
echo       �������---��ȫ��ά��--��లȫ��ά������
echo   > Windows SmartScreenɸѡ��
echo       �������---��ȫ��ά��--������Windows SmartScreenɸѡ��
echo.
echo   VMware Workstation 12���к�: 5A02H-AU243-TZJ49-GTC7K-3C61N
echo.
echo   AIDA64Extreme���кţ�ULUG1-PRWD6-U8DA7-8DMM4-FUYR8
echo.
echo   3dmark �߼���: 3DM-ICF-3DK7M-UHUP2-9LSSH-CJQCD
echo.
echo   ���ͨ �û��������� ע���룺7C81-1689-4046-626F
echo.
echo  ��R������                           ��E���˳�
echo.
set /p oth=������ѡ��Ķ�Ӧ�ı��:
if /i %oth%==R goto menu
if /i %oth%==E exit
goto error

:activation
cls
echo.
title WIN10רҵ�漤��
echo   =====================================================================
echo               Windows 10 רҵ�� һ���Զ�����(������)                
echo   =====================================================================
echo.
echo  ��1���鿴ϵͳ����״̬                ��2��һ�����ü���(��ʾȷ������)
echo.
echo  ��3���������֤����Ѿ����ּ���Ĳ�Ҫ����ܻ��Ī����������⣩
echo.     
echo   ��ͥ������רҵ����Կ��VK7JG-NPHTM-C97JM-9MPGT-3V66T
echo.
echo  ��R������                            ��E���˳�
echo.
set /p atc= ������ѡ��Ķ�Ӧ�ı��:
if %atc%==1 goto status
if %atc%==2 goto activate1
if %atc%==3 goto activate2
if /i %atc%==R goto menu
if /i %atc%==E exit
goto error

:status
cls
slmgr.vbs -dlv
slmgr.vbs -dli
slmgr.vbs -xpr
echo ִ����ɣ������������һ���˵�
pause>nul
goto activation

:activate1
slmgr /upk
slmgr -ipk KNXB4-F82M9-TB3X9-P9PQ6-RRG6Y
slmgr -ato
slmgr -ipk H4P26-TH7MK-493PP-8HHGH-Q98QT
slmgr -ato
slmgr -ipk 4G8GX-F3J3P-3KVMG-BG6RB-WCDGR
slmgr -ato
slmgr -ipk TPJ6C-YY8KK-Y7XHQ-GDW7H-DFQJV
slmgr -ato
slmgr -ipk CKQMQ-DNPGJ-2FQGT-M3Q2W-Q68K3
slmgr -ato
echo ִ����ɣ������������һ���˵�
pause>nul
goto activation

:activate2
slmgr -ipk VK7JG-NPHTM-C97JM-9MPGT-3V66T
slmgr -ato
echo ִ����ɣ������������һ���˵�
pause>nul
goto activation

:office
cls
echo.
title Office����
echo   =====================================================================
echo           Office Professional Plus 2016��רҵ��Plus��
echo   =====================================================================
echo.
echo  ��1������                            ��2���鿴����״̬
echo  ��R������                            ��E���˳�
echo.
set /p off= ������ѡ��Ķ�Ӧ�ı��:
if %off%==1 goto office1
if %off%==2 goto office2
if /i %off%==R goto menu
if /i %off%==E exit
goto error

:office1
cls
setlocal EnableDelayedExpansion&color 3e & cd /d "%~dp0"

::�޸���������ݣ�����ѡ����ʹ�õ�KMS����������������˶�Σ�������Ч

::set KMS_Sev=192.168.2.8
::set KMS_Sev=1.2.7.0
set KMS_Sev=kms.lotro.cc
::set KMS_Sev=54.223.212.31
::set KMS_Sev=kms.guowaifuli.com
::set KMS_Sev=mhd.kmdns.net
::set KMS_Sev=xykz.f3322.org
::set KMS_Sev=106.186.25.239
::set KMS_Sev=110.noip.me
::set KMS_Sev=3rss.vicp.net:20439
::set KMS_Sev=45.78.3.223
::set KMS_Sev=kms.chinancce.com
::set KMS_Sev=kms.didichuxing.com
::set KMS_Sev=skms.ddns.net
::set KMS_Sev=zh.us.to
::set KMS_Sev=franklv.ddns.net
::set KMS_Sev=k.zpale.com
::set KMS_Sev=m.zpale.com
::set KMS_Sev=mvg.zpale.com
::set KMS_Sev=122.226.152.230
::set KMS_Sev=222.76.251.188
::set KMS_Sev=annychen.pw
::set KMS_Sev=heu168.6655.la
::set KMS_Sev=kms.aglc.cc
::set KMS_Sev=kms.landiannews.com
::set KMS_Sev=kms.shuax.com
::set KMS_Sev=kms.xspace.in
::set KMS_Sev=winkms.tk
::set KMS_Sev=wrlong.com

if exist "%ProgramFiles%\Microsoft Office\Office16\ospp.vbs" cd /d "%ProgramFiles%\Microsoft Office\Office16"
if exist "D:\Program Files\Microsoft Office\Office16" cd /d "D:\Program Files\Microsoft Office\Office16"

echo ���ڰ�װ KMS ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_kms*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul

echo ���ڰ�װ MAK ���֤...
for /f %%x in ('dir /b ..\root\Licenses16\project???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\proplusvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\standardvl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul
for /f %%x in ('dir /b ..\root\Licenses16\visio???vl_mak*.xrm-ms') do cscript ospp.vbs /inslic:"..\root\Licenses16\%%x" >nul

echo ���ڵ��� KMS GVLK...
cscript ospp.vbs /inpkey:NYH39-6GMXT-T39D4-WVXY2-D69YY >nul
cscript ospp.vbs /inpkey:7WHWN-4T7MP-G96JF-G33KR-W8GF4 >nul
cscript ospp.vbs /inpkey:RBWW7-NTJD4-FFK2C-TDJ7V-4C2QP >nul
cscript ospp.vbs /inpkey:XQNVK-8JYDB-WJ9W3-YJ8YR-WFG99 >nul
cscript ospp.vbs /inpkey:YG9NW-3K39V-2T3HJ-93F3Q-G83KT >nul
cscript ospp.vbs /inpkey:PD3PC-RHNGV-FXJ29-8JK7D-RJRJK >nul

echo ���ڳ��� KMS ����...
cscript //nologo ospp.vbs /sethst:%KMS_Sev% >nul
cscript //nologo ospp.vbs /act | find /i "successful" && (
        echo.&echo ***** Office2016 ����ɹ� ***** & echo.) || (echo.&echo ***** Office2016 ����ʧ�� ***** & echo.
        echo ���������Ƿ�ͨ���Լ�ѡ���޸������� KMS ������������)
echo ִ����ɣ������������һ���˵�
pause>nul
goto office

:office2
cls
echo.
cscript.exe "C:\Program Files\Microsoft Office\Office16\OSPP.VBS" /dstatus
echo ִ����ɣ������������һ���˵�
pause>nul
goto office

:error
cls
echo.
title �������
echo   =====================================================================
echo                        Windows 10 �Ż�С����                               
echo   =====================================================================
echo.
echo           ����������������롣�������� 
echo.
echo ��������������˵�
pause >nul
goto menu

:failed
cls
color 0a
mode con: cols=50 lines=15
title ����ʧ��
echo.
echo.
echo    ����ʧ�ܡ�
echo    ���Ҽ����Թ���Ա������С�
echo.
echo    ��������˳�...
echo.
echo.
pause >nul
exit