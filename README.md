# dotfiles
My configuration files for different apps

## Installation
1. Clone this repository to a folder you like (here and further in examples it's `~/.config`)
```bash
git clone https://github.com/ivteplo/dotfiles ~/.config
```

2. Install [`starship` prompt](https://starship.rs/)

### Bash

1. Add this line to your `~/.bashrc`:
```bash
. ~/.config/bash/user_profile.sh
```

2. Restart your shell

### PowerShell

1. Install autocompletion module:
```powershell
Install-Module -name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
```

2. Add this line to your PowerShell profile file (you can check the file location by running `echo $PROFILE` in PowerShell):
```powershell
. ~\.config\powershell\user_profile.ps1
```

3. Restart your shell

### Git

`bash/user_profile.sh` and `powershell/user_profile.ps1` automatically add custom git scripts to the path.

If you don't use those shells/files, you just have to add `~/.config/git/scripts` to your path variable.

### Vim

1. Install [`vim-plug`](https://github.com/junegunn/vim-plug#installation)

2. Add this line to your `~/.vimrc` file:
```vim
source ~/.config/vim/config.vim
```

3. Open `vim` and run `:PlugInstall`

4. Wait for the installation to complete

5. Restart the editor

#### Changing color scheme

You can create a file called `theme.vim` in the same folder where the `config.vim` is. Here, you can call a function to change color scheme. For instance:

```vim
call ThemeTokyoNight()
```

The `theme.vim` file is ignored by Git, so that every change of current color scheme won't change the state of the repo.

### Windows Terminal

First, you need to figure out where is your `settings.json` file. Usually, there is a path like this:

```
%LOCALAPPDATA%/Packages/Microsoft.WindowsTerminal_?????????????/LocalState/settings.json
```

You need to replace that `settings.json` file with the `windows-terminal.json` file:

```powershell
# In PowerShell
cp ~/.config/windows-terminal.json $env:LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_?????????????/LocalState/settings.json
```
