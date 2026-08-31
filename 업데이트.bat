@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
cd /d "%~dp0.."

echo.
echo ============================
echo   프로젝트 업데이트 시작
echo ============================

set count=0
for /d %%d in (*) do (
    if exist "%%d\.git" (
        set /a count+=1
        echo.
        echo [%%d] 업데이트 중...
        cd "%%d"
        git pull
        cd ..
    )
)

echo.
echo ============================
echo   완료! 총 !count!개 프로젝트 업데이트
echo ============================
echo.
pause
