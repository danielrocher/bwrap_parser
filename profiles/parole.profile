include /opt/bwrap_parser/profiles/globals.profile

unshare-all

dev /dev

ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /etc /etc
tmpfs /run/user/$UID
bind /run/user/$UID /run/user/$UID

bind-try /dev/dri /dev/dri
bind-try /media/ /media/
bind-try $HOME/Bureau $HOME/Bureau
bind-try $HOME/.Xauthority $HOME/.Xauthority

bind /tmp /tmp

symlink $HOME/Bureau $HOME/Desktop
