if [ -n "$PLASH_ENV" ]; then
  # alias git="hostcmd git"
  alias tmux="TERM=xterm-256color tmux -S /tmp/mytmuxsock"
  # alias plash="hostcmd palsh"
  # alias docker="hostcmd docker"
  PS1="($PLASH_ENV) $PS1" 
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8
fi
