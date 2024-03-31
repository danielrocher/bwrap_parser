include /opt/bwrap_parser/profiles/globals.profile

unshare-all

dev /dev

ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /etc /etc
ro-bind /run/user/ /run/user/

bind-try /dev/dri /dev/dri
bind-try $HOME/Bureau $HOME/Bureau
bind-try $HOME/.Xauthority $HOME/.Xauthority

bind /tmp /tmp

symlink $HOME/Bureau $HOME/Desktop
