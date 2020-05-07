@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7

copy /Y "%VCMakeRootPath%\after\libtiff-4.pc" "%InstallSDKPath%\lib\pkgconfig\libtiff-4.pc"
