@echo off

echo [INFO] ���.


cd %~dp0

cd ..

call mvn clean
cd bin
pause
cd bin
pasuse