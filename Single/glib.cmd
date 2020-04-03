@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3
set BuildLanguageX=%4
set BakupCurrentCD=%5
set SourceProjName=%6
set BuildHostX8664=%7

set BuildPath=%BakupCurrentCD%Build\%SourceProjName%\%BuildHostX8664%

:: ����Ƿ��� patch �����ļ�
 if exist "%BakupCurrentCD%Patch\%SourceProjName%.patch" (
   copy /Y "%BakupCurrentCD%Patch\%SourceProjName%.patch" "%BakupCurrentCD%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%BakupCurrentCD%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%BakupCurrentCD%Source\%SourceProjName%\%SourceProjName%.patch"
 )

:: ��������Ŀ¼
md %BuildPath%
cd %BuildPath%

meson %SourceCodePath% --buildtype=release --prefix=%InstallSDKPath% --backend=vs

MSBuild.exe %SourceProjName%.sln /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=Release;Platform=%BuildHostX8664%^
 /flp1:LogFile=zerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zwarns.log;warningsonly;Verbosity=diagnostic

  :: Դ���뻹ԭ
  cd "%Bpath%Source\%Bname%"
  if exist "%Bpath%Source\%Bname%\.git\" (
    git clean -d  -fx -f
    git checkout .
  )
