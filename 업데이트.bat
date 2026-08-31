@echo off
chcp 65001 > nul
cd /d "%~dp0.."

echo.
echo ============================
echo   프로젝트 업데이트 시작
echo ============================

echo.
echo [1/2] kws-project 업데이트 중...
cd kws-project
git pull
cd ..

echo.
echo [2/2] kws-portal 업데이트 중...
cd kws-portal
git pull
cd ..

echo.
echo ============================
echo   업데이트 완료!
echo ============================
echo.
pause
