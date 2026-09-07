@echo off
setlocal enabledelayedexpansion
title Git Auto Update - THE CARNIVAL RESTAURANT

echo ======================================================
echo       THE CARNIVAL RESTAURANT - GIT AUTO UPDATER
echo ======================================================
echo.

:: Check git installation
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Git is not installed or not in PATH!
    pause
    exit /b 1
)

:: Get current branch
for /f "tokens=*" %%i in ('git branch --show-current 2^>nul') do set CURRENT_BRANCH=%%i
if "%CURRENT_BRANCH%"=="" set CURRENT_BRANCH=main

echo Current Branch: %CURRENT_BRANCH%
echo Remote URL: https://github.com/rajsubhajit554-cloud/SW-THE-CARNIVAL-RESTAURANT.git
echo.

:: Check status
echo [1/4] Checking git status...
git status -s
echo.

:: Prompt for commit message
set /p COMMIT_MSG="Enter commit message (Press Enter for auto timestamp): "
if "%COMMIT_MSG%"=="" (
    set COMMIT_MSG=Update website content - %date% %time%
)

echo.
echo [2/4] Staging files...
git add .

echo.
echo [3/4] Committing changes with message: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%"
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [INFO] No new changes to commit or commit succeeded.
)

echo.
echo [4/4] Pushing to GitHub (%CURRENT_BRANCH%)...
git push origin %CURRENT_BRANCH%

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ======================================================
    echo   SUCCESS: Changes successfully pushed to GitHub!
    echo ======================================================
) else (
    echo.
    echo ======================================================
    echo   [WARNING] Push failed or upstream not set.
    echo   Attempting with -u flag...
    echo ======================================================
    git push -u origin %CURRENT_BRANCH%
    if %ERRORLEVEL% EQU 0 (
        echo SUCCESS: Pushed and upstream set!
    ) else (
        echo [ERROR] Push failed. Please check internet connection or GitHub permissions.
    )
)

echo.
pause
