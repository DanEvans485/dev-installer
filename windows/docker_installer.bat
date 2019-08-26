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
