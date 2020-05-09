@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set QTInstallPath=%InstallSDKPath%\QT5\static
set "LLVM_INSTALL_DIR=%InstallSDKPath%"
set "QTSRC=%VCMakeRootPath%Source\%SourceProjName%"

:: ����Դ����Ŀ¼ 
set "QTSRCDisk=%QTSRC:~0,2%
cd\
%QTSRCDisk%
cd\
cd "%QTSRC%"


rem :: �л���֧
rem git checkout -b 5.15.0 v5.15.0

rem :: ����Ƿ��� patch �����ļ�
rem  if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
rem    copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem    cd "%VCMakeRootPath%Source\%SourceProjName%"
rem    git apply "%SourceProjName%.patch"
rem    del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem  )

:: ���û�������
set "Path=%CurrentCD%Tools\CMake\bin;%CurrentCD%Tools\jom_1_1_3;%CurrentCD%Tools\Meson;%CurrentCD%Tools\bison\bin;%CurrentCD%Tools\Perl\Perl\bin;%CurrentCD%Tools\flex\bin;%CurrentCD%Tools\Python2.7;%CurrentCD%Tools\Python2.7\Scripts;%SetupPath%\bin;C:\Windows;C:\Windows\System32;"
set "UseEnv=False"

:: �޸ı������
rename  "qtbase\mkspecs\common\msvc-desktop.conf"  "msvc-desktop.conf.bak" 
copy /Y "%VCMakeRootPath%Single\msvc-desktop.conf" "%VCMakeRootPath%Source\%SourceProjName%\qtbase\mkspecs\common\msvc-desktop.conf"

:: ���� VS2017 �������� (x86) <qtWebEngine���ܾ�̬����>
call "C:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\VC\Auxiliary\Build\vcvars32.bat"

:: ����
call configure -confirm-license -opengl desktop -opensource -system-doubleconversion -platform win32-msvc -mp -release -static -prefix "%QTInstallPath%" -nomake examples  -nomake tests -opengl desktop
call jom
call jom install

:: Դ���뻹ԭ
rem git clean -d  -fx -f
rem git checkout .
del /Q  "%VCMakeRootPath%Source\%SourceProjName%\qtbase\mkspecs\common\msvc-desktop.conf"
rename "qtbase\mkspecs\common\msvc-desktop.conf.bak" "msvc-desktop.conf" 
