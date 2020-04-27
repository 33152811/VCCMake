@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7
set BuildSrcPFPath=%VCMakeRootPath%Build\llvm\%BuildHostX8664%

:: 设置 CMake 编译参数
set "sFile=%VCMakeRootPath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

:: 编译 llvm
cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildSrcPFPath% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\llvm
cmake %BuildSrcPFPath%

:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
	MSBuild.exe %BuildSrcPFPath%\llvm.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
 /flp1:LogFile=%BuildSrcPFPath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%BuildSrcPFPath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: 检查 VC 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )
  
:: 如果上面 VC 多进程编译没有任何问题，这里就不会再编译了，直接安装了
	CMake --build "%BuildSrcPFPath%" --config %BuildConfigure% --target install
	
:: 检查 CMake 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )

:: 编译 clang
echo  编译 %Bname%
title 编译 %Bname%
set BuildSrcPFPath=%VCMakeRootPath%Build\clang\%BuildHostX8664%
cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildSrcPFPath% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\clang
cmake %BuildSrcPFPath%

:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
	MSBuild.exe %BuildSrcPFPath%\clang.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
 /flp1:LogFile=%BuildSrcPFPath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%BuildSrcPFPath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: 检查 VC 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )
  
:: 如果上面 VC 多进程编译没有任何问题，这里就不会再编译了，直接安装了
	CMake --build "%BuildSrcPFPath%" --config %BuildConfigure% --target install
	
:: 检查 CMake 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )

:bEnd
