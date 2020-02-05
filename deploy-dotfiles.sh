#!/usr/bin/env bash


# Create a .dotfiles driectory if it does not already exit
if [ ! -d ~/.dotfiles ]; then
    mkdir ~/.dotfiles
fi

/bin/cp -r apps ~/.dotfiles/.
/bin/cp -r bash ~/.dotfiles/.
/bin/cp .bashrc.dotfiles ~/.dotfiles/.


echo "source ~/.dotfiles/.bashrc.dotfiles" >> ~/.bashrc

echo "Done"
