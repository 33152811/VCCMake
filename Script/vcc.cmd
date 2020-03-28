@echo off

set CurrentCD=%1
set BuildLang=%2
set Platform1=%3
set Platform2=%4
set Configure=%5
set SetupPath=%6

:: ���� pkgconfig Ŀ¼ 
set "TMP_CONFIG_PATH=%SetupPath%\lib\pkgconfig"
set "PKG_CONFIG_PATH=%TMP_CONFIG_PATH:\=/%"

:: ����ϵͳ����·�������ߡ��������ⶼ��������·���У�Ҳ���Է���ϵͳ����·���У�����÷����ļ��У���Ϊ WINDOWS ϵͳ��ϵͳ����·�����ַ����������ƣ�
@set "sFile=%CurrentCD%Script\p%Platform2%.txt"
@set "sPath="
@for /f "tokens=*" %%I in (%sFile%) do (set "sPath=!sPath!;%%I")
set "Path=%CurrentCD%\CMake\bin;%SetupPath%\bin;%SetupPath%\include;%SetupPath%\lib;%sPath%;%Path%"

:: ��������
if %BuildLang% == VS2017 (
  set CompileLang="Visual Studio 15 2017"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [15.0,16.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
) else (
  set CompileLang="Visual Studio 16 2019"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [16.0,17.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
)

:: MSBuild ͷ�ļ������ļ�����·��
set "INCLUDE=%SetupPath%\include;%CurrentCD%CMake\bin;%INCLUDE%"
set "LIB=%SetupPath%\lib;%LIB%"
set "UseEnv=True"

:: ����Ƿ��� unistd.h �ļ�
if not exist "%SetupPath%\include\unistd.h" (
  if exist "%CurrentCD%CMake\bin\unistd.h" (
  copy /Y "%CurrentCD%CMake\bin\unistd.h" "%SetupPath%\include\unistd.h"
  )
)

:: ����Դ��
"%CurrentCD%vca.cmd" %CurrentCD% %CompileLang% %Platform1% %Platform2% %Configure% %SetupPath%
