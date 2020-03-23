@echo off
Color A
setlocal EnableDelayedExpansion
  
:: 设置网络代理；如果没有网络代理，可以注释掉这两行代码；
set http_proxy=http://127.0.0.1:41081
set https_proxy=http://127.0.0.1:41081

:: 设置当前目录
set "CurrentCD=%~dp0"

:: 编译参数
set "BuildLang=VS2017"
set "Platform1=Win32"
set "Platform2=x86"
set "Configure=Release"
set "SetupPath=%CurrentCD%VSSDK\%Platform2%"
  
:: 设置系统搜索路径；工具、第三方库都放在搜索路径中；也可以放在系统搜索路径中；但最好放在文件中，因为 WINDOWS 系统的系统搜索路径有字符串长度限制；
@set "sFile=%CurrentCD%Script\px86.txt"
@set "sPath="
@for /f "tokens=*" %%I in (%sFile%) do (set "sPath=!sPath!;%%I")
set "Path=%CurrentCD%\CMake\bin;%SetupPath%;%sPath%;%Path%"

:: 编译语言
if %BuildLang% == VS2017 (
  set CompileLang="Visual Studio 15 2017"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [15.0,16.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
) else (
  set CompileLang="Visual Studio 16 2019"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [16.0,17.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
)
set "Buildtype=%CurrentCD% %CompileLang% %Platform1% %Platform2% %Configure% %SetupPath%"

:: 编译源码
call "%CurrentCD%Script\dlzip" zlib-1.2.11 https://www.zlib.net/zlib-1.2.11.tar.gz          %Buildtype% zlib.sln
call "%CurrentCD%Script\dlzip" SDL2-2.0.12 http://www.libsdl.org/release/SDL2-2.0.12.tar.gz %Buildtype% sdl2.sln
call "%CurrentCD%Script\dlgit" gflags      https://github.com/gflags/gflags.git             %Buildtype% gflags.sln
call "%CurrentCD%Script\dlgit" glog        https://github.com/google/glog.git               %Buildtype% glog.sln

