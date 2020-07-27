#!/usr/bin/bash

@echo "Installing Vim Plug"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

@echo "Vim Plug installed successfully"

if [ -f "~/.vimrc" ]; then
    @echo "Copying old vimrc to ~/.old.vimrc"
    cp ~/.vimrc ~/.old.vimrc
    @echo "~/.old.vimrc generated successfully"
fi

@echo "Installing vimrc"

curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/ivteplo/dotfiles/main/vim/vimrc

@echo "vimrc installed successfully"

