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
# Set-PSReadLineOption -PredictionSource None
Set-PSReadLineOption -PredictionViewStyle ListView

# Utilities
function Which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function Clear-Completions-History () {
  Remove-Item $CompletionsHistoryPath
}

function Size-Of ($Path) {
	"$((Get-ChildItem -Recurse $Path | Measure-Object Length -Sum).Sum / 1MB)MB"
}
 
# Use zoxide to navigate between folders using keywords instead of full path
# if zoxide is installed
if (Get-Command "zoxide" -ErrorAction SilentlyContinue)
{
	. $PSScriptRoot\zoxide.ps1
	Set-Alias -Name cd -Value __zoxide_z -Option AllScope -Scope Global -Force
}

# Use scoop-search instead of scoop search
if (Get-Command "scoop" -ErrorAction SilentlyContinue && Get-Command "scoop-search" -ErrorAction SilentlyContinue)
{
  Invoke-Expression (&scoop-search --hook)
}

# Use other color instead of DarkGray (because it’s displayed badly with my current color scheme)
Set-PSReadLineOption -Colors @{
	Command = 'Green'
	String = 'Green'
	Operator = 'Gray'
	Parameter = 'Gray'
	ContinuationPrompt = 'Gray'
	Default = 'Gray'
	Member = 'Gray'
	Number = 'Green'
	Error = 'Red'
	Type = 'Gray'
}

