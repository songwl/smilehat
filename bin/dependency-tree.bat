@echo off

echo [INFO] �鿴������.


cd %~dp0

cd ..

call mvn dependency:tree
cd bin
pause
cd bin
pasuse