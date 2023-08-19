@echo off
setlocal

:main
cls
echo Welcome to "The Quest for Batch Mastery"!
echo ----------------------------------------
echo.
echo [1] Start your journey
echo [2] Quit

set /p choice="Enter your choice: "

if "%choice%"=="1" (
    call :start_journey
) else if "%choice%"=="2" (
    echo Farewell, adventurer!
    exit /b
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto :main
)

:start_journey
cls
echo As you venture into the world of Batchland, you come across a fork in the road.
echo You must choose your path wisely.
echo.
echo [1] Path of Variables
echo [2] Path of Loops
echo [3] Path of Functions

set /p path_choice="Enter your chosen path: "

if "%path_choice%"=="1" (
    call :path_variables
) else if "%path_choice%"=="2" (
    call :path_loops
) else if "%path_choice%"=="3" (
    call :path_functions
) else (
    echo Invalid choice. Please try again.
    timeout /t 2 >nul
    goto :start_journey
)

:path_variables
cls
echo You have chosen the Path of Variables.
echo Your first challenge is to declare and manipulate variables to solve a puzzle.
echo.
echo Solve the following equation to proceed:
echo.
echo 2 * (5 + 3) - 4 = ?
echo.

set /p answer="Enter your answer: "

if "%answer%"=="12" (
    echo Congratulations! You have solved the puzzle and mastered the art of variables.
    echo Onward to the next challenge!
    timeout /t 5 >nul
    goto :start_journey
) else (
    echo Incorrect answer. Try again!
    timeout /t 2 >nul
    goto :path_variables
)

:path_loops
cls
echo You have chosen the Path of Loops.
echo Your next challenge is to create a loop to count from 1 to 10.
echo.
echo Write the batch code to complete the task and proceed.
echo.

set /p code="Enter your batch code: "

if "%code%"=="@echo off & for /l %%i in (1, 1, 10) do (echo %%i) & pause" (
    echo Well done! You have demonstrated mastery over loops.
    echo Onward to the next challenge!
    timeout /t 5 >nul
    goto :start_journey
) else (
    echo Incorrect code. Try again!
    timeout /t 2 >nul
    goto :path_loops
)

:path_functions
cls
echo You have chosen the Path of Functions.
echo Your final challenge is to create a function that calculates the factorial of a number.
echo.
echo Write the batch code for the factorial function and proceed.
echo.

set /p code="Enter your batch code: "

if "%code%"=="@echo off & setlocal enabledelayedexpansion & set /a n=5 & set result=1 & for /l %%i in (1, 1, !n!) do (set /a result=!result!*%%i) & echo The factorial of !n! is !result! & pause" (
    echo Magnificent! You have harnessed the power of functions.
    echo You have successfully completed "The Quest for Batch Mastery"!
    echo Congratulations, oh mighty batch master!
    echo Thank you for playing.
    timeout /t 5 >nul
    goto :main
) else (
    echo Incorrect code. Try again!
    timeout /t 2 >nul
    goto :path_functions
)

exit /b