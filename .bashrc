# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -Aghv --time-style=+"|" --color=auto'
alias v='nvim'
alias arch-config='/usr/bin/git --git-dir=$HOME/.arch-config --work-tree=$HOME'
alias mount-macos='sudo mount -t cifs //fosseddy-mac.dlink/fosseddy /mnt/imac/ -o username=fosseddy'
alias umount-macos='sudo umount -l /mnt/imac'
alias wttr='curl https://wttr.in/chelyabinsk?format=4'
alias bat-cap='cat /sys/class/power_supply/BAT0/capacity'
alias bat-stat='cat /sys/class/power_supply/BAT0/status'

PS1="\[\e[33m\][\[\e[m\]\[\e[33m\]\u\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[34m\][\[\e[m\]\[\e[34m\]\w\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\\$\[\e[m\] "

~/bin/pick-random-color-script
