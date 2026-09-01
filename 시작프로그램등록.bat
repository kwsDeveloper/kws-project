@echo off
chcp 65001 > nul

set STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
set TARGET=%~dp0자동업데이트.vbs
set SHORTCUT=%STARTUP%\KWS_자동업데이트.lnk

powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT%'); $s.TargetPath = '%TARGET%'; $s.WorkingDirectory = '%~dp0'; $s.Save()"

echo.
echo ============================
echo   시작프로그램 등록 완료!
echo ============================
echo.
echo PC를 켤 때마다 백그라운드에서 자동으로 업데이트됩니다.
echo (창이 뜨지 않습니다)
echo.
echo 해제하려면 아래 폴더에서 KWS_자동업데이트.lnk 파일을 삭제하세요:
echo %STARTUP%
echo.
pause
