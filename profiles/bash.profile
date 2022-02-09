
include /opt/bwrap_parser/profiles/globals.profile

unshare-all

proc /proc
dev /dev
ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
tmpfs /tmp
tmpfs $HOME


