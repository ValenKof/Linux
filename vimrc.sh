#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
read -p "Install .vimrc, vundle, ycm, solarized? (yes/no): " prompt
if [ "$prompt" == "yes" ]; then
  cp "$DIR/vimrc" ~/.vimrc
  cp "$DIR/ycm_extra_conf.py" ~/.ycm_extra_conf.py
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
  cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
  mkdir ~/.vim/colors && cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
fi
