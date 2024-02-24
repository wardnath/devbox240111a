echo "Initializing devbox global .zshrc"
# add devbox bits to zsh
fpath+=($DEVBOX_GLOBAL_PREFIX/share/zsh/site-functions $DEVBOX_GLOBAL_PREFIX/share/zsh/$ZSH_VERSION/functions $DEVBOX_GLOBAL_PREFIX/share/zsh/vendor-completions)
autoload -U compinit && compinit
# initialize apps
# atuin
ATUIN_SYNC_ADDRESS=http://100.69.188.5:8888
if [[ $options[zle] = on ]]; then
  eval "$(atuin init zsh )"
fi
# starship
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"
# direnv
eval "$(direnv hook zsh)"
# thefuck
eval "$(thefuck --alias)"

# completions
eval "$(devbox completion zsh)"

# nnn
alias nnn="nnn -e"
alias duck="fuck"
export NNN_PLUG='f:finder;o:autojump;p:preview-tui'
export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_FCOLORS='00001e310000000000000000'
export NNN_TERMINAL="tmux"
export NNN_BMS="d:~/Downloads;D:~/Documents;t:~/Temporary" # Bookmarks
export NNN_FCOLORS="03040601000205f7d204d9f7" # File colors
