
for config in "$HOME"/.bashrc.d/*.bash ; do
  source "$config"
done
unset -v config

#    ____            _                      _
#   / ___| ___      / \__      ____ _ _   _| |
#  | |  _ / _ \    / _ \ \ /\ / / _` | | | | |
#  | |_| | (_) |  / ___ \ V  V / (_| | |_| |_|
#   \____|\___/  /_/   \_\_/\_/ \__,_|\__, (_)
#                                      |___/
#
# use ~/.bashrc.d/myscript.bash instead

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/ihucos/.lmstudio/bin"
# End of LM Studio CLI section

