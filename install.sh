#!/bin/bash

if [ -d ~/.vim ] || [ -f ~/.vimrc ]; then
  echo "Can't overwrite an existing installation. Please move .vim and .vimrc out of the way manually"
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -s ${DIR}/vimrc ~/.vimrc
ln -s ${DIR} ~/.vim
mkdir -p ~/.vim/bundle

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

# Compile YouCompleteMe - which should have been installed by the bundleInstall command above
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

