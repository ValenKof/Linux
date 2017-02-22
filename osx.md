### Installing GNU coreutils
<code> brew install coreutils </code>
#### add to .zshrc before <code>PATH / MANPATH</code>
<code>PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"</code>
<code>MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"</code>
#### add to /etc/man.conf before <code>MANPATH / MANPATH_MAP</code>
<code>MANPATH /usr/local/opt/coreutils/libexec/gnuman</code>
<code>MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman</code>
