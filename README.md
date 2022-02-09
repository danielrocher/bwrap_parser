# bwrap_parser

*bwrap_parser* allows to launch [bwrap](https://github.com/containers/bubblewrap), from profiles. Each profile defines a set of permissions for a specific application.

## Example

If command used for your sandbox is:
```bash
/usr/bin/bwrap --unshare-all --proc /proc --dev /dev --ro-bind /usr /usr --ro-bind /bin /bin --ro-bind /lib /lib --ro-bind /lib64 /lib64 --tmpfs /tmp --tmpfs $HOME --cap-drop all /bin/bash
```

you can create a file with this content (ex: *bash.profile*):
```
unshare-all
proc /proc
dev /dev
ro-bind /usr /usr
ro-bind /bin /bin
ro-bind /lib /lib
ro-bind /lib64 /lib64
tmpfs /tmp
tmpfs $HOME
cap-drop all
```

and use it with *bwrap_parser* :
```bash
bwrap_parser -p bash.profile /bin/bash
```

## Profile file syntax

```
# this is a comment

    Example:
        # disable networking
        net none # this command creates an empty network namespace


include other.profile
    Include other.profile file.

    Example:
        include /opt/bwrap_parser/profiles/globals.profile
```

*bwrap_parser* includes all *bwrap* options (see : https://manpages.debian.org/testing/bubblewrap/bwrap.1.en.html).

Examples :
```
unshare-user
    Create a new user namespace

unshare-user-try
    Create a new user namespace if possible else skip it

...
```
