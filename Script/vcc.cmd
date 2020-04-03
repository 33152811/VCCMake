@echo off

set CurrentCD=%1
set BuildLang=%2
set Platform1=%3
set Platform2=%4
set Configure=%5
set SetupPath=%6

:: 设置 pkgconfig 目录 
set "TMP_CONFIG_PATH=%SetupPath%\lib\pkgconfig"
set "PKG_CONFIG_PATH=%TMP_CONFIG_PATH:\=/%"

:: 设置系统搜索路径；工具、第三方库都放在搜索路径中；也可以放在系统搜索路径中；但最好放在文件中，因为 WINDOWS 系统的系统搜索路径有字符串长度限制；
set "sFile=%CurrentCD%Script\p%Platform2%.txt"
if exist %sFile% (
  set "sPath="
  for /f "tokens=*" %%I in (%sFile%) do (set "sPath=!sPath!;%%I")
  set "Path=%CurrentCD%Tools\CMake\bin;%CurrentCD%Tools\jom_1_1_3;%CurrentCD%Tools\Meson;%CurrentCD%Tools\Perl;%CurrentCD%Tools\Python3.8;%SetupPath%\bin;%sPath%;%Path%"
) else (
  set "Path=%CurrentCD%Tools\CMake\bin;%CurrentCD%Tools\jom_1_1_3;%CurrentCD%Tools\Meson;%CurrentCD%Tools\Perl;%CurrentCD%Tools\Python3.8;%SetupPath%\bin;%Path%"
)

:: 编译语言
if %BuildLang% == VS2017 (
  set CompileLang="Visual Studio 15 2017"
  set "VSWHERE="%CurrentCD%Tools\CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [15.0,16.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
) else (
  set CompileLang="Visual Studio 16 2019"
  set "VSWHERE="%CurrentCD%Tools\CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [16.0,17.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
)

:: MSBuild 头文件、库文件搜索路径
set "INCLUDE=%SetupPath%\include;%SetupPath%\include\harfbuzz;%SetupPath%\QT5\static\include;%INCLUDE%"
set "LIB=%SetupPath%\lib;%SetupPath%\QT5\static\lib;%LIB%"
set "UseEnv=True"

:: 编译源码
"%CurrentCD%vca.cmd" %CurrentCD% %CompileLang% %Platform1% %Platform2% %Configure% %SetupPath%
