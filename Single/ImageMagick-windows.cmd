@echo off

set SourceCodePath=%1
set InstallSDKPath=%2
set BuildPlatform_=%3

cd %SourceCodePath%

bash --login -i -c "./CloneRepositories.sh https://github.com/ImageMagick full"

MSBuild.exe .\VisualMagick\configure\configure.sln^
 /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=Release;Platform=%BuildPlatform_%^
 /flp1:LogFile=zxerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zxwarns.log;warningsonly;Verbosity=diagnostic

call .\VisualMagick\configure\configure.exe

MSBuild.exe .\VisualMagick\VisualStaticMT.sln^
 /nologo /consoleloggerparameters:Verbosity=minimal /maxcpucount /nodeReuse:true^
 /target:Build /property:Configuration=Release;Platform=%BuildPlatform_%^
 /flp1:LogFile=zxerror.log;errorsonly;Verbosity=diagnostic^
 /flp2:LogFile=zxwarns.log;warningsonly;Verbosity=diagnostic
