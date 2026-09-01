@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0.."

:refresh
cls
echo.
echo ==============================
echo   Fetching project list...
echo ==============================
echo.

set total=0
for /f "tokens=*" %%r in ('gh repo list kwsDeveloper --json name --jq ".[].name" --limit 100') do (
    set /a total+=1
    set "repo_!total!=%%r"
    if exist "%%r" (
        echo   !total!. %%r  [exists]
    ) else (
        echo   !total!. %%r  [new]
    )
)

if %total%==0 (
    echo No projects found.
    pause
    exit /b
)

echo.
echo ==============================
echo   all   = clone all [new]
echo   1 2 3 = clone selected
echo   q     = quit
echo ==============================
set "choice="
set /p choice=Choice:
echo.

if not defined choice goto :refresh
if /i "%choice%"=="q" exit /b
if /i "%choice%"=="all" goto :clone_all

rem --- selection (space-separated numbers) ---
set cloned=0
for %%t in (%choice%) do (
    set "name=!repo_%%t!"
    if "!name!"=="" (
        echo [%%t] Invalid - skipped.
    ) else if exist "!name!" (
        echo [!name!] Already exists - skipped.
    ) else (
        echo [!name!] Cloning...
        git clone https://github.com/kwsDeveloper/!name!.git
        set /a cloned+=1
        echo Done.
    )
)
echo.
echo !cloned! project(s) cloned.
goto :next

:clone_all
set cloned=0
for /l %%i in (1,1,%total%) do (
    if not exist "!repo_%%i!" (
        echo [!repo_%%i!] Cloning...
        git clone https://github.com/kwsDeveloper/!repo_%%i!.git
        set /a cloned+=1
    )
)
echo.
echo !cloned! project(s) cloned.

:next
echo.
echo Press any key to continue, or close this window to exit.
pause > nul
goto :refresh
