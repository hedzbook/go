@echo off
cd /d "%~dp0"

REM Stage all changes
git add .

REM Commit with default message
git commit -m "Auto-commit: update trilogy site"

REM Check if commit succeeded
IF %ERRORLEVEL% NEQ 0 (
    echo Nothing to commit or commit failed.
    REM continue anyway
)

REM Push to GitHub
git push origin main

IF %ERRORLEVEL% NEQ 0 (
    echo Push failed. Check remote repository or internet connection.
    exit /b 1
)
