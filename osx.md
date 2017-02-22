# Tutorial for making macOS more linux like 
## Installing GNU coreutils (cp, rm, ls, cat, kill, etc.)
#### install coreutils using homebrew
<code>brew install coreutils </code><br>
#### add to .zshrc before other PATH and MANPATH edits:
<code>PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"</code><br>
<code>MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"</code><br>
<code>alias ls='ls --color=auto'</code><br>
#### add to /etc/man.conf before other MANPATH and MANPATH_MAP directives:
<code>MANPATH /usr/local/opt/coreutils/libexec/gnuman</code><br>
<code>MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman</code><br>
