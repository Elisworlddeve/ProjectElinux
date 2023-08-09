@echo off
setlocal EnableDelayedExpansion

:: Initialize game variables
set WIDTH=20
set HEIGHT=10
set "snake=0,5 0,4 0,3"
set "food=5,5"
set "dir=right"
set "gameover="

:gameLoop
cls

:: Draw game board
for /l %%y in (0,1,%HEIGHT%) do (
    for /l %%x in (0,1,%WIDTH%) do (
        set "draw=."
        for %%s in (!snake!) do (
            for %%p in (%%s) do (
                for /f "tokens=1,2 delims=," %%a in ("%%p") do (
                    if %%x==%%a if %%y==%%b set "draw=O"
                )
            )
        )
        if %%x==!food:*,!! if %%y==!food:*,!! set "draw=@"
        setlocal DisableDelayedExpansion
        echo|set /p=!draw!
        endlocal
    )
    echo.
)

:: Handle user input
choice /c:wasdq /n /t 1 /d w /m "W: Up, A: Left, S: Down, D: Right, Q: Quit"

:: Update snake position
setlocal DisableDelayedExpansion
for %%s in (!snake!) do (
    set "newTail="
    set "tailMoved="
    for %%p in (%%s) do (
        for /f "tokens=1,2 delims=," %%a in ("%%p") do (
            set /a "newX=%%a, newY=%%b"
            if %dir%==up set /a "newY-=1"
            if %dir%==down set /a "newY+=1"
            if %dir%==left set /a "newX-=1"
            if %dir%==right set /a "newX+=1"
            set "newPos=!newPos! !newX!,!newY!"
            if defined tailMoved (
                set "newTail=!newTail! %%a,%%b"
            ) else (
                set "tailMoved=1"
            )
        )
    )
    set "snake=!newPos!"
    if defined newTail set "snake=!snake! !newTail!"
)
endlocal

:: Check for collisions
for %%s in (!snake!) do (
    for %%p in (%%s) do (
        for /f "tokens=1,2 delims=," %%a in ("%%p") do (
            if %%a lss 0 (
                set "gameover=1"
            ) else if %%a gtr %WIDTH% (
                set "gameover=1"
            ) else if %%b lss 0 (
                set "gameover=1"
            ) else if %%b gtr %HEIGHT% (
                set "gameover=1"
            )
            for %%f in (!food!) do (
                for %%q in (%%f) do (
                    for /f "tokens=1,2 delims=," %%x in ("%%q") do (
                        if %%a==%%x if %%b==%%y (
                            set "food="
                            set "snake=!snake! %%a,%%b"
                            set /a "newX=!random! %% %WIDTH% + 1"
                            set /a "newY=!random! %% %HEIGHT% + 1"
                            set "food=!newX!,!newY!"
                        )
                    )
                )
            )
        )
    )
)

:: Check game over
if defined gameover goto :gameOver

:: Delay before the next frame
ping -n 2 127.0.0.1 >nul
goto :gameLoop

:gameOver
echo Game Over!
pause
: "Ok this is broken :skull:"