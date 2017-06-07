# bind -x '"\C-t":"tmux capture-pane -S -32768 -e && tmux save-buffer - | less -r +G"'
alias p="tmux capture-pane -S -32768 -e && tmux save-buffer - | less -r +Gk"
alias v="tmux capture-pane -S -32768 && tmux save-buffer - | vim - +'set nonumber' +'norm G' -R"
