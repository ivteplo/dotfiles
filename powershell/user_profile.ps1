# Aliases
Set-Alias grep findstr

# Prompt
Invoke-Expression (&starship init powershell)

# Get path to the completions history in order to be able to clear it
Import-Module -Name PSReadline
$CompletionsHistoryPath = (Get-PSReadLineOption).HistorySavePath

# Turn off PSReadline
Remove-Module -Name PSReadline

# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Clear-Completions-History () {
    Remove-Item $CompletionsHistoryPath
}
 
# Add custom git commands to the path
$GitScriptsFolder = Resolve-Path "~\.config\git\scripts"
$env:PATH="${env:PATH};$GitScriptsFolder"

