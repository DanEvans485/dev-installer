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
