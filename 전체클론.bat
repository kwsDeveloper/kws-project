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

if !total!==0 (
    echo No projects found.
    pause
    exit /b
)

echo.
echo ==============================
echo   all  = clone all [new]
echo   num  = clone selected item
echo ==============================
set /p choice=Choice:

echo.

if /i "!choice!"=="all" (
    set cloned=0
    for /l %%i in (1,1,!total!) do (
        if not exist "!repo_%%i!" (
            echo [!repo_%%i!] Cloning...
            git clone https://github.com/kwsDeveloper/!repo_%%i!.git
            set /a cloned+=1
        )
    )
    echo.
    echo Done. !cloned! project(s) cloned.
) else (
    set valid=0
    for /l %%i in (1,1,!total!) do (
        if "%%i"=="!choice!" (
            set valid=1
            if exist "!repo_%%i!" (
                echo [!repo_%%i!] Already exists - skipped.
            ) else (
                echo [!repo_%%i!] Cloning...
                git clone https://github.com/kwsDeveloper/!repo_%%i!.git
                echo Done.
            )
        )
    )
    if "!valid!"=="0" echo Invalid selection.
)

echo.
pause
