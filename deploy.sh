# Dotfiles deployment script
# By Sunny Avery

# TODO:
    # Fix paths: Not broken but could be better
    # Employ some better practices
        # This was done in hurry
    # Test at home for functionality


function deploy_bash {
    echo "Deploying Bash"
    printf "source ~/.dotfiles/bash/prompt.sh" >> ~/.bashrc
    printf "source ~/.dotfiles/bash/aliases.sh" >> ~/.bashrc
}
function deploy_apps {
    echo "Deploying Apps"
    printf "source ~/.dotfiles/apps/mkfoo.sh" >> ~/.bashrc
    printf "source ~/.dotfiles/apps/vim-notes.sh" >> ~/.bashrc

}
function deploy_fonts {
    echo "Deploying fonts"

    if [ ! -d ~/.fonts ]; then
        mkdir ~/.fonts
    fi
    cp -r ~/.dotfiles/fonts/* ~/.fonts
}


# This works
function deploy_vim {
    if [ -d ~/.vim ]; then
       mv ~/.vim ~/.vim_old
    fi

    if [ -f ~/.vimrc ]; then
        mv ~/.vimrc ~/.vimrc_old
    fi
    echo "creating symlink for .vim"
    ln -s ~/.dotfiles/vim/.vim ~/.vim
    echo "creating symlink for .vimrc"
    ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
}

deploy_vim
