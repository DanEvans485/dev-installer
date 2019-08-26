@echo off 
echo [TEEMILL WINDOWS INSTALLER] 
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
@echo off
echo.
echo [GIT]

setlocal ENABLEDELAYEDEXPANSION

set CMDER_DIR=%UserProfile%\cmder
set GIT_DIR=%UserProfile%\github

set GIT_REPOS=%GIT_REPOS%;"teedev-docker https://github.com/Teemill/teedev-docker.git"
set GIT_REPOS=%GIT_REPOS%;"teedev-core https://github.com/Teemill/teedev-core.git"
set GIT_REPOS=%GIT_REPOS%;"teedev https://github.com/Teemill/teedev.git"

set git=%CMDER_DIR%\vendor\git-for-windows\bin\git.exe

If Not Exist %GIT_DIR% (
  mkdir  %GIT_DIR%
)
cd %GIT_DIR%

for %%A in (%GIT_REPOS%) do (
  for /f "tokens=1,2 delims= " %%a in ("%%A") do (
    set REPO_NAME=%%a
    set REPO_HTTP=%%b
  )

  echo Cloning !REPO_NAME!...
  If Not Exist %GIT_DIR%\!REPO_NAME! (
    %git% clone !REPO_HTTP!
  ) Else (
    echo !REPO_NAME! already exists.
  )
)
@echo off
echo.
echo [DOCKER]

set DOWNLOAD_FILE=%UserProfile%\Downloads\docker_for_windows_installer.exe

WHERE docker >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
  echo Downloading Docker... ^(Heavy Boi^)

  If Not Exist %DOWNLOAD_FILE% (
    powershell -c "Invoke-WebRequest -Uri 'http://download.docker.com/win/stable/Docker%%20for%%20Windows%%20Installer.exe' -OutFile '%DOWNLOAD_FILE%'"
  ) Else (
    echo Docker already downloaded.
  )

  echo Running docker installer...
  start /WAIT %DOWNLOAD_FILE%

  echo Docker was installed.
) Else (
  echo Docker has already been installed.
)
echo Done... 
pause 
