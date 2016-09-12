#!/bin/sh
read -p "Install oh-my-zsh? (yes/no): " prompt
if [ "$prompt" == "yes" ]; then
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -
fi
