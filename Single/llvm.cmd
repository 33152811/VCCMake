@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7
set BuildLLVMPathX=%VCMakeRootPath%Build\llvm\%BuildHostX8664%
set BuildCLANGPath=%VCMakeRootPath%Build\clang\%BuildHostX8664%

:: 设置 CMake 编译参数
set "sFile=%VCMakeRootPath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

rem :: 检查是否有 patch 补丁文件
rem  if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
rem    copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem    cd "%VCMakeRootPath%Source\%SourceProjName%"
rem    git apply "%SourceProjName%.patch"
rem    del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
rem  )

rem :: 编译 llvm
rem cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildLLVMPathX% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\llvm
rem cmake %BuildLLVMPathX%

rem :: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
rem 	MSBuild.exe %BuildLLVMPathX%\llvm.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
rem  /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
rem  /flp1:LogFile=%BuildLLVMPathX%\zerror.log;errorsonly;Verbosity=diagnostic^
rem  /flp2:LogFile=%BuildLLVMPathX%\zwarns.log;warningsonly;Verbosity=diagnostic

rem :: 检查 VC 编译是否有错误
rem   if %ERRORLEVEL% NEQ 0 (
rem   echo 编译出现错误，停止编译
rem   goto bEnd
rem   )
  
rem :: 如果上面 VC 多进程编译没有任何问题，这里就不会再编译了，直接安装了
rem 	CMake --build "%BuildLLVMPathX%" --config %BuildConfigure% --target install
	
rem :: 检查 CMake 编译是否有错误
rem   if %ERRORLEVEL% NEQ 0 (
rem   echo 编译出现错误，停止编译
rem   goto bEnd
rem   )

rem echo 编译 LLVM 完成后，MSBUILD.EXE 进程并不会全部关闭掉，需手动杀死 MSBUILD.EXE 进程，才可以进行 CLANG 的编译
rem echo 如果 CMake Clang 发生错误，请使用 CMakeGUI 打开 Clang 编译目录，重新 CMake 一下。成功后，再次执行编译
rem pause

:: 编译 clang
echo  编译 llvm - clang
title 编译 llvm - clang
cmake %sPara% -DCMAKE_INSTALL_PREFIX=%InstallSDKPath% -Thost=%BuildHostX8664% -B %BuildCLANGPath% -G %BuildLanguageX% -A %BuildPlatform_% %VCMakeRootPath%\Source\%SourceProjName%\clang
cmake %BuildCLANGPath%

:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
	MSBuild.exe %BuildCLANGPath%\clang.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%BuildConfigure%;Platform=%BuildPlatform_%^
 /flp1:LogFile=%BuildCLANGPath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%BuildCLANGPath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: 检查 VC 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )
  
:: 如果上面 VC 多进程编译没有任何问题，这里就不会再编译了，直接安装了
	CMake --build "%BuildCLANGPath%" --config %BuildConfigure% --target install
	
:: 检查 CMake 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )


:: 源代码还原
git clean -d  -fx -f
git checkout .

:bEnd
