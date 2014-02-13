#!/bin/bash

if [ -d ~/.vim ] || [ -f ~/.vimrc ]; then
  echo "Can't overwrite an existing installation. Please move .vim and .vimrc out of the way manually"
  exit 1
fi

git clone git@github.com:vlc/vim-files ~/.vim
ln -s .vim/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

# Compile YouCompleteMe - which should have been installed by the bundleInstall command above
if [[ "`uname`" == 'Linux' ]]; then
  sudo apt-get install cmake python-dev
fi
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

