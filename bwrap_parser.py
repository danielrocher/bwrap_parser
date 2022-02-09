#!/usr/bin/env python3
# -*- coding: utf-8 -*
#
# Written by Daniel Rocher <daniel.rocher@resydev.fr>
# Portions created by the Initial Developer are Copyright (C) 2022

import argparse

from includes.launcher import Launcher

__version__="0.1.0"


if __name__ == '__main__':
    # Parse Args
    parser = argparse.ArgumentParser()
    parser.add_argument('-v', '--version', action='version', \
        help="show version", 
        version='%(prog)s version : {version}'.format(version=__version__))
    parser.add_argument("-p", "--profile", metavar="PROFILE",dest="profile",
            help="profile name", required=True)
    parser.add_argument("--debug", help="Debug", action="store_true")
    parser.add_argument("CMD", help="command")
    args=parser.parse_args()

    arch=Launcher(args.CMD, args.profile, args.debug)
    arch.start()
    arch.join()

