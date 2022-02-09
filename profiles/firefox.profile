include /opt/bwrap_parser/profiles/globals.profile

unshare-all
share-net

dev /dev
bind /dev/dri /dev/dri
proc /proc
ro-bind /sys /sys
bind /run /run
ro-bind /usr /usr
ro-bind /var /var
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /etc /etc
bind /tmp /tmp
bind $HOME/Bureau $HOME/Bureau
bind $HOME/.mozilla $HOME/.mozilla
bind $HOME/.Xauthority $HOME/.Xauthority
bind $HOME/.config $HOME/.config
bind $HOME/.local $HOME/.local
bind $HOME/.icons $HOME/.icons

symlink usr/sbin /sbin
symlink $HOME/Bureau $HOME/Desktop
