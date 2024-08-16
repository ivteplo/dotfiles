# WARNING: The default Windows behavior considering environment variables
# makes not that much sense for me in my situation, so I this line is going to
# make user's environment variables have higher importance than system's
$systemPath = [System.Environment]::GetEnvironmentVariable("Path", "Machine")
$userPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
$env:PATH = "$userPath;$systemPath"

# Aliases
Set-Alias grep findstr

# Prompt
Invoke-Expression (&starship init powershell)

# Get path to the completions history in order to be able to clear it
Import-Module -Name PSReadline
$CompletionsHistoryPath = (Get-PSReadLineOption).HistorySavePath

# Turn off PSReadline autocompletions
Set-PSReadLineOption -PredictionSource None

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
