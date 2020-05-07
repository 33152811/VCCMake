@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7

del  /Q "%InstallSDKPath%\lib\zlib.lib"
copy /Y "%InstallSDKPath%\lib\zlibstatic.lib" "%InstallSDKPath%\lib\zlib.lib"
del  /Q "%InstallSDKPath%\bin\zlib.dll"
