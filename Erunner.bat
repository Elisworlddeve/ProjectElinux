@echo off
setlocal

:menu
cls
echo 1. Run .bat file
echo 2. Run .py file
echo 3. Exit
set /p choice=Enter your choice: 

if "%choice%"=="1" (
    set /p batfile=Enter the name of the .bat file (including extension): 
    call "%batfile%"
    pause
    goto menu
) else if "%choice%"=="2" (
    set /p pyfile=Enter the name of the .py file (including extension): 
    python "%pyfile%"
    pause
    goto menu
) else if "%choice%"=="3" (
    exit
) else (
    echo Invalid choice. Please select a valid option.
    pause
    goto menu
)
