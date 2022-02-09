#!/usr/bin/env python3
# -*- coding: utf-8 -*
#
# Written by Daniel Rocher <daniel.rocher@resydev.fr>
# Portions created by the Initial Developer are Copyright (C) 2022

import sys, os, re
import threading
import pty

class Launcher(threading.Thread):
    def __init__(self, command, profile_filename, debug_enabled=False):
        threading.Thread.__init__(self)
        self.command=command
        self.profile_filename=profile_filename
        self.debug_enabled=debug_enabled

    def debug(self, msg):
        if self.debug_enabled:
            print (str(msg))

    def printError(self, msg):
        sys.stderr.write("ERROR - {}\n".format(msg))

    def getCmdFromProfile(self, filename, cmd=[]):
        self.debug('Launcher:getCmdFromProfile {}'.format(filename))
        if not (os.path.exists(filename) and os.path.isfile(filename)):
            self.printError("File {} doesn't exist".format(filename))
            return None
        try:
            with open(filename) as f:
                for line in f.readlines():
                    line=line.strip()
                    # is empty or comment only, continue
                    if line=="" or re.match(r"^\s*(\#|\;).*", line):
                        continue
                    m=re.match(r'([^\#|\;]*)',line)
                    if m:
                        row=m[1].split()
                        if len(row)>=1:
                            if row[0]=="include":
                                if len(row)<2:
                                    self.printError("include require filename")
                                    return None
                                cmd=self.getCmdFromProfile(row[1], cmd)
                                if cmd==None: return None
                                continue
                            row[0]="--{}".format(row[0])
                            if row not in cmd: # remove duplicate
                                cmd.append(row)
        except OSError as e:
            self.printError("{} (filename : {})".format(e.strerror, filename))
            return None
        except:
            self.printError("Impossible to parse file {}".format(filename))
            return None
        return cmd

    def run(self):
        cmd=self.getCmdFromProfile(self.profile_filename)
        if cmd:
            cmd=" ".join([ " ".join(x) for x in cmd ]).split(" ")
            # add bwrap and command
            cmd.insert(0, '/usr/bin/bwrap')
            cmd.append(self.command)

            line=" ".join(cmd)
            self.debug("start command : {}".format(line))
            pty.spawn(("sh", "-c", line))

