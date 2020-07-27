#!/usr/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -f "~/.vimrc" ]; then
    @echo "Copying old vimrc to ~/.old.vimrc"
    cp ~/.vimrc ~/.old.vimrc
fi

curl -fLo ~/.vimrc \
    https://raw.githubusercontent.com/ivteplo/dotfiles/main/vim/vimrc

