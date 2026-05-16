param(
    [Parameter(Mandatory=$true)]
    [string]$ChangeName
)

$ErrorActionPreference = "Stop"

$specRepo = "D:\Proyects\WEB\Saas\openspec"
$backendRepo = "D:\Proyects\WEB\Saas\backend"
$frontendRepo = "D:\Proyects\WEB\Saas\frontend"

$archiveDir = Get-ChildItem -Path "$specRepo\openspec\changes\archive" -Directory | Where-Object { $_.Name -match $ChangeName } | Select-Object -First 1

if (-not $archiveDir) {
    Write-Host "Error: No se encontró archive para '$ChangeName'" -ForegroundColor Red
    Write-Host "Buscando en: $specRepo\openspec\changes\archive" -ForegroundColor Yellow
    exit 1
}

Write-Host "=== Sincronizando: $($archiveDir.Name) ===" -ForegroundColor Cyan
Write-Host ""

$sourcePath = $archiveDir.FullName

$backendDest = "$backendRepo\openspec\changes\archive\$($archiveDir.Name)"
$frontendDest = "$frontendRepo\openspec\changes\archive\$($archiveDir.Name)"

if (Test-Path $backendDest) {
    Write-Host "[SKIP] Backend: ya existe" -ForegroundColor Yellow
} else {
    Copy-Item -Path $sourcePath -Destination $backendDest -Recurse
    Write-Host "[COPY] Backend: $backendDest" -ForegroundColor Green
}

if (Test-Path $frontendDest) {
    Write-Host "[SKIP] Frontend: ya existe" -ForegroundColor Yellow
} else {
    Copy-Item -Path $sourcePath -Destination $frontendDest -Recurse
    Write-Host "[COPY] Frontend: $frontendDest" -ForegroundColor Green
}

Write-Host ""
Write-Host "=== Siguiente paso ===" -ForegroundColor Cyan
Write-Host "Haz commit en cada repositorio:"
Write-Host ""
Write-Host "# Backend" -ForegroundColor White
Write-Host "cd $backendRepo"
Write-Host 'git add openspec/changes/archive/$($archiveDir.Name)/'
Write-Host 'git commit -m "chore(specs): sync archive $($archiveDir.Name) from commerce-ar-spec"'
Write-Host "git push"
Write-Host ""
Write-Host "# Frontend" -ForegroundColor White
Write-Host "cd $frontendRepo"
Write-Host 'git add openspec/changes/archive/$($archiveDir.Name)/'
Write-Host 'git commit -m "chore(specs): sync archive $($archiveDir.Name) from commerce-ar-spec"'
Write-Host "git push"