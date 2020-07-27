New-Item -ItemType Directory -Force -Path ~\vimfiles\autoload >$null 2>&1

echo "Installing Vim Plug"

$vimplugUri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

(New-Object Net.WebClient).DownloadFile(
  $vimplugUri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)

echo "Vim Plug installed successfully"

if (Test-Path "~\_vimrc") {
    echo "Copying old vimrc to ~\_old.vimrc"
    Move-Item -Force -Path ~\_vimrc -Destination ~\_old.vimrc
    echo "~\_old.vimrc generated successfully"
}

echo "Downloading vimrc"

$vimrcUri = 'https://raw.githubusercontent.com/ivteplo/dotfiles/main/vim/vimrc'

(New-Object Net.WebClient).DownloadFile(
  $vimrcUri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\_vimrc"
  )
)

echo "vimrc installed successfully"

