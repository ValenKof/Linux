#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
read -p "Install oh-my-zsh? (yes/no): " prompt
if [ "$prompt" == "yes" ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  for THEME in valenkof-user valenkof-root; do
    cp "${DIR}/${THEME}.zsh-theme" ~/.oh-my-zsh/themes/
  done
fi
