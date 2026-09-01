@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
cd /d "%~dp0.."

set count=0
for /d %%d in (*) do (
    if exist "%%d\.git" (
        set /a count+=1
        cd "%%d"
        git pull -q
        cd ..
    )
)
