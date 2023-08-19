@echo off
setlocal

:menu
echo ******************************
echo *    Batch File Launcher    *
echo ******************************

echo.
echo 1. Run a Batch File
echo 2. Run a .sh File
echo 3. Run a .py File
echo 4. Exit

set /p choice="Enter your choice: "

if "%choice%"=="1" (
    set /p batchFile="Enter the path of the batch file: "
    call "%batchFile%"
    goto menu
)

if "%choice%"=="2" (
    set /p shFile="Enter the path of the .sh file: "
    bash "%shFile%"
    goto menu
)

if "%choice%"=="3" (
    set /p pyFile="Enter the path of the .py file: "
    python "%pyFile%"
    goto menu
)

if "%choice%"=="4" (
    exit
)

echo Invalid choice. Please try again.
goto menu