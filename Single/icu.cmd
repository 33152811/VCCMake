@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7
set icu4c=%VCMakeRootPath%\Source\%SourceProjName%\icu4c

:: 检查是否有 patch 补丁文件
 if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
   copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%VCMakeRootPath%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
 )

cd %icu4c%

:: 字符串搜索替换 
set "strVcrOld=<RuntimeLibrary>MultiThreadedDLL</RuntimeLibrary>"
set "strVcrNew=<RuntimeLibrary>MultiThreaded</RuntimeLibrary>"

set "strDynOld=<ConfigurationType>DynamicLibrary</ConfigurationType>"
set "strStaNew=<ConfigurationType>StaticLibrary</ConfigurationType>"


for /f %%i in ('dir /b /s /a:-d *.vcxproj') do (
  powershell -Command "(gc %%i) -replace '%strVcrOld%', '%strVcrNew%' | Out-File %%i"
  powershell -Command "(gc %%i) -replace '%strDynOld%', '%strStaNew%' | Out-File %%i"
)

:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
MSBuild.exe "%icu4c%\source\allinone\allinone.sln"^
 /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=Release;Platform=%BuildPlatform_%^
 /flp1:LogFile=zxerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zxwarns.log;warningsonly;Verbosity=diagnostic

rem :: 源代码还原
rem git clean -d  -fx -f
rem git checkout .
