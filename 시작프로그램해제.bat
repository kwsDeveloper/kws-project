@echo off
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "KWS_AutoUpdate" /f
if %errorlevel%==0 (
    echo [OK] Auto-update removed.
) else (
    echo [FAIL] Entry not found or already removed.
)
echo.
pause
