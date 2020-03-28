@echo off
Color A
setlocal EnableDelayedExpansion
  
:: ��������������û�������������ע�͵������д��룻
set http_proxy=http://127.0.0.1:41081
set https_proxy=http://127.0.0.1:41081

:: ���õ�ǰĿ¼
set "CurrentCD=%~dp0"

:: �������
set "BuildLang=VS2017"
set "Platform1=x64"
set "Platform2=x64"
set "Configure=Release"
set "SetupPath=%CurrentCD%VSSDK\%Platform2%"
  
:: ���� pkgconfig Ŀ¼ 
set "TMP_CONFIG_PATH=%SetupPath%\lib\pkgconfig"
set "PKG_CONFIG_PATH=%TMP_CONFIG_PATH:\=/%"

:: ����ϵͳ����·�������ߡ��������ⶼ��������·���У�Ҳ���Է���ϵͳ����·���У�����÷����ļ��У���Ϊ WINDOWS ϵͳ��ϵͳ����·�����ַ����������ƣ�
@set "sFile=%CurrentCD%Script\p%Platform2%.txt"
@set "sPath="
@for /f "tokens=*" %%I in (%sFile%) do (set "sPath=!sPath!;%%I")
set "Path=%CurrentCD%\CMake\bin;%SetupPath%\bin;%SetupPath%\include;%SetupPath%\lib;%sPath%;%Path%"

:: ��������
if %BuildLang% == VS2017 (
  set CompileLang="Visual Studio 15 2017"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [15.0,16.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
) else (
  set CompileLang="Visual Studio 16 2019"
  set "VSWHERE="%CurrentCD%CMake\bin\vswhere.exe" -property installationPath -requires Microsoft.Component.MSBuild Microsoft.VisualStudio.Component.VC.ATLMFC Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -version [16.0,17.0^)"
  for /f "delims=" %%A IN ('!VSWHERE!') DO call "%%A\Common7\Tools\vsdevcmd.bat" -no_logo -arch=%Platform2%
)

:: MSBuild ͷ�ļ������ļ�����·��
set "INCLUDE=%SetupPath%\include;%CurrentCD%CMake\bin;%INCLUDE%"
set "LIB=%SetupPath%\lib;%LIB%"
set "UseEnv=True"

:: ����Ƿ��� unistd.h �ļ�
if not exist "%SetupPath%\include\unistd.h" (
  if exist "%CurrentCD%CMake\bin\unistd.h" (
  copy /Y "%CurrentCD%CMake\bin\unistd.h" "%SetupPath%\include\unistd.h"
  )
)

set "Buildtype=%CurrentCD% %CompileLang% %Platform1% %Platform2% %Configure% %SetupPath%"

:: ����Դ��
call "%CurrentCD%Script\dlzip" zlib-1.2.11                  https://www.zlib.net/zlib-1.2.11.tar.gz                             %Buildtype% zlib.sln
call "%CurrentCD%Script\dlzip" SDL2-2.0.12                  http://www.libsdl.org/release/SDL2-2.0.12.tar.gz                    %Buildtype% sdl2.sln
call "%CurrentCD%Script\dlgit" gflags                       https://github.com/gflags/gflags.git                                %Buildtype% gflags.sln
call "%CurrentCD%Script\dlgit" glog                         https://github.com/google/glog.git                                  %Buildtype% glog.sln
call "%CurrentCD%Script\dlgit" gtest                        https://github.com/google/googletest.git                            %Buildtype% googletest-distribution.sln
call "%CurrentCD%Script\dlgit" bzip2                        https://github.com/osrf/bzip2_cmake.git                             %Buildtype% bzip2.sln
call "%CurrentCD%Script\dlgit" z3                           https://github.com/Z3Prover/z3.git                                  %Buildtype% z3.sln
call "%CurrentCD%Script\dlgit" libjpeg-turbo                https://github.com/libjpeg-turbo/libjpeg-turbo.git                  %Buildtype% libjpeg-turbo.sln
call "%CurrentCD%Script\dlzip" sqlite-snapshot-202003121754 https://www.sqlite.org/snapshot/sqlite-snapshot-202003121754.tar.gz %Buildtype% sqlite.sln
call "%CurrentCD%Script\dlgit" openssl                      https://github.com/janbar/openssl-cmake.git                         %Buildtype% openssl.sln
call "%CurrentCD%Script\dlgit" libssh2                      https://github.com/libssh2/libssh2.git                              %Buildtype% libssh2.sln
call "%CurrentCD%Script\dlgit" curl                         https://github.com/curl/curl.git                                    %Buildtype% curl.sln
call "%CurrentCD%Script\dlgit" libpng                       https://github.com/glennrp/libpng.git                               %Buildtype% libpng.sln
call "%CurrentCD%Script\dlgit" giflib                       https://github.com/xbmc/giflib.git                                  %Buildtype% giflib.sln
