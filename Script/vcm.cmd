@echo off
SETLOCAL EnableDelayedExpansion

set "Bpath=%1"
set "Bname=%2"
set "Blang=%3"
set "Bplat=%4"
set "Bhost=%5"
set "Bconf=%6"
set "BInst=%7"
set "BProj=%8"
set "Btemp=%Bpath%_Build_"

:: 设置 CMake 编译参数
set "sFile=%Bpath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

:: 检查是否有 CMakeLists.txt 文件；如果没有，查找 patch 目录下是否有同项目名称的 txt 文本，如果有则复制过来，并重命名为 CMakelists.txt
if not exist "%Bpath%Source\%Bname%\CMakelists.txt" (
 if exist "%Bpath%Patch\%Bname%.txt" (
   copy /Y "%Bpath%Patch\%Bname%.txt" "%Bpath%Source\%Bname%\CMakelists.txt" 
 ) else (
   echo 没有 CMakelists.txt 文件，不支持编译
   goto bEnd
   )
)

:: 检查是否有 patch 补丁文件
 if exist "%Bpath%Patch\%Bname%.patch" (
   copy /Y "%Bpath%Patch\%Bname%.patch" "%Bpath%Source\%Bname%\%Bname%.patch"
   cd "%Bpath%Source\%Bname%"
   git apply "%Bname%.patch"
   del "%Bpath%Source\%Bname%\%Bname%.patch"
 )

:: 开始 CMake 编译
if exist "%Bpath%Source\%Bname%" (
	CMake  %Bpara% -DCMAKE_INSTALL_PREFIX=%BInst% -Thost=%Bhost% -B "%Btemp%" -G %Blang% -A %Bplat% %Bpath%Source\%Bname%
	CMake "%Btemp%"
	
:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
	MSBuild.exe %Btemp%\%Bproj% /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%Bconf%;Platform=%Bplat%^
 /flp1:LogFile=%Bpath%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%Bpath%\zwarns.log;warningsonly;Verbosity=diagnostic

:: 检查 VC 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )
  
:: 如果上面 VC 多进程编译没有任何问题，这里就不会再编译了，直接安装了
	CMake --build "%Btemp%" --config %Bconf% --target install
	
:: 检查 CMake 编译是否有错误
  if %ERRORLEVEL% NEQ 0 (
  echo 编译出现错误，停止编译
  goto bEnd
  )
  
echo  编译完成，清理临时文件
title 编译完成，清理临时文件
	rd /s /q %Btemp%
	if exist "%Bpath%%Bname%.tar.gz" del "%Bpath%%Bname%.tar.gz"
	if exist "%Bpath%%Bname%.tar"    del "%Bpath%%Bname%.tar"
	if exist "%Bpath%zerror.log"     del "%Bpath%zerror.log"
	if exist "%Bpath%zwarns.log"     del "%Bpath%zwarns.log"
)

:bEnd
