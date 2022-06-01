include /opt/bwrap_parser/profiles/globals.profile

unshare-all
share-net

proc /proc
dev /dev

ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /etc/resolv.conf /etc/resolv.conf
ro-bind /etc/passwd /etc/passwd
ro-bind /etc/hosts /etc/hosts
ro-bind /etc/fonts/ /etc/fonts/
ro-bind /etc/ld.so.conf /etc/ld.so.conf
ro-bind-try /etc/ld.so.preload /etc/ld.so.preload
ro-bind /etc/ld.so.cache /etc/ld.so.cache
ro-bind /var/cache/ /var/cache/
ro-bind /dev/dri /dev/dri
ro-bind /sys/devices/system /sys/devices/system

tmpfs /tmp

symlink usr/sbin /sbin

bind-try $HOME/Bureau $HOME/Bureau
bind $HOME/.thunderbird $HOME/.thunderbird
bind-try $HOME/.mozilla $HOME/.mozilla
bind-try $HOME/.Xauthority $HOME/.Xauthority
bind-try $HOME/.config $HOME/.config
bind-try $HOME/.local $HOME/.local
bind-try $HOME/.icons $HOME/.icons
symlink $HOME/Bureau $HOME/Desktop
