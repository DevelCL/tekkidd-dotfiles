#!/usr/bin/env bash

CURRENT_DIR=`/bin/pwd`
if [ ! -d ~/.fonts ]; then
    mkdir ~/.fonts
fi
cd $CURRENT_DIR/fonts/.
cp -r * ~/.fonts

