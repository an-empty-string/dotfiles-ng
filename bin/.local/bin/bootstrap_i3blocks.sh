#!/bin/bash
(
    cd /tmp
    git clone git://github.com/vivien/i3blocks
    cd i3blocks
    PREFIX=$HOME/.local make all install clean
    rm -rf i3blocks
)
