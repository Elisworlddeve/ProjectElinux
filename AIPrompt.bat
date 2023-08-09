@echo off
setlocal

title Elinux - open source os

set "repo_path=C:\Path\To\Your\Repository"
set "current_directory=%repo_path%"

:mainloop
set "prompt=%current_directory%$ "
set /p  "command=Elinux$ "

if "%command%" == "exit" (
    echo Exiting Elinux...
    exit /b
) else if "%command:~0,2%" == "cd" (
    call :change_directory "%command:~3%"
) else if "%command%" == "pwd" (
    call :print_current_directory
) else if "%command%" == "ls" (
    call :list_directory
) else if "%command:~0,6%" == "mkdir " (
    call :create_directory "%command:~6%"
) else if "%command:~0,6%" == "touch " (
    call :create_file "%command:~6%"
) else if "%command%" == "ver" (
    call :show_version
) else if "%command%" == "os" (
    call :show_os
) else (
    echo Command not found.
)

goto :mainloop

:change_directory
set "new_directory=%~1"
if "%new_directory%" == "" (
    set "new_directory=%userprofile%"
)
cd /d "%new_directory%" 2>nul || (
    echo Directory not found.
)
set "current_directory=%cd%"
exit /b

:print_current_directory
echo %current_directory%
exit /b

:list_directory
dir /b
exit /b

:create_directory
set "new_directory=%~1"
mkdir "%new_directory%" 2>nul || (
    echo Directory already exists.
)
exit /b

:create_file
set "file_name=%~1"
echo.>"%file_name%" || (
    echo File already exists.
)
exit /b

:show_version
echo Elinux v1.0 Birth
exit /b

:show_os
echo Elinux - Open source os. Visit the source code: https://github.com/Elisworlddeve/ProjectElinux
exit /b
