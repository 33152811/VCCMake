@echo off

set VCMakeRootPath=%1
set InstallSDKPath=%2
set SourceProjName=%3
set BuildPlatform_=%4
set BuildLanguageX=%5
set BuildHostX8664=%6
set BuildConfigure=%7
set icu4c=%VCMakeRootPath%\Source\%SourceProjName%\icu4c

:: ����Ƿ��� patch �����ļ�
 if exist "%VCMakeRootPath%Patch\%SourceProjName%.patch" (
   copy /Y "%VCMakeRootPath%Patch\%SourceProjName%.patch" "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
   cd "%VCMakeRootPath%Source\%SourceProjName%"
   git apply "%SourceProjName%.patch"
   del "%VCMakeRootPath%Source\%SourceProjName%\%SourceProjName%.patch"
 )

cd %icu4c%

:: �ַ��������滻 
set "strVcrOld=<RuntimeLibrary>MultiThreadedDLL</RuntimeLibrary>"
set "strVcrNew=<RuntimeLibrary>MultiThreaded</RuntimeLibrary>"

set "strDynOld=<ConfigurationType>DynamicLibrary</ConfigurationType>"
set "strStaNew=<ConfigurationType>StaticLibrary</ConfigurationType>"


for /f %%i in ('dir /b /s /a:-d *.vcxproj') do (
  powershell -Command "(gc %%i) -replace '%strVcrOld%', '%strVcrNew%' | Out-File %%i"
  powershell -Command "(gc %%i) -replace '%strDynOld%', '%strStaNew%' | Out-File %%i"
)

:: VC ����̱��룻�ӿ�����ٶȣ�����������Ʋ���ȷ����Ӱ����룬ֻ�ǲ���ʹ�� VC �Ķ���̱��롣����̱������ܶ���̱��룬����󹤳�ʱ��������������Ӧ�ٶ�
MSBuild.exe "%icu4c%\source\allinone\allinone.sln"^
 /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=Release;Platform=%BuildPlatform_%^
 /flp1:LogFile=zxerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zxwarns.log;warningsonly;Verbosity=diagnostic

rem :: Դ���뻹ԭ
rem git clean -d  -fx -f
rem git checkout .
