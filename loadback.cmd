@echo off
set mask=%1\*.bmp.gz
set count=%@random[1,%@files[%mask]]
set name=%@findfirst[%mask]
:loop
if %count == 1 goto load
set name=%@findnext[%mask]
set count=%@dec[%count]
goto loop
:load
Echo Loading Bitmap %name ...
gzip -d < %name > bitmap.bmp
if errorlevel 1 goto end
backgrnd %@full[bitmap.bmp]
:end
del bitmap.bmp
set mask=
set name=
set count=
