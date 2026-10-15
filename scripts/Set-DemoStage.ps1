[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet('Starter', 'Completed')]
    [string]$Stage,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot -Parent
$endpoint = Join-Path $root 'demo\src\DeviceRegistry.Api\RegistrationEndpoints.cs'
$tests = Join-Path $root 'demo\tests\DeviceRegistry.Api.Tests\RegistrationTests.cs'
$starter = Join-Path $root 'checkpoints\starter\RegistrationEndpoints.cs.txt'
$completed = Join-Path $root 'checkpoints\completed\RegistrationEndpoints.cs.txt'
$completedTests = Join-Path $root 'checkpoints\completed\RegistrationTests.cs.txt'

function Get-NormalizedContent([string]$Path) {
    return (Get-Content -LiteralPath $Path -Raw).Replace("`r`n", "`n").TrimEnd()
}

if (-not $Force) {
    if (Test-Path -LiteralPath $endpoint) {
        $current = Get-NormalizedContent $endpoint
        if ($current -cne (Get-NormalizedContent $starter) -and
            $current -cne (Get-NormalizedContent $completed)) {
            throw 'Endpoint has live edits. Save them elsewhere or explicitly use -Force.'
        }
    }
    if ((Test-Path -LiteralPath $tests) -and
        (Get-NormalizedContent $tests) -cne (Get-NormalizedContent $completedTests)) {
        throw 'Registration tests have live edits. Save them elsewhere or explicitly use -Force.'
    }
}

if ($Stage -eq 'Completed') {
    Copy-Item -LiteralPath $completed -Destination $endpoint
    Copy-Item -LiteralPath $completedTests -Destination $tests
}
else {
    Copy-Item -LiteralPath $starter -Destination $endpoint
    if (Test-Path -LiteralPath $tests) {
        Remove-Item -LiteralPath $tests
    }
}

Write-Host "Stage: $Stage. Only RegistrationEndpoints.cs and RegistrationTests.cs were targeted."
Write-Host 'Run: dotnet test AgentWorkshop.slnx'
