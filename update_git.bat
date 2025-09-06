@echo off
cd /d "%~dp0"

REM --- Rename files if they have unwanted .txt extension ---
for %%f in (*.html.txt) do ren "%%f" "%%~nf.html"
for %%f in (*.css.txt) do ren "%%f" "%%~nf.css"
for %%f in (*.js.txt) do ren "%%f" "%%~nf.js"

REM Stage all changes
git add .

REM Commit with default message
git commit -m "Auto-commit: update trilogy site"

IF %ERRORLEVEL% NEQ 0 (
    echo Nothing to commit or commit failed.
)

REM Push to GitHub
git push origin main

IF %ERRORLEVEL% NEQ 0 (
    echo Push failed. Check remote repository or internet connection.
    exit /b 1
)
