docker-attach-last(){
  docker attach $(docker ps --format '{{.ID}}' | head -1)
}

fix() {
  vim +"setlocal makeprg=pre-commit\ run\ flake8\ --all-files" +"make"
}

gs(){
  git status -s
  echo ""
  if [ -n "$PLASH_ENV" ]; then
    hostcmd "git diff --stat | cat"
  else
    git diff --stat | cat
  fi
}

alias gc='git commit --verbose'
gsb() {
  env git for-each-ref --format='%(color:blue)%(refname:short) %(color:10)%(committerdate:relative)  -- %(contents:subject)%(color:reset)' --sort -committerdate refs/heads/ | fzf --ansi | awk '{print $1;}' | xargs git checkout
}

gsba() {
  env git for-each-ref --format='%(color:blue)%(refname:short) %(color:10)%(committerdate:relative)  -- %(contents:subject)%(color:reset)' --sort -committerdate refs/remotes/  | fzf --ansi | awk '{print $1;}'  |  awk -F '/' '{print $2;}' | xargs git checkout
}

vimsearch() {
  vim +:"grep $1" +:copen
}

gitexec(){(cd `git rev-parse --show-toplevel` && "$@")}
alias manage.py='gitexec python manage.py'
alias gitroot="git rev-parse --show-toplevel"
cdd(){
     export PWD="cd $(git rev-parse --show-toplevel)/$1"
}

lscommands() {
    (alias | cut -f1 -d= ; hash -f; hash -v | cut -f 1 -d= ; typeset +f) | sort
}

resetperm() { chmod -R u=rwX,g=rX,o= "$@" ;}

pstrings(){
  gitexec ag  "\"[^\"\n]{0,81}\"|'[^'\n]{0,81}'" --color | fzf --ansi --tac
}

plines(){
  out=$(gitexec ag  . | grep --color -E '[^:]*:' | fzf --reverse --extended-exact --no-sort)
  file=$(echo $out | cut -f1 -d':')
  linenr=$(echo $out | cut -f2 -d':')
  tmux send-keys "vim \`gitroot\`/$file +$linenr" Enter
}

_pfiles(){
  gitexec ag  -l 2> /dev/null | fzf --tac
  # ag  "^.{1,}$" | grep --color -E '[^:]*:' | fzf --tac
}

pfiles(){
  vim $(gitroot)/$(_pfiles)
}

_ptags(){
  gitexec cat .git/tags | cut -d$'\t' -f1 | grep -v "^\!" | sort -u | fzf
}

ptags(){
  vim -t $(_ptags)
}

alias fiximports="autoflake --in-place --remove-all-unused-imports "
