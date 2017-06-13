export LESS='-R'
if hash pygmentize; then
	export LESSOPEN='| pygmentize %s'
fi
