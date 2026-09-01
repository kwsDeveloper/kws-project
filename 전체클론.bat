@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
cd /d "%~dp0.."

echo.
echo ============================
echo   전체 프로젝트 클론 시작
echo ============================

set count=0
for /f "tokens=*" %%r in ('gh repo list kwsDeveloper --json name --jq ".[].name" --limit 100') do (
    if not exist "%%r" (
        set /a count+=1
        echo.
        echo [%%r] 클론 중...
        git clone https://github.com/kwsDeveloper/%%r.git
    ) else (
        echo [%%r] 이미 존재 - 건너뜀
    )
)

echo.
echo ============================
echo   완료! 총 !count!개 프로젝트 클론
echo ============================
echo.
pause
