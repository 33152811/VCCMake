@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set BuildLanguageX=%4
set BakupCurrentCD=%5
set SourceProjName=%6
set BuildHostX8664=%7

set BuildPath=%BakupCurrentCD%Build\%SourceProjName%\%BuildHostX8664%

:: 检查是否有 patch 补丁文件
 if exist "%BakupCurrentCD%Patch\%SourceProjName%.patch" (
   copy /Y "%BakupCurrentCD%Patch\%SourceProjName%.patch" "%BakupCurrentCD%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%BakupCurrentCD%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%BakupCurrentCD%Source\%SourceProjName%\%SourceProjName%.patch"
 )

:: 建立编译目录
md %BuildPath%
cd %BuildPath%

meson %SourceCodePath% --buildtype=release --prefix=%InstallSDKPath% --backend=vs

:: 字符串搜索替换
rem powershell -Command "(gc %liblzmavcxprojName%) -replace '%strMD%', '%strMT%' | Out-File %liblzmavcxprojName%"
powershell -Command "(gc %liblzmavcxprojName%) -replace '%strMD%', '%strMT%' | Out-File %liblzmavcxprojName%"


MSBuild.exe %SourceProjName%.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build ^
 /property:Configuration=Release;Platform=%BuildPlatform_%;DefineConstants="_VISUALC_;NeedFunctionPrototypes;FFI_BUILDING;GIO_COMPILATION;GLIB_COMPILATION;GOBJECT_COMPILATION;HAVE_CONFIG_H;LINK_SIZE=2;MATCH_LIMIT=10000000;MATCH_LIMIT_RECURSION=10000000;MAX_NAME_SIZE=32;MAX_NAME_COUNT=10000;MAX_DUPLENGTH=30000;NEWLINE=-1;PCRE_STATIC;POSIX_MALLOC_THRESHOLD=10;SUPPORT_UCP;SUPPORT_UTF8;_LIB"^
 /flp1:LogFile=zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zwarns.log;warningsonly;Verbosity=diagnostic

rem   :: 源代码还原
rem   cd "%Bpath%Source\%Bname%"
rem   if exist "%Bpath%Source\%Bname%\.git\" (
rem     git clean -d  -fx -f
rem     git checkout .
  )
