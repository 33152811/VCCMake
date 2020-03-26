@echo off
SETLOCAL EnableDelayedExpansion

set "Bpath=%1"
set "Bname=%2"
set "Blang=%3"
set "Bplat=%4"
set "Bhost=%5"
set "Bconf=%6"
set "BInst=%7"
set "BProj=%8"
set "Btemp=%Bpath%_Build_"

:: ���� CMake �������
set "sFile=%Bpath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

:: ����Ƿ��� CMakeLists.txt �ļ�
if not exist "%Bpath%Source\%Bname%\CMakelists.txt" (
 if exist "%Bpath%\patch\%Bname%.txt" (
   copy "%Bpath%\patch\%Bname%.txt" "%Bpath%Source\%Bname%\CMakelists.txt"
 )
)

:: ��ʼ CMake ����
if exist "%Bpath%Source\%Bname%" (
	CMake  %Bpara% -DCMAKE_INSTALL_PREFIX=%BInst% -Thost=%Bhost% -B "%Btemp%" -G %Blang% -A %Bplat% %Bpath%Source\%Bname%
	CMake "%Btemp%"
	
:: VC ����̱��룻�ӿ�����ٶȣ�����������Ʋ���ȷ����Ӱ����룬ֻ�ǲ���ʹ�� VC �Ķ���̱��롣����̱������ܶ���̱��룬����󹤳�ʱ��������������Ӧ�ٶ�
	MSBuild.exe %Btemp%\%Bproj% /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%Bconf%;Platform=%Bplat%^
 /flp1:LogFile=%Bpath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%Bpath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: ������� VC ����̱���û���κ����⣬����Ͳ����ٱ����ˣ�ֱ�Ӱ�װ��
	CMake --build "%Btemp%" --config %Bconf% --target install
	
echo  ������ɣ�������ʱ�ļ�
title ������ɣ�������ʱ�ļ�
	rd /s /q %Btemp%
	if exist "%Bpath%%Bname%.tar.gz" del "%Bpath%%Bname%.tar.gz"
	if exist "%Bpath%%Bname%.tar"    del "%Bpath%%Bname%.tar"
	if exist "%Bpath%zerror.log"     del "%Bpath%zerror.log"
	if exist "%Bpath%zwarns.log"     del "%Bpath%zwarns.log"
)
