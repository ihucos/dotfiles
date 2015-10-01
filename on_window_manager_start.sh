xmodmap ~/.Xmodmap
xrdb ~/.Xresources
# lsyncd ~/.lsyncd.conf.lua --nodaemon

xkbcomp ~/Dotfiles/xkbmap $DISPLAY
xcape -e 'Hyper_L=comma' -d 
