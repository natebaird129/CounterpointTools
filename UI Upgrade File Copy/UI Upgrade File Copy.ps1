# Define paths
$sourceDir = "C:\staging"
$destinationDir = "C:\Program Files (x86)\Radiant Systems\CounterPoint\CPSQL.1\Bin"
$filesToCopy = @("UIUpgradeConsoleProj.exe", "UIUpgradeProj.exe")

# Ensure the destination directory exists (New-Item -Force won't error if it exists)
if (-not (Test-Path -Path $destinationDir)) {
    New-Item -ItemType Directory -Path $destinationDir -Force | Out-Null
    Write-Host "Created directory: $destinationDir" -ForegroundColor Cyan
}

# Copy the files
foreach ($file in $filesToCopy) {
    $sourcePath = Join-Path $sourceDir $file
    $destPath = Join-Path $destinationDir $file

    if (Test-Path $sourcePath) {
        # -Force ensures it overwrites existing files in the destination
        Copy-Item -Path $sourcePath -Destination $destPath -Force
        Write-Host "Successfully copied $file to $destinationDir" -ForegroundColor Green
    } else {
        Write-Warning "Source file not found: $sourcePath"
    }
}