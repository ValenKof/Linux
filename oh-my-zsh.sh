#!/bin/bash
read -p "Install oh-my-zsh? (yes/no): " prompt
if [ "$prompt" == "yes" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  for THEME in valenkof-user valenkof-root; do
    cp $(dirname $0)/$THEME.zsh-theme ~/.oh-my-zsh/themes/
  done
fi
