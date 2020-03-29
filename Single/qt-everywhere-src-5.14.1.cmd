@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set QTInstallPath=%InstallSDKPath%\QT5\static

cd %SourceCodePath%
configure -confirm-license -opensource -platform win32-msvc -mp -debug-and-release -static -prefix "%QTInstallPath%" -nomake examples  -nomake tests
call jom
call jom install
