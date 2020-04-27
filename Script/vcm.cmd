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
set "Btemp=%Bpath%Build\%Bname%\%Bhost%"

:: ����Ƿ��� patch �����ļ�
 if exist "%Bpath%Patch\%Bname%.patch" (
   copy /Y "%Bpath%Patch\%Bname%.patch" "%Bpath%Source\%Bname%\%Bname%.patch"
   cd "%Bpath%Source\%Bname%"
   git apply "%Bname%.patch"
   del "%Bpath%Source\%Bname%\%Bname%.patch"
 )

:: ������ڶ������룬��ʹ�ö������룻���� CMake ��֧�ֵ���Ŀ���磺boost, QT ��
if exist "%Bpath%Single\%Bname%.cmd" (
   call "%Bpath%Single\%Bname%.cmd" %Bpath% %BInst% %Bname% %Bplat% %Blang% %Bhost% %Bconf%
   goto bEnd
)

:: ���� CMake �������
set "sFile=%Bpath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

:: ���� patch Ŀ¼���Ƿ���ͬ��Ŀ���Ƶ� txt �ı�����������ƹ�������������Ϊ CMakelists.txt
 if exist "%Bpath%Patch\%Bname%.txt" (
   copy /Y "%Bpath%Patch\%Bname%.txt" "%Bpath%Source\%Bname%\CMakelists.txt" 
)

:: ����Ƿ��� CMakeLists.txt �ļ������û�У��˳�����
if not exist "%Bpath%Source\%Bname%\CMakelists.txt" (
   echo û�� CMakelists.txt �ļ�����֧�ֱ���
   goto bEnd
) 

:: ��ʼ CMake ����
if exist "%Bpath%Source\%Bname%" (
	CMake  %Bpara% -DCMAKE_INSTALL_PREFIX=%BInst% -Thost=%Bhost% -B "%Btemp%" -G %Blang% -A %Bplat% %Bpath%Source\%Bname%
	CMake "%Btemp%"
	
:: ����֮ǰ������Ƿ��й����ļ���Ҫ�޸ĵĲ���������������ļ��򲹶� (xz ���������⣬���ܱ��� MT ����)
if exist "%Bpath%Patch\%Bname%_sln.cmd" (
  call "%Bpath%Patch\%Bname%_sln.cmd" %Btemp%
)

:: VC ����̱��룻�ӿ�����ٶȣ�����������Ʋ���ȷ����Ӱ����룬ֻ�ǲ���ʹ�� VC �Ķ���̱��롣����̱������ܶ���̱��룬����󹤳�ʱ��������������Ӧ�ٶ�
	MSBuild.exe %Btemp%\%Bproj% /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%Bconf%;Platform=%Bplat%^
 /flp1:LogFile=%Btemp%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%Btemp%\zwarns.log;warningsonly;Verbosity=diagnostic

:: ��� VC �����Ƿ��д���
  if %ERRORLEVEL% NEQ 0 (
  echo ������ִ���ֹͣ����
  goto bEnd
  )
  
:: ������� VC ����̱���û���κ����⣬����Ͳ����ٱ����ˣ�ֱ�Ӱ�װ��
	CMake --build "%Btemp%" --config %Bconf% --target install
	
:: ��� CMake �����Ƿ��д���
  if %ERRORLEVEL% NEQ 0 (
  echo ������ִ���ֹͣ����
  goto bEnd
  )
  
echo  ������ɣ�������ʱ�ļ�
title ������ɣ�������ʱ�ļ�
  :: Դ���뻹ԭ
  cd "%Bpath%Source\%Bname%"
  if exist "%Bpath%Source\%Bname%\.git\" (
    git clean -d  -fx -f
    git checkout .
  )
  
  :: ɾ����ʱ�ļ� 
	if exist "%Bpath%%Bname%.tar.gz" del "%Bpath%%Bname%.tar.gz"
	if exist "%Bpath%%Bname%.tar"    del "%Bpath%%Bname%.tar"
)

:bEnd
