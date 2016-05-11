#!/bin/bash

# Dotfiles Maintaince Script
# Naming Convention: dot-something

# Change this if you're in an enviorment where bashrc is not at this location
DOT_LOC="~/.dotfiles"
BASH_LOC="~/.bashrc.test"
BACKUP_LOC="~/backups/."
# If the value is 1 will zip the contents of ~/.dotfiles before backing up
# Otherwise will dump the contents to the specified directory
# 0 is good for git pages, etc
# Otherwise it's good for general backups like on to a flash driv
ZIP_BACKUP=0


# Deploys the dotfiles
function dot-deploy {
    print "Deploying Bash"

    ## Deploy Main Prompt
    printf "source $DOT_LOC/bash/prompt.sh\n" >> BASH_LOC

    ## Deploy Aliases
    printf "source $DOT_LOC/bash/aliases.sh\n" >> BASH_LOC

    ## Deploy Bash Apps
    printf "source $DOT_LOC/apps/mkfoo.sh\n" >> BASH_LOC
    printf "source $DOT_LOC/apps/vim-notes.sh\n" >> BASH_LOC
    printf "source $DOT_LOC/apps/screenfetch.sh\n" >> BASH_LOC

    ########################

    echo "Deploying Fonts"
    # Create the directory if it does not exist
    if [ ! -d ~/.fonts ]; then
        /bin/mkdir ~/.fonts
    fi
    # Copy the contents of the font's directory to the .fonts directory
    /bin/cp fonts/. ~/.fonts/ -R

    echo "Done deploying fonts, powerline fonts must be enabled manually"

    ###########################

    echo "Deploying vim profile"
    # If existing vim files are found, move them to vim.old
    if [ -d ~/.vim ]; then
        echo ".vim found, moving to .vim.old"
        mv ~/.vim ~/.vim.old
    fi

    if [ -f ~/.vimrc ]; then
        echo ".vimrc found, moving to .vimrc.old"
        mv ~/.vimrc ~/.vimrc.old
    fi

    # Symbolically Link
    /bin/ln -s ~/.dotfiles/vim/.vim ~/.vim
    /bin/ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc

}

# Back up dotfiles
# Change backup location at the top
function dot-backup {
    if [ $ZIP_BACKUP -eq 0 ]; then
        dot-backup-std
    elif [ $ZIP_BACKUP -eq 0 ]; then
        dot-backup-zip
    else:
        echo "ZIP_BACKUP is non binary"
        echo "Change var ZIP_BACKUP to either a 0 or 1"
        exit 1
    fi
}

function dot-backup-zip {
    cd $DOT_LOC
    zip * backup.zip
    mv backup.zip $BACKUP_LOC
    exit 0
}

function dot-backup-std {
    cd $DOT_LOC
    cp . $BACKUP_LOC -R -U
    exit 0

}

