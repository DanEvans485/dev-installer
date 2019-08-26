@echo off

set INSTALLER_NAME=windows_installer

echo @echo off > %INSTALLER_NAME%.bat
echo echo [TEEMILL WINDOWS INSTALLER] >> %INSTALLER_NAME%.bat

for /F "tokens=*" %%A in (%~dp0\windows\installers.txt) do (
  type %~dp0\windows\%%A.bat >> %INSTALLER_NAME%.bat
)

echo echo Done... >> %INSTALLER_NAME%.bat
echo pause >> %INSTALLER_NAME%.bat

echo Compiled windows installer.
pause
