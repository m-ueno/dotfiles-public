#!/bin/sh
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

setxkbmap jp -option ctrl:nocaps
xmodmap $HOME/.Xmodmap
if [ -f "~/Xresources" ]; then
  xrdb -merge ~/.Xresources
fi

# In order for cut/paste and drag/drop to work between VM and host, you need to start the vmware-user wrapper.
#vmware-user-suid-wrapper

# uim-mozc
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
uim-xim &
export XMODIFIERS=@im='uim'

# scim-anthy
#export XMODIFIERS=@im=SCIM
#export GTK_IM_MODULE="scim"
#export QT_IM_MODULE="scim"
#scim -d

# ibus-mozc
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#export XMODIFIERS=@im=ibus
#/usr/bin/ibus-daemon --xim -d &

# run rxvt-unicode daemon
# To make a new instance: rxvtc
urxvtd -q -o -f

#awsetbg -r /home/masaru/wallpapers &
# awsetbg
#while true;
#do
#  awsetbg -r /home/masaru/wallpapers
#  sleep 180m
#done &

#stjerm &
#batterymon&
#tilda&
dropbox.py start
#~/bin/iiimf_status_hide

#DEFAULT_SESSION=awesome
#
#case $1 in
#    kde)
#        exec startkde
#        ;;
#    xfce4)
#        exec startxfce4
#        ;;
#    awesome)
#        exec awesome
#        ;;
#    gnome-session)
#        exec gnome-session
#        ;;
#    *)
#        exec $DEFAULT_SESSION
#        ;;
#esac
#
exec awesome
#exec ck-launch-session startxfce4
#exec ck-launch-session xmonad
#exec ck-launch-session gnome-session
#exec xmonad

