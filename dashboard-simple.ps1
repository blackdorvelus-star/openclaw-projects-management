# dashboard-simple.ps1 - Version simplifiée
param([switch]$AutoStart)

function Show-Banner {
    Clear-Host
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "   DASHBOARD PROJETS PARALLELES" -ForegroundColor Yellow
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "   Workspace: D:\OpenClaw-Projects\mes-projets\" -ForegroundColor Gray
    Write-Host "   Time: $(Get-Date -Format 'HH:mm dd/MM/yyyy')" -ForegroundColor Gray
    Write-Host "==========================================" -ForegroundColor Cyan
}

function Get-ProjectInfo($projectName, $folderName, $defaultPort) {
    $project = @{
        Name = $projectName
        Folder = $folderName
        Path = "D:\OpenClaw-Projects\mes-projets\$folderName"
        Port = $defaultPort
        Status = "UNKNOWN"
        ProcessId = $null
        URL = "http://localhost:$defaultPort"
        SizeMB = 0
        LastModified = $null
    }
    
    # Check if exists
    if (Test-Path $project.Path) {
        $project.Status = "PRESENT"
        
        # Size
        $files = Get-ChildItem $project.Path -Recurse -File -ErrorAction SilentlyContinue
        if ($files) {
            $project.SizeMB = [math]::Round(($files | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
        }
        
        # Last modified
        $project.LastModified = (Get-Item $project.Path).LastWriteTime
        
        # Check if running
        $processes = Get-Process node -ErrorAction SilentlyContinue | 
                    Where-Object { $_.Path -like "*$folderName*" }
        if ($processes) {
            $project.Status = "RUNNING"
            $project.ProcessId = $processes[0].Id
        } else {
            $project.Status = "STOPPED"
        }
    } else {
        $project.Status = "MISSING"
    }
    
    return $project
}

function Show-ProjectCard($project) {
    $color = switch ($project.Status) {
        "RUNNING" { "Green" }
        "PRESENT" { "Yellow" }
        "STOPPED" { "Red" }
        "MISSING" { "DarkRed" }
        default { "Gray" }
    }
    
    $icon = switch ($project.Status) {
        "RUNNING" { "[RUNNING]" }
        "PRESENT" { "[PRESENT]" }
        "STOPPED" { "[STOPPED]" }
        "MISSING" { "[MISSING]" }
        default { "[UNKNOWN]" }
    }
    
    Write-Host "`nPROJECT: $($project.Name)" -ForegroundColor $color
    Write-Host "   Status: $icon"
    
    if ($project.Status -ne "MISSING") {
        Write-Host "   Folder: $($project.Folder)"
        Write-Host "   Size: $($project.SizeMB) MB"
        Write-Host "   Modified: $($project.LastModified)"
        
        if ($project.Status -eq "RUNNING") {
            Write-Host "   URL: $($project.URL)" -ForegroundColor Green
            Write-Host "   PID: $($project.ProcessId)"
        }
    }
}

function Start-Project($projectName, $folderName, $port) {
    $path = "D:\OpenClaw-Projects\mes-projets\$folderName"
    
    if (-not (Test-Path $path)) {
        Write-Host "ERROR: Project $projectName not found: $path" -ForegroundColor Red
        return $false
    }
    
    # Check if already running
    $existing = Get-Process node -ErrorAction SilentlyContinue | 
                Where-Object { $_.Path -like "*$folderName*" }
    if ($existing) {
        Write-Host "INFO: $projectName already running (PID: $($existing[0].Id))" -ForegroundColor Yellow
        return $true
    }
    
    Write-Host "STARTING $projectName..." -ForegroundColor Cyan
    
    # Start in new process
    $scriptBlock = {
        param($p, $pt)
        cd $p
        $env:PORT = $pt
        Write-Host "Starting on port $pt..."
        
        # Detect package manager
        if (Test-Path "bun.lock" -or Test-Path "bun.lockb") {
            bun run dev
        } elseif (Test-Path "package.json") {
            npm run dev
        } else {
            Write-Host "No package.json found"
        }
    }
    
    Start-Process powershell -ArgumentList "-NoExit", "-Command", 
        "& {$scriptBlock} -p '$path' -pt $port" -WindowStyle Minimized
    
    Write-Host "SUCCESS: $projectName started on port $port" -ForegroundColor Green
    return $true
}

function Stop-Project($projectName, $folderName) {
    $processes = Get-Process node -ErrorAction SilentlyContinue | 
                Where-Object { $_.Path -like "*$folderName*" }
    
    if ($processes) {
        $processes | ForEach-Object {
            Write-Host "STOPPING $projectName (PID: $($_.Id))..." -ForegroundColor Yellow
            Stop-Process -Id $_.Id -Force
        }
        Write-Host "SUCCESS: $projectName stopped" -ForegroundColor Green
        return $true
    } else {
        Write-Host "INFO: $projectName not running" -ForegroundColor Gray
        return $false
    }
}

# ==================== MAIN ====================
Show-Banner

# Define projects
$projects = @(
    @{Name="Jurisscan"; Folder="jurisscan-7393c5ef-main"; Port=3000},
    @{Name="Lyss"; Folder="lyss"; Port=3001}
)

# Get project info
$projectInfos = @()
foreach ($p in $projects) {
    $projectInfos += Get-ProjectInfo $p.Name $p.Folder $p.Port
}

# Show dashboard
foreach ($proj in $projectInfos) {
    Show-ProjectCard $proj
}

# Show commands
Write-Host "`n==========================================" -ForegroundColor Cyan
Write-Host "COMMANDS:" -ForegroundColor Yellow
Write-Host "  1 - Start Jurisscan"
Write-Host "  2 - Start Lyss"
Write-Host "  3 - Start ALL projects"
Write-Host "  4 - Stop Jurisscan"
Write-Host "  5 - Stop Lyss"
Write-Host "  6 - Stop ALL"
Write-Host "  R - Refresh dashboard"
Write-Host "  Q - Quit"
Write-Host "==========================================" -ForegroundColor Cyan

# Auto-start if requested
if ($AutoStart) {
    Write-Host "`nAUTO-START enabled..." -ForegroundColor Magenta
    foreach ($p in $projects) {
        Start-Project $p.Name $p.Folder $p.Port
        Start-Sleep -Seconds 2
    }
    Write-Host "`nSUCCESS: All projects started!" -ForegroundColor Green
    Write-Host "   Dashboard will refresh in 5 seconds..."
    Start-Sleep -Seconds 5
    powershell -File $MyInvocation.MyCommand.Path
    exit
}

# Command loop
do {
    $choice = Read-Host "`nYour choice"
    
    switch ($choice) {
        "1" { Start-Project "Jurisscan" "jurisscan-7393c5ef-main" 3000 }
        "2" { Start-Project "Lyss" "lyss" 3001 }
        "3" { 
            Start-Project "Jurisscan" "jurisscan-7393c5ef-main" 3000
            Start-Sleep -Seconds 2
            Start-Project "Lyss" "lyss" 3001
        }
        "4" { Stop-Project "Jurisscan" "jurisscan-7393c5ef-main" }
        "5" { Stop-Project "Lyss" "lyss" }
        "6" { 
            Stop-Project "Jurisscan" "jurisscan-7393c5ef-main"
            Stop-Project "Lyss" "lyss"
        }
        "R" { 
            Write-Host "REFRESHING..." -ForegroundColor Cyan
            powershell -File $MyInvocation.MyCommand.Path
            exit
        }
        "Q" { 
            Write-Host "GOODBYE!" -ForegroundColor Cyan
            exit
        }
        default { Write-Host "INVALID CHOICE" -ForegroundColor Red }
    }
    
    # Pause to see result
    if ($choice -notin @("R", "Q")) {
        Write-Host "`nPress Enter to continue..."
        Read-Host
        powershell -File $MyInvocation.MyCommand.Path
        exit
    }
    
} while ($choice -ne "Q")