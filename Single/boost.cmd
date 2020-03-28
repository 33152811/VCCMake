@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3

if %BuildPlatform_% == x86 (
  set PlatformModel=32
) else (
  set PlatformModel=64
)

cd %SourceCodePath%
call bootstrap.bat
b2 install --prefix=%InstallSDKPath% --toolset=msvc-14.1 address-model=%PlatformModel% link=static runtime-link=static  threading=multi
