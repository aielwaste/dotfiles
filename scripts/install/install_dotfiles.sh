#!/usr/bin/zsh
#======================================================================================
#
# Author: Andrew Bell andrewbell8@gmail.com
# Website: https://fr1v.github.io
#
# Link my config from dotfiles and to root user as well
#======================================================================================

setopt LOCAL_OPTIONS EXTENDED_GLOB

USER_HOME="/home/$USER"
ROOT_HOME="/root"

<<<<<<< HEAD
=======
if [ $# -ne 1 ]; then
    echo "You must specify the installation directory!"
    exit 1
fi

# Convert the installation directory to absolute path
case $1 in
    /*) PLUGIN_DIR=$1;;
    *) PLUGIN_DIR=$PWD/$1;;
esac
INSTALL_DIR="${PLUGIN_DIR}/.dotfiles"
echo "Install to \"$INSTALL_DIR\"..."
if [ -e "$INSTALL_DIR" ]; then
    echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# check git command
type git || {
    echo 'Git not installed'
    echo 'Installing git...'
    sudo pacman -Sy git
    exit 1
}
echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
    echo "Begin fetching dotfiles..."
    mkdir -p "$PLUGIN_DIR"
    git clone https://github.com/andrewbell8/dotfiles.git "$INSTALL_DIR"
    echo "Done."
    echo ""
fi


>>>>>>> 7a0d8744f260dbaa3589be6dd8a4f3072671f3e6
function link_root() {

    emulate -L zsh
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    sudo rm -rf "$ROOT_HOME"/.zprezto && sudo ln -sd "$USER_HOME"/.dotfiles/prezto "$ROOT_HOME"/.zprezto
    sudo rm -rf "$ROOT_HOME"/.misc && sudo ln -sd "$USER_HOME"/.dotfiles/misc "$ROOT_HOME"/.misc
    sudo rm -rf "$ROOT_HOME"/.scripts && sudo ln -sd "$USER_HOME"/.dotfiles/scripts "$ROOT_HOME"/.scripts
    sudo rm -rf "$ROOT_HOME"/.git && sudo ln -sd "$USER_HOME"/.dotfiles/vcs/git "$ROOT_HOME"/.git
    sudo rm -rf "$ROOT_HOME"/.hg && sudo ln -sd "$USER_HOME"/.dotfiles/vcs/hg "$ROOT_HOME"/.hg
    sudo rm -rf "$ROOT_HOME"/.config/nvim && sudo ln -sd "$USER_HOME"/.dotfiles/nvim "$ROOT_HOME"/.config/nvim

    for rcfile in "$USER_HOME"/.zprezto/runcoms/^README.md(.N); do
        sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    if [[ $OSTYPE == *darwin* ]] ; then
        sudo ln -sd "$USER_HOME/.dotfiles/macos/iterm/tools" "$ROOT_HOME/.iterm2"
        sudo ln -sf "$USER_HOME/.dotfiles/macos/iterm/iterm2_shell_integration.zsh" "$ROOT_HOME/.iterm2_shell_integration.zsh"
        sudo ln -sf "$USER_HOME/.dotfiles/macos/iterm/iterm2_shell_integration.bash" "$ROOT_HOME/.iterm2_shell_integration.bash"

        for rcfile in "$USER_HOME"/.git/macos/^README.md(.N); do
            sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
        done

        for rcfile in "$USER_HOME"/.hg/macos/^README.md(.N); do
            sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
        done
        
        cd "$ROOT_HOME/.zprezto/modules/prompt/external/powerlevel9k && sudo ln 
        -sfr powerlevel9k.zsh-theme ../../functions/prompt_powerlevel9k_setup

        sudo ln -sf "$USER_HOME/.dotfiles/misc/macos/dircolors" "$ROOT_HOME/.dircolors"
        sudo rm -rf "$ROOT_HOME/Library/Application Support/Sublime Text 3/Packages/User" && sudo ln -sd "$USER_HOME/.dotfiles/config/sublime/Packages/User" "$ROOT_HOME/Library/Application Support/Sublime Text 3/Packages"
    elif [[ $OSTYPE == *linux* ]] ; then
        for rcfile in "$USER_HOME"/.git/linux/^README.md(.N); do
            sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
        done

        for rcfile in "$USER_HOME"/.hg/linux/^README.md(.N); do
            sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
        done

<<<<<<< HEAD
        ln -sf "$USER_HOME/.dotfiles/misc/linux/dircolors" "$ROOT_HOME/.dircolors"
=======
        sudo ln -sf "$USER_HOME/.dotfiles/misc/linux/dircolors" 
        "$ROOT_HOME/.dircolors"
>>>>>>> 7a0d8744f260dbaa3589be6dd8a4f3072671f3e6
        rm -rf "$USER_HOME/.config/sublime-text-3/Packages/User" && sudo ln -sd "$USER_HOME/.dotfiles/config/sublime/Packages/User" "$ROOT_HOME/.config/sublime-text-3/Packages"
    fi

    for rcfile in "$USER_HOME"/.misc/^README.md(.N); do
        sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    for rcfile in "$USER_HOME"/.xorg/^README.md(.N); do
        sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done
}

function root_link_inquire()  {
    emulate -L zsh

    echo  -n "Do you want to link your config to /root as well [Y/N]? "
    read answer
    finish="-1"
    while [ "$finish" = '-1' ]
    do
    finish="1"
    if [ "$answer" = '' ];
    then
    answer=""
    else
      case $answer in
        y | Y | yes | YES ) answer="y"; link_root; echo "User & root config linked, script complete"; exit 1;;
        n | N | no | NO ) answer="n"; echo "User config only linked, script complete"; exit 1;;
        *) finish="-1";
          echo -n 'Invalid response -- please reenter:';
          read answer;;
      esac
    fi
    done
}

function link_user() {

    emulate -L zsh

    setopt LOCAL_OPTIONS EXTENDED_GLOB

    rm -rf "${ZDOTDIR:-$HOME}"/.zprezto && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/prezto "${ZDOTDIR:-$HOME}"/.zprezto
    rm -rf "${ZDOTDIR:-$HOME}"/.misc && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/misc "${ZDOTDIR:-$HOME}"/.misc
    rm -rf "${ZDOTDIR:-$HOME}"/.xorg && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/xorg "${ZDOTDIR:-$HOME}"/.xorg
    rm -rf "${ZDOTDIR:-$HOME}"/.scripts && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/scripts "${ZDOTDIR:-$HOME}"/.scripts
    rm -rf "${ZDOTDIR:-$HOME}"/.git && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs/git "${ZDOTDIR:-$HOME}"/.git
    rm -rf "${ZDOTDIR:-$HOME}"/.hg && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs/hg "${ZDOTDIR:-$HOME}"/.hg
    rm -rf "${ZDOTDIR:-$HOME}"/.config/ranger && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/ranger "${ZDOTDIR:-$HOME}"/.config/ranger
    rm -rf "${ZDOTDIR:-$HOME}"/.config/nvim && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/nvim "${ZDOTDIR:-$HOME}"/.config/nvim


    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    if [[ $OSTYPE == *darwin* ]] ; then
        ln -sd "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/tools" "${ZDOTDIR:-$HOME}/.iterm2"
        ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/iterm2_shell_integration.zsh" "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh"
        ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/iterm2_shell_integration.bash" "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.bash"

        brew install "${ZDOTDIR:-$HOME}/.dotfiles/macos/homebrew/macdown.rb"

        for rcfile in "${ZDOTDIR:-$HOME}"/.git/macos/^README.md(.N); do
            ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done

        for rcfile in "${ZDOTDIR:-$HOME}"/.hg/macos/^README.md(.N); do
            ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done

        ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/misc/macos/dircolors" "${ZDOTDIR:-$HOME}/.dircolors"
        rm -rf "${ZDOTDIR:-$HOME}/Library/Application Support/Sublime Text 3/Packages/User" && ln -sd "${ZDOTDIR:-$HOME}/.dotfiles/config/sublime/Packages/User" "${ZDOTDIR:-$HOME}/Library/Application Support/Sublime Text 3/Packages"
    elif [[ $OSTYPE == *linux* ]] ; then
        for rcfile in "${ZDOTDIR:-$HOME}"/.git/linux/^README.md(.N); do
            ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done

        for rcfile in "${ZDOTDIR:-$HOME}"/.hg/linux/^README.md(.N); do
            ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
        done

        ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/misc/linux/dir_colors" "${ZDOTDIR:-$HOME}/.dir_colors"
        rm -rf "${ZDOTDIR:-$HOME}/.config/sublime-text-3/Packages/User" && ln -sd "${ZDOTDIR:-$HOME}/.dotfiles/config/sublime/Packages/User" "${ZDOTDIR:-$HOME}/.config/sublime-text-3/Packages"
    fi

    for rcfile in "${ZDOTDIR:-$HOME}"/.misc/^README.md(.N); do
        ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.xorg/^README.md(.N); do
        ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    
    cd ~/.zprezto/modules/prompt/external/powerlevel9k && ln -sfr 
    powerlevel9k.zsh-theme ../../functions/prompt_powerlevel9k_setup
}

# Symlink config files
function install_dotfiles() {
    emulate -L zsh

    link_user
    root_link_inquire
}

install_dotfiles "$@"
