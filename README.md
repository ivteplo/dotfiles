# dotfiles

## Installing .vimrc

To install .vimrc on Unix / Linux:
```bash
curl https://raw.githubusercontent.com/ivteplo/dotfiles/main/vim/install.sh | sh -c
```

To install .vimrc on Windows:
```powershell
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/ivteplo/dotfiles/main/vim/install.ps1'))
```

Then open vim, run `:PlugInstall` and when the command has finished, restart the vim.

