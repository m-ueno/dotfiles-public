
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
PS1='[\u@\h \W]\$ '
alias vi=vim
alias yy='yaourt -Sy'

alias ta='tmux attach' # pkill stjerm$B8e(B

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
