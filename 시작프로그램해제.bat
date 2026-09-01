@echo off
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "KWS_AutoUpdate" /f
echo.
echo ============================
echo   해제 완료
echo ============================
echo.
echo PC 시작 시 자동 업데이트가 해제되었습니다.
echo.
pause
