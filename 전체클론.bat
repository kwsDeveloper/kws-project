@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0.."

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
echo   all = clone all [new]
echo   num = clone by number
echo ==============================
set /p choice=Choice:
echo.

if /i "%choice%"=="all" goto :clone_all

rem --- single selection ---
set found=0
for /l %%i in (1,1,%total%) do (
    if "%%i"=="%choice%" set found=1
)
if "%found%"=="0" (
    echo Invalid selection.
    goto :end
)

set "name=!repo_%choice%!"
if exist "!name!" (
    echo [!name!] Already exists - skipped.
) else (
    echo [!name!] Cloning...
    git clone https://github.com/kwsDeveloper/!name!.git
    echo Done.
)
goto :end

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
echo Done. !cloned! project(s) cloned.

:end
echo.
pause
