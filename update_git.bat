@echo off
cd /d "%~dp0"

REM Delete existing Git history (optional, only for fresh start)
REM rm -rf .git   <-- Not needed normally; only use if resetting

REM Stage all changes
git add .

REM Commit changes
git commit -m "Auto-commit: update trilogy site"

REM Push to GitHub
git push origin main

REM pause
