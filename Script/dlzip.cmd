@echo off

set "Bname=%1"
set "Bhttp=%2"
set "Bpath=%3"
set "Bulid=%4 %5 %6 %7 %8 %9"

if exist "%Bpath%Source\%Bname%"   goto Compile
if exist "%Bpath%%Bname%.tar"      goto Unzip2
if exist "%Bpath%%Bname%.tar.gz"   goto Unzip1

if exist "%Bpath%%Bname%.tar.xz" (
  echo  ��ѹ�� %Bname%
  title ��ѹ�� %Bname%
   7z x "%Bpath%%Bname%.tar.xz" -o"%Bpath%"
   7z x "%Bpath%%Bname%.tar" -o"%Bpath%Source\"
   goto Compile
  )

echo  ���� %Bname%
title ���� %Bname%
 curl -x 127.0.0.1:41081 --connect-timeout 30 --retry 10 --retry-delay 5 -C - -OL %Bhttp%
 if exist "%Bpath%%Bname%.tar.xz" (
  echo  ��ѹ�� %Bname%
  title ��ѹ�� %Bname%
   7z x "%Bpath%%Bname%.tar.xz" -o"%Bpath%"
   7z x "%Bpath%%Bname%.tar" -o"%Bpath%Source\"
   goto Compile
 )

:Unzip1
echo  ��ѹ�� %Bname%
title ��ѹ�� %Bname%
 7z x "%Bpath%%Bname%.tar.gz" -o"%Bpath%"

:Unzip2
echo  ��ѹ�� %Bname%
title ��ѹ�� %Bname%
 7z x "%Bpath%%Bname%.tar" -o"%Bpath%Source\"

:Compile
echo  ���� %Bname%
title ���� %Bname%
 "%Bpath%Script\vcm" %Bpath% %Bname% %Bulid%
