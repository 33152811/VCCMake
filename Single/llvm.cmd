@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7
set BuildLLVMPathX=%VCMakeRootPath%Build\llvm\%BuildHostX8664%
set BuildCLANGPath=%VCMakeRootPath%Build\clang\%BuildHostX8664%

:: ���� CMake �������
set "sFile=%VCMakeRootPath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

rem :: ����Ƿ��� patch �����ļ�
rem  if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
rem    copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem    cd "%VCMakeRootPath%Source\%SourceProjName%"
rem    git apply "%SourceProjName%.patch"
rem    del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem  )

rem :: ���� llvm
rem cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildLLVMPathX% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\llvm
rem cmake %BuildLLVMPathX%

rem :: VC ����̱��룻�ӿ�����ٶȣ�����������Ʋ���ȷ����Ӱ����룬ֻ�ǲ���ʹ�� VC �Ķ���̱��롣����̱������ܶ���̱��룬����󹤳�ʱ��������������Ӧ�ٶ�
rem 	MSBuild.exe %BuildLLVMPathX%\llvm.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
rem  /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
rem  /flp1:LogFile=%BuildLLVMPathX%\zerror.log;errorsonly;Verbosity=diagnostic^
rem  /flp2:LogFile=%BuildLLVMPathX%\zwarns.log;warningsonly;Verbosity=diagnostic

rem :: ��� VC �����Ƿ��д���
rem   if %ERRORLEVEL% NEQ 0 (
rem   echo ������ִ���ֹͣ����
rem   goto bEnd
rem   )
  
rem :: ������� VC ����̱���û���κ����⣬����Ͳ����ٱ����ˣ�ֱ�Ӱ�װ��
rem 	CMake --build "%BuildLLVMPathX%" --config %BuildConfigure% --target install
	
rem :: ��� CMake �����Ƿ��д���
rem   if %ERRORLEVEL% NEQ 0 (
rem   echo ������ִ���ֹͣ����
rem   goto bEnd
rem   )

rem echo ���� LLVM ��ɺ�MSBUILD.EXE ���̲�����ȫ���رյ������ֶ�ɱ�� MSBUILD.EXE ���̣��ſ��Խ��� CLANG �ı���
rem echo ��� CMake Clang ����������ʹ�� CMakeGUI �� Clang ����Ŀ¼������ CMake һ�¡��ɹ����ٴ�ִ�б���
rem pause

:: ���� clang
echo  ���� llvm - clang
title ���� llvm - clang
cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildCLANGPath% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\clang
cmake %BuildCLANGPath%

:: VC ����̱��룻�ӿ�����ٶȣ�����������Ʋ���ȷ����Ӱ����룬ֻ�ǲ���ʹ�� VC �Ķ���̱��롣����̱������ܶ���̱��룬����󹤳�ʱ��������������Ӧ�ٶ�
	MSBuild.exe %BuildCLANGPath%\clang.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
 /flp1:LogFile=%BuildCLANGPath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%BuildCLANGPath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: ��� VC �����Ƿ��д���
  if %ERRORLEVEL% NEQ 0 (
  echo ������ִ���ֹͣ����
  goto bEnd
  )
  
:: ������� VC ����̱���û���κ����⣬����Ͳ����ٱ����ˣ�ֱ�Ӱ�װ��
	CMake --build "%BuildCLANGPath%" --config %BuildConfigure% --target install
	
:: ��� CMake �����Ƿ��д���
  if %ERRORLEVEL% NEQ 0 (
  echo ������ִ���ֹͣ����
  goto bEnd
  )


:: Դ���뻹ԭ
git clean -d  -fx -f
git checkout .

:bEnd
