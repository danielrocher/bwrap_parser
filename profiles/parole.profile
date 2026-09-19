include /opt/bwrap_parser/profiles/globals.profile

unshare-all
die-with-parent
new-session

dev /dev
dev-bind-try /dev/dri /dev/dri

ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
ro-bind /etc /etc

tmpfs /run/user/$UID

bind-try $XDG_RUNTIME_DIR/pulse/native $XDG_RUNTIME_DIR/pulse/native
bind-try $XDG_RUNTIME_DIR/pipewire-0 $XDG_RUNTIME_DIR/pipewire-0
bind-try $XDG_RUNTIME_DIR/bus $XDG_RUNTIME_DIR/bus
bind-try $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY

bind-try /media/ /media/
bind-try $HOME/Bureau $HOME/Bureau
bind-try $HOME/.Xauthority $HOME/.Xauthority

tmpfs /tmp
bind-try /tmp/.X11-unix /tmp/.X11-unix

symlink $HOME/Bureau $HOME/Desktop
