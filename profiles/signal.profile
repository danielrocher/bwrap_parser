include /opt/bwrap_parser/profiles/globals.profile

unshare-all
share-net

proc /proc
dev /dev

ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /opt/Signal /opt/Signal
ro-bind /etc/resolv.conf /etc/resolv.conf
ro-bind /etc/passwd /etc/passwd
ro-bind /etc/hosts /etc/hosts
ro-bind /etc/fonts/ /etc/fonts/
ro-bind /etc/ld.so.conf /etc/ld.so.conf
ro-bind /etc/ld.so.preload /etc/ld.so.preload
ro-bind /etc/ld.so.cache /etc/ld.so.cache
ro-bind /var/cache/ /var/cache/
ro-bind /dev/dri /dev/dri
ro-bind /sys/devices/system /sys/devices/system

tmpfs /tmp
symlink usr/sbin /sbin

bind $HOME/Bureau $HOME/Bureau
bind $HOME/.Xauthority $HOME/.Xauthority
bind $HOME/.config $HOME/.config
bind $HOME/.local $HOME/.local
bind $HOME/.icons $HOME/.icons

symlink $HOME/Bureau $HOME/Desktop
