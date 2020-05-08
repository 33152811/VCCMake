@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7

set BuildPath=%VCMakeRootPath%Build\%SourceProjName%\%BuildHostX8664%

:: 检查是否有 patch 补丁文件
 if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
   copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%VCMakeRootPath%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
 )

:: 建立编译目录
md %BuildPath%
cd %BuildPath%

meson %VCMakeRootPath%Source\%SourceProjName% --buildtype=release --prefix=%InstallSDKPath% --backend=vs --build_tests=no

:: 字符串搜索替换
rem powershell -Command "(gc %liblzmavcxprojName%) -replace '%strMD%', '%strMT%' | Out-File %liblzmavcxprojName%"


MSBuild.exe %SourceProjName%.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build ^
 /property:Configuration=Release;Platform=%BuildPlatform_%;DefineConstants="_VISUALC_;NeedFunctionPrototypes;FFI_BUILDING;GIO_COMPILATION;GLIB_COMPILATION;GOBJECT_COMPILATION;HAVE_CONFIG_H;LINK_SIZE=2;MATCH_LIMIT=10000000;MATCH_LIMIT_RECURSION=10000000;MAX_NAME_SIZE=32;MAX_NAME_COUNT=10000;MAX_DUPLENGTH=30000;NEWLINE=-1;PCRE_STATIC;POSIX_MALLOC_THRESHOLD=10;SUPPORT_UCP;SUPPORT_UTF8;_LIB"^
 /flp1:LogFile=zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zwarns.log;warningsonly;Verbosity=diagnostic

  :: 源代码还原
  cd "%Bpath%Source\%Bname%"
  if exist "%Bpath%Source\%Bname%\.git\" (
    git clean -d  -fx -f
    git checkout .
  )
