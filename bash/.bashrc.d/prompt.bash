PS1='$(_prompt_exit_status) \w '"\[\033[38;5;15m\]$\[\033[0m\] \$(_prompt_git)"

_prompt_exit_status(){

	EXIT=$?
	if [ $EXIT != 0 ]; then
		# tput setaf 1
		printf "$EXIT"
		# tput sgr0
	fi
}

_prompt_git(){
	# name=$(git symbolic-ref --quiet HEAD || true)
	# echo $name
	:

}

# prompt(){
# 	[[ $(git rev-parse --is-inside-work-tree) == true ]] ||
# 		return
# 	name=$(
# 		git symbolic-ref --quiet HEAD ||
# 		git describe --tags --exact-match HEAD ||
# 		git rev-parse --short HEAD
# 	) || return
# 	name=${name#refs/*/}
# 	[[ -n $name ]] || return
# 	printf "\033[1K\r"
# 	dir=$(git rev-parse --show-prefix)
# 	printf "$name $dir $ "
# }

# PROMPT_COMMAND="prompt; $PROMPT_COMMAND"
# PROMPT_COMMAND=prompt

