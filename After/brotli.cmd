@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7

copy /Y "%InstallSDKPath%\brotlicommon-static.lib" "%InstallSDKPath%\brotlicommon.lib"
copy /Y "%InstallSDKPath%\brotlidec-static.lib" "%InstallSDKPath%\brotlidec.lib"
copy /Y "%InstallSDKPath%\brotlienc-static.lib" "%InstallSDKPath%\brotlienc.lib"
