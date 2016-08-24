#!/usr/bin/env bash

CURRENT_DIR=`/bin/pwd`
cd $CURRENT_DIR/vim/.
echo "Copying files"
/bin/cp -r .vim .vimrc ~/.
echo "Files Copied. Script Complete"

