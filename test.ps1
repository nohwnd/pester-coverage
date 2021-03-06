param (
    [String] $Path = ".",
    [String] $Output = "Detailed",
    [Switch] $CodeCoverage
)

# C:/p/pester/build.ps1
# get-module pester | Remove-Module
# import-module C:/p/pester/bin/pester.psd1 


$pester = Get-Module -Name Pester -ListAvailable | Where-Object Version -ge 5.2.0

if (-not $pester) {
    Set-PSRepository psgallery -InstallationPolicy trusted
    Install-Module Pester -Scope CurrentUser -MinimumVersion 5.2.0-alpha3 -MaximumVersion 5.99.99 -AllowPrerelease -Force
}

Import-Module Pester

$Configuration = [PesterConfiguration]::Default

$Configuration.Run.Path = $Path

$Configuration.Output.Verbosity = $Output
 
$Configuration.CodeCoverage.Enabled = [bool] $CodeCoverage
# CoverageGutters is new option in Pester 5.2 pre-release
$Configuration.CodeCoverage.OutputFormat = "CoverageGutters"
$Configuration.CodeCoverage.Path = "$PSScriptRoot/src"
$Configuration.CodeCoverage.OutputPath = "$PSScriptRoot/coverage.xml"
$Configuration.CodeCoverage.CoveragePercentTarget = 90

$Configuration.Debug.WriteDebugMessages = $true
$Configuration.Debug.WriteDebugMessagesFrom = "CodeCoverage"


Invoke-Pester -Configuration $Configuration
