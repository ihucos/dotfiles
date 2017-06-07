function collectcopy {
	! [ -p /tmp/copy ] && mkfifo /tmp/copy
	while true; do 
		cat /tmp/copy | reattach-to-user-namespace pbcopy
	done
}
