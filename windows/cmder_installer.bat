@echo off
echo.
echo [CMDER]

set CMDER_DIR=%UserProfile%\cmder
set DOWNLOAD_FILE=%CMDER_DIR%\cmder.zip

echo Installing cmder into %CMDER_DIR%...
If Not Exist %CMDER_DIR% (
  mkdir %CMDER_DIR%
)

If Not Exist %CMDER_DIR%\cmder.exe (
  echo Downloading Cmder... ^(Heavy Boi^)

  If Not Exist %DOWNLOAD_FILE% (
    powershell -c "[Net.ServicePointManager]::SecurityProtocol = 'tls12, tls11, tls'; Invoke-WebRequest -Uri 'https://github.com/cmderdev/cmder/releases/download/v1.3.11/cmder.zip' -OutFile '%DOWNLOAD_FILE%'"
  ) Else (
    echo Downloaded Cmder.
  )

  echo Extracting Cmder...
  powershell -c "Expand-Archive %DOWNLOAD_FILE% -DestinationPath %CMDER_DIR%"

  echo Installing Cmder...
  powershell -c "$xmlDoc = [xml](Get-Content '%CMDER_DIR%\vendor\ConEmu.xml.default'); $xmlDoc.SelectSingleNode(""""//value[@name='StartTasksName']"""").setAttribute('data', '{bash::bash}'); $xmlDoc.Save('%CMDER_DIR%\vendor\ConEmu.xml.default');"

  echo Cmder installed.
) Else (
  echo Cmder already installed.
)
