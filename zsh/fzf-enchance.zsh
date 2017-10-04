# ghq + peco/percol – Tatsuhiko Miyagawa’s Blog
# https://weblog.bulknews.net/ghq-peco-percol-b6be7828dc1b
function list-src () {
    local selected_dir=$(ghq list --full-path | fzf --no-multi --tac --cycle --preview 'ls -lF {+1}')
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
# register shell fn as widget
zle -N list-src
# bindkey to widget
bindkey '^x^s' list-src
