@echo off
set TARGET=%~dp0auto_update.vbs
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "KWS_AutoUpdate" /t REG_SZ /d "%TARGET%" /f
echo.
echo ============================
echo   등록 완료
echo ============================
echo.
echo PC 시작 시 자동으로 업데이트됩니다.
echo 해제하려면 시작프로그램해제.bat 를 실행하세요.
echo.
pause
