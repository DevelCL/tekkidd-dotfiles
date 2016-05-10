#!/bin/bash

# mkfoo automatically generates a foo file for testing
# Sunny Avery
# tekkidd.com

# Change this to suit your prefrences
DEFAULT_EXTENSION="sh"
function mkfoo {
if [ $# -eq 0 ]; then
    touch foo.$DEFAULT_EXTENSION
else
    case "$1" in
        -sh)
            touch foo.sh
            return 0
            ;;
        -pl)
            touch foo.pl
            return 0
            ;;
        -py)
            touch foo.py
            return 0
            ;;
        -html)
            touch foo.html
            return 0
            ;;
        *)
            echo "mkfoo: Unrecognized Extension"
            return 1
            ;;
    esac
fi
}
