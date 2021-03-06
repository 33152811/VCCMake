@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set SourceCodeName=%3
set BuildPlatform_=%4
set BuildLanguage_=%5

if %BuildPlatform_% == x64 (
  set PlatformModel=64
) else (
  set PlatformModel=32
)

rem @echo %BuildLanguage_% | findstr /c:"2017">nul
rem @if %errorlevel% equ 1 (
  set LangToolset=msvc-14.1
rem ) else (
rem   set LangToolset=msvc-14.2
rem )

cd %SourceCodePath%Source\%SourceCodeName%
git.exe clean -d  -fx -f
call bootstrap.bat
b2 install --prefix=%InstallSDKPath% --toolset=%LangToolset% address-model=%PlatformModel% link=static runtime-link=static  threading=multi release
