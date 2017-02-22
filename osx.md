

## install gnu coreutils
### brew install coreutils
### add to .zshrc before PATH/MANPATH:
####   PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
####   MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
### add to /etc/man.conf before MANPATH/MANPATH_MAP:
####   MANPATH /usr/local/opt/coreutils/libexec/gnuman
####   MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman
