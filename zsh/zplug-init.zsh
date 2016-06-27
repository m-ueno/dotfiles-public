# zplug options
#   see http://qiita.com/b4b4r07/items/cd326cd31e01955b788b
typeset -x ZPLUG_HOME=$DOTFILES/zsh/zplug
typeset -x ZPLUG_EXTERNAL=$DOTFILES/zsh/zplug-plugins.zsh
typeset -x ZPLUG_USE_CACHE=true

source $ZPLUG_HOME/zplug

# zplug update --self
zplug check || zplug install
zplug load
