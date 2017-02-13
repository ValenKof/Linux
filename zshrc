# History
HISTSIZE=10000000
SEVEHIST=10000000
setopt no_share_history

# UNIX commands aliases
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# ps/top aliases
alias topu='top -U $USER'
alias psa='ps aux'
alias psu='ps -u $USER'

# VirtualBox aliases
alias startvm='VBoxManage startvm "ubuntu" --type headless'
alias poweroffvm='VBoxManage controlvm "ubuntu" poweroff --type headless'
alias resumevm='VBoxManage controlvm "ubuntu" resume --type headless'
