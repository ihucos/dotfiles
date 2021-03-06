if [ -n "$TMUX" ] && hash tmux 2> /dev/null; then
  tmux set status-right-length 120
  PROMPT_COMMAND='((tmux set -g status-right "#(cd #{pane_current_path} && git rev-parse --abbrev-ref HEAD) | #(cd #{pane_current_path} && git status --porcelain 2> /dev/null | grep -c ^) | $? ") & ); '"$PROMPT_COMMAND"
fi
