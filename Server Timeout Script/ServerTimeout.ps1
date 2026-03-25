# 1. Define the specific workstation path
$configPath = "C:\Program Files (x86)\Radiant Systems\CounterPoint\CPSQL.1 - Station\Bin\Counterpoint.exe.config"
$serviceName = "Radiant CounterPoint Services - CPSQL.1 - Station"

# 2. Check if the file exists before proceeding
if (Test-Path $configPath) {
    try {
        # 3. Load the XML content
        [xml]$config = Get-Content $configPath

        # 4. Target the ServerTimeoutSeconds attribute
        $config.configuration.CpServicesConfig.ServerTimeoutSeconds = "5"

        # 5. Save the modified XML back to the file
        $config.Save($configPath)
        Write-Host "Success: ServerTimeoutSeconds updated to 5 in $configPath" -ForegroundColor Green

        # 6. Restart the Radiant CounterPoint service
        Write-Host "Attempting to restart service: $serviceName..." -ForegroundColor Cyan
        Restart-Service -Name $serviceName -Force -ErrorAction Stop
        Write-Host "Service restarted successfully." -ForegroundColor Green
    }
    catch {
        Write-Error "An error occurred: $_"
    }
}
else {
    Write-Warning "Configuration file not found at: $configPath"
}