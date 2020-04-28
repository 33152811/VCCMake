@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set QTInstallPath=%InstallSDKPath%\QT5\static
set "LLVM_INSTALL_DIR=%InstallSDKPath%"

cd %VCMakeRootPath%Source\%SourceProjName%

:: �л���֧
git checkout -b my5.14 5.14

:: ����Ƿ��� patch �����ļ�
 if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
   copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%VCMakeRootPath%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
 )

:: ����
call configure -confirm-license -opensource -platform win32-msvc -mp -debug-and-release -static -prefix "%QTInstallPath%" -nomake examples  -nomake tests
call jom
call jom install
