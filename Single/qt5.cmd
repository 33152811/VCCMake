@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set BuildLanguageX=%4
set BakupCurrentCD=%5
set SourceProjName=%6
set QTInstallPath=%InstallSDKPath%\QT5\static

:: 检查是否有 patch 补丁文件
 if exist "%BakupCurrentCD%\Patch\%SourceProjName%.patch" (
   copy /Y "%BakupCurrentCD%\Patch\%SourceProjName%.patch" "%BakupCurrentCD%\Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%BakupCurrentCD%\Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%BakupCurrentCD%\Source\%SourceProjName%\%SourceProjName%.patch"
 )

cd %SourceCodePath%
configure -confirm-license -opensource -platform win32-msvc -mp -debug-and-release -static -prefix "%QTInstallPath%" -nomake examples  -nomake tests
call jom
call jom install
