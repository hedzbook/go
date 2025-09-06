# autopush.ps1
$path = "C:\HEDZ BOOK\GitHub\hedzbook\go"
Write-Host "Watching $path for changes... (Press Ctrl+C to stop)" -ForegroundColor Green

# Store last push time so it doesn't spam on multiple quick changes
$lastPush = Get-Date

while ($true) {
    $change = Get-ChildItem -Path $path -Recurse | 
        Where-Object { $_.LastWriteTime -gt $lastPush }

    if ($change) {
        Write-Host "Detected change in $($change.Name). Pushing to GitHub..." -ForegroundColor Yellow
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$path\update_git.bat`"" -Wait
        $lastPush = Get-Date
        Write-Host "Push complete at $lastPush" -ForegroundColor Cyan
    }

    Start-Sleep -Seconds 2
}
