source $DOTFILES/zplug/init.zsh

# common settings
zplug "zsh-users/zsh-autosuggestions", if:'[[ ! $OS == "Windows_NT" ]]'
zplug "zsh-users/zsh-syntax-highlighting, defer:2", if:'[[ ! $OS == "Windows_NT" ]]'
zplug "zsh-users/zaw, defer:2", if:'[[ ! $OS == "Windows_NT" ]]'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "$DOTFILES/zsh", use:"http_status_codes.zsh", from:local

# settings for specific environment
zplug "$DOTFILES/zsh", use:"pacman.zsh", from:local, if:"[[ $(grep ID=arch /etc/os-release) ]]"

# zplug update --self
zplug check || zplug install
zplug load
