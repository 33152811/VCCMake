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
set "Btemp=%Bpath%Build\%Bname%\%Bhost%"

:: 检查是否有 patch 补丁文件
 if exist "%Bpath%Patch\%Bname%.patch" (
   copy /Y "%Bpath%Patch\%Bname%.patch" "%Bpath%Source\%Bname%\%Bname%.patch"
   cd "%Bpath%Source\%Bname%"
   git apply "%Bname%.patch"
   del "%Bpath%Source\%Bname%\%Bname%.patch"
 )

:: 如果存在独立编译，就使用独立编译；编译 CMake 不支持的项目；如：boost, QT 等
if exist "%Bpath%Single\%Bname%.cmd" (
   call "%Bpath%Single\%Bname%.cmd" %Bpath% %BInst% %Bname% %Bplat% %Blang% %Bhost% %Bconf%
   goto bEnd
)

:: 设置 CMake 编译参数
set "sFile=%Bpath%Script\vcp.txt"
set "sPara="
for /f "tokens=*" %%I in (%sFile%) do (set "sPara=!sPara! %%I")
set "Bpara=%sPara% %Bpara%"

:: 查找 patch 目录下是否有同项目名称的 txt 文本，如果有则复制过来，并重命名为 CMakelists.txt
 if exist "%Bpath%Patch\%Bname%.txt" (
   copy /Y "%Bpath%Patch\%Bname%.txt" "%Bpath%Source\%Bname%\CMakelists.txt" 
)

:: 检查是否有 CMakeLists.txt 文件；如果没有，退出编译
if not exist "%Bpath%Source\%Bname%\CMakelists.txt" (
   echo 没有 CMakelists.txt 文件，不支持编译
   goto bEnd
) 

:: 开始 CMake 编译
if exist "%Bpath%Source\%Bname%" (
	CMake  %Bpara% -DCMAKE_INSTALL_PREFIX=%BInst% -Thost=%Bhost% -B "%Btemp%" -G %Blang% -A %Bplat% %Bpath%Source\%Bname%
	CMake "%Btemp%"
	
:: 编译之前，检查是否有工程文件需要修改的补丁，有则给工程文件打补丁 (xz 工程有问题，不能编译 MT 类型)
if exist "%Bpath%Patch\%Bname%_sln.cmd" (
  call "%Bpath%Patch\%Bname%_sln.cmd" %Btemp%
)

:: VC 多进程编译；加快编译速度；如果工程名称不正确，不影响编译，只是不能使用 VC 的多进程编译。多进程编译会起很多进程编译，编译大工程时，会拖慢机器相应速度
	MSBuild.exe %Btemp%\%Bproj% /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=%Bconf%;Platform=%Bplat%^
 /flp1:LogFile=%Btemp%\zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=%Btemp%\zwarns.log;warningsonly;Verbosity=diagnostic

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
  :: 源代码还原
  cd "%Bpath%Source\%Bname%"
  if exist "%Bpath%Source\%Bname%\.git\" (
    git clean -d  -fx -f
    git checkout .
  )
  
  :: 删除临时文件 
	if exist "%Bpath%%Bname%.tar.gz" del "%Bpath%%Bname%.tar.gz"
	if exist "%Bpath%%Bname%.tar"    del "%Bpath%%Bname%.tar"
)

:bEnd
