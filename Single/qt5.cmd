@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set BuildLanguageX=%4
set BakupCurrentCD=%5
set SourceProjName=%6
set QTInstallPath=%InstallSDKPath%\QT5\static

set "LLVM_INSTALL_DIR=%InstallSDKPath%"

cd %SourceCodePath%

rem git.exe checkout -b 5.14.2 remotes/origin/5.14.2 --

rem :: 检查是否有 patch 补丁文件
rem  if exist "%BakupCurrentCD%\Patch\%SourceProjName%.patch" (
rem    copy /Y "%BakupCurrentCD%\Patch\%SourceProjName%.patch" "%BakupCurrentCD%\Source\%SourceProjName%\%SourceProjName%.patch"
rem    cd "%BakupCurrentCD%\Source\%SourceProjName%"
rem    git apply "%SourceProjName%.patch"
rem    del "%BakupCurrentCD%\Source\%SourceProjName%\%SourceProjName%.patch"
rem  )

rem configure -confirm-license -opensource -platform win32-msvc -mp -debug-and-release -static -prefix "%QTInstallPath%" -nomake examples  -nomake tests
call jom
call jom install
