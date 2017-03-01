zplug "b4b4r07/emoji-cli", if:'[[ whence jq >/dev/null ]]'

zplug "zsh-users/zsh-autosuggestions", if:'[[ ! $OS == "Windows_NT" ]]'
zplug "zsh-users/zsh-syntax-highlighting, nice:10", if:'[[ ! $OS == "Windows_NT" ]]'
zplug "zsh-users/zaw, nice:10", if:'[[ ! $OS == "Windows_NT" ]]'

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"

# zplug "plugins/git, from:oh-my-zsh"
zplug "tcnksm/docker-alias, of:zshrc, as:plugin"
zplug "mrowa44/emojify, as:command, of:emojify"
zplug "willghatch/zsh-cdr"
zplug "Tarrasch/zsh-functional"
