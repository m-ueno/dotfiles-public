set -x
set -e

# sudo pacman-key --init
# sudo pacman-key --populate archlinux

alias pacman='sudo pacman'

# remove packages
pacman -R firefox || true

# yaourt

exists=$(grep archlinuxfr /etc/pacman.conf |wc -l)
if [ $exists -eq 0 ] ; then
    cat <<EOH | sudo tee -a /etc/pacman.conf >/dev/null
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/\$arch
EOH

pacman -Sy yaourt
fi

# packages
yes| pacman -S zsh vim tmux screen tree ntp tig
yes| pacman -S w3m curl wget rsync net-tools

