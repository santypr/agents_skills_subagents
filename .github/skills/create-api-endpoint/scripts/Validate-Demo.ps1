[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$root = Resolve-Path (Join-Path $PSScriptRoot '..\..\..\..')
Push-Location $root
try {
    & dotnet test AgentWorkshop.slnx --no-restore --verbosity minimal
    if ($LASTEXITCODE -ne 0) {
        throw "Demo validation failed with exit code $LASTEXITCODE."
    }
}
finally {
    Pop-Location
}
