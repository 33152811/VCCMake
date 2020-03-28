@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3

cd %SourceCodePath%
rem bash --login -i -c "./CloneRepositories.sh https://github.com/ImageMagick full"
rem MSBuild.exe %SourceCodePath%\VisualMagick\configure\configure.sln^
rem  /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
rem  /target:Build /property:Configuration=Release;Platform=%BuildPlatform_%^
rem  /flp1:LogFile=zxerror.log;errorsonly;Verbosity=diagnostic^
rem  /flp2:LogFile=zxwarns.log;warningsonly;Verbosity=diagnostic

call %SourceCodePath%\VisualMagick\configure\configure.exe