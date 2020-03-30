@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set BuildLanguage_=%4

if %BuildPlatform_% == x64 (
  set PlatformModel=64
) else (
  set PlatformModel=32
)

@echo %BuildLanguage_% | findstr /c:"2017">nul
@if %errorlevel% equ 1 (
  set LangToolset=msvc-14.1
) else (
  set LangToolset=msvc-14.2
)

cd %SourceCodePath%
git.exe clean -d  -fx -f
call bootstrap.bat
b2 install --prefix=%InstallSDKPath% --toolset=%LangToolset% address-model=%PlatformModel% link=static runtime-link=static  threading=multi
