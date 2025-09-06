@echo off
cd /d "%~dp0"

REM Rename HTML, CSS, JS files recursively in subfolders
for /r %%f in (*.html.txt) do ren "%%f" "%%~nf.html"
for /r %%f in (*.css.txt) do ren "%%f" "%%~nf.css"
for /r %%f in (*.js.txt) do ren "%%f" "%%~nf.js"

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
