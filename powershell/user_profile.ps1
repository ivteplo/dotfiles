# Aliases
Set-Alias grep findstr

# Prompt
Invoke-Expression (&starship init powershell)

# Autocompletion
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
 
# Add custom git commands to the path
$scriptsFolder = Resolve-Path "~\.config\git\scripts"
$env:PATH="${env:PATH};$scriptsFolder"

