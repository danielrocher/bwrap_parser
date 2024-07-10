include /opt/bwrap_parser/profiles/globals.profile

unshare-all
share-net

dev /dev
bind-try /dev/dri /dev/dri
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
bind-try $HOME/Bureau $HOME/Bureau
bind-try $HOME/.Xauthority $HOME/.Xauthority
bind-try $HOME/.config $HOME/.config
bind-try $HOME/.local $HOME/.local
bind-try $HOME/.icons $HOME/.icons

symlink usr/sbin /sbin
symlink $HOME/Bureau $HOME/Desktop
