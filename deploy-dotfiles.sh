#!/usr/bin/env bash


# Create a .dotfiles driectory if it does not already exit
echo "Checking if .dotfiles directory exists"
if [ ! -d ~/.dotfiles ]; then
    echo "Directory does not exit, creating directory"
    mkdir /bin/mkdir ~/.dotfiles
fi

echo "Moving folders to .dotfiles"
/bin/cp -r apps ~/.dotfiles/.
/bin/cp -r bash ~/.dotfiles/.


echo "Sourcing .bashrc.dotfiles to .bashrc"
echo "source ~/.dotfiles/.bashrc.dotfiles" >> ~/.bashrc

echo "Done"
