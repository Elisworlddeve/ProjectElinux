@echo off
setlocal

title Elinux - Linux in windows command line 

set "repo_path=C:\"
set "current_directory=%repo_path%"




:mainloop
set "prompt=%current_directory%$ "
set /p  "command=Elinux$$ "

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
) else if "%command%" == "osinfo" (
    call :show_os
) else if "%command%" == "erunner" (
    
    start erunner.bat
) else if "%command%" == "drinfo" (
    call :drive_info
) else if "%command%" == "drerase" (
    call :format_drive
) else if "%command:~0,5%" == "read " (
    call :read_file "%command:~5%"
) else if "%command:~0,7%" == "delete " (
    call :delete_file "%command:~7%"
) else if "%command:~0,7%" == "deldir " (
    call :delete_directory "%command:~7%"
) else if "%command%" == "root" (
    set "current_directory=%repo_path%"
) else if "%command%" == "etree" (
    call :tree "%current_directory%"
) else if "%command%" == "back" (
    call :go_back
) else if "%command%" == "ipinfo" (
    ipconfig
) else (
    echo Command not found: %command%
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
echo 1.00.00
exit /b

:show_os
echo Elinux - Open source os. Visit the source code: https://github.com/Elisworlddeve/ProjectElinux
exit /b

:drive_info
echo Drive information for %current_directory%
vol %current_directory:~0,2%
fsutil volume diskfree %current_directory:~0,2%
exit /b

:format_drive
set /p "confirm=Formatting a drive will delete all data. Are you sure you want to continue? (yes/no): "
if /i "%confirm%" == "yes" (
    echo Formatting drive %current_directory:~0,2%...
    format %current_directory:~0,2% /q /y
) else (
    echo Format cancelled.
)
:read_file
set "file_to_read=%~1"
if exist "%file_to_read%" (
    type "%file_to_read%"
) else (
    echo File not found.
)
exit /b

:delete_file
set "file_to_delete=%~1"
if exist "%file_to_delete%" (
    del "%file_to_delete%"
) else (
    echo File not found.
)
exit /b

:delete_directory
set "dir_to_delete=%~1"
if exist "%dir_to_delete%" (
    rmdir /s /q "%dir_to_delete%"
) else (
    echo Directory not found.
)
exit /b

:tree
setlocal
set "root_dir=%~1"
dir /s /b /o:gn "%root_dir%"
endlocal
exit /b

:go_back
for %%I in ("%current_directory%") do set "parent_dir=%%~dpI"
if not "%parent_dir%" == "%current_directory%" (
    set "current_directory=%parent_dir%"
) else (
    echo Already at the root directory...
)
exit /b


