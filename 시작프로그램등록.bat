@echo off
set "TARGET=%~dp0auto_update.vbs"
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "KWS_AutoUpdate" /t REG_SZ /d "%TARGET%" /f
if %errorlevel%==0 (
    echo [OK] Auto-update registered successfully.
    echo PC will auto-update silently on every startup.
    echo To remove: run remove_startup.bat
) else (
    echo [FAIL] Registration failed.
)
echo.
pause
