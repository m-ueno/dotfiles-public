source $DOTFILES/zplug/init.zsh

# zplug update --self
zplug check || zplug install
zplug load
