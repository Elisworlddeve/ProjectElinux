@echo off
title Menu

:menuLoop
cls
echo Menu:
echo 1. Launch Elinux Command Prompt
echo 2. Start Elinux unified runner
set /p "choice=Enter your choice: "

if "%choice%"=="1" (
    start AIprompt.bat
    exit
) else if "%choice%"=="2" (
    start Erunner.bat
) else (
    echo Invalid choice. Please select 1 or 2.
    pause
)
goto :menuLoop
