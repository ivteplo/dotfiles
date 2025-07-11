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

There are a few Git aliases provided for you:
- `uncommit` — undo the last commit.
- `recommit` — redo the last commit.
- `edit-commit` — edit the last commit message.
- `history` — show a commit history (`git log --all --graph`).

You can find aliases in [`git/config`](./git/config). They are in the 
`[alias]` section.

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

### Neovim

1. Do all the steps inside the [Vim](#vim) section

2. Install [packer.nvim](https://github.com/wbthomason/packer.nvim)

3. Install TypeScript Language Server and TypeScript for LSP:

```bash
npm install -g typescript typescript-language-server
```

4. Start Neovim

5. Install packages from Packer:

```vim
:PackerInstall
```

6. After the installation is complete, restart Neovim

### Windows Terminal

First, you need to figure out where your `settings.json` file is. Usually, there is a path like this:

```
%LOCALAPPDATA%/Packages/Microsoft.WindowsTerminal_?????????????/LocalState/settings.json
```

You need to replace that `settings.json` file with the `windows-terminal.json` file:

```powershell
# In PowerShell
cp ~/.config/windows-terminal.json $env:LOCALAPPDATA/Packages/Microsoft.WindowsTerminal_?????????????/LocalState/settings.json
```
