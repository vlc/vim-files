#!/bin/bash

if [ -d ~/.vim ] || [ -f ~/.vimrc ]; then
  echo "Can't overwrite an existing installation. Please move .vim and .vimrc out of the way manually"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp ${DIR}/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
cp ${DIR}/vim/* ~/.vim/

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

# Compile YouCompleteMe - which should have been installed by the bundleInstall command above
cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer

