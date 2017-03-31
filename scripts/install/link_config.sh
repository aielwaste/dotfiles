#!/usr/bin/zsh
#======================================================================================
#
# Author: Andrew Bell andrewbell8@gmail.com
# Website: https://fr1v.github.io
#
# Link my config from dotfiles and to root user as well
#======================================================================================

emulate -L zsh

setopt LOCAL_OPTIONS EXTENDED_GLOB

USER_HOME="/home/$USER"
ROOT_HOME="/root"


function link_root() {

    emulate -L zsh
    setopt LOCAL_OPTIONS EXTENDED_GLOB

    sudo rm -rf "${ROOT_HOME}"/.zprezto && sudo ln -sd "${USER_HOME}"/.dotfiles/prezto "${ROOT_HOME}"/.zprezto
    sudo rm -rf "${ROOT_HOME}"/.misc && sudo ln -sd "${USER_HOME}"/.dotfiles/misc "${ROOT_HOME}"/.misc
    sudo rm -rf "${ROOT_HOME}"/.bash && sudo ln -sd "${USER_HOME}"/.dotfiles/bash "${ROOT_HOME}"/.bash
    sudo rm -rf "${ROOT_HOME}"/.xorg && sudo ln -sd "${USER_HOME}"/.dotfiles/xorg "${ROOT_HOME}"/.xorg
    sudo rm -rf "${ROOT_HOME}"/.scripts && sudo ln -sd "${USER_HOME}"/.dotfiles/scripts "${ROOT_HOME}"/.scripts
    sudo rm -rf "${ROOT_HOME}"/.neovim && sudo ln -sd "${USER_HOME}"/.dotfiles/neovim "${ROOT_HOME}"/.neovim
    sudo rm -rf "${ROOT_HOME}"/.config/ranger && sudo ln -sd "${USER_HOME}"/.dotfiles/ranger "${ROOT_HOME}"/.config/ranger
    sudo rm -rf "${ROOT_HOME}"/.zprezto && ln -sd "${USER_HOME}"/.dotfiles/prezto "${ROOT_HOME}"/.zprezto
    sudo rm -rf "${ROOT_HOME}"/.misc && ln -sd "${USER_HOME}"/.dotfiles/misc "${ROOT_HOME}"/.misc
    sudo rm -rf "${ROOT_HOME}"/.bash && ln -sd "${USER_HOME}"/.dotfiles/bash "${ROOT_HOME}"/.bash
    sudo rm -rf "${ROOT_HOME}"/.xorg && ln -sd "${USER_HOME}"/.dotfiles/xorg "${ROOT_HOME}"/.xorg
    sudo rm -rf "${ROOT_HOME}"/.scripts && ln -sd "${USER_HOME}"/.dotfiles/scripts "${ROOT_HOME}"/.scripts
    sudo rm -rf "${ROOT_HOME}"/.vcs && ln -sd "${USER_HOME}"/.dotfiles/vcs "${ROOT_HOME}"/.vcs
    sudo rm -rf "${ROOT_HOME}"/.vcs/git && ln -sd "${USER_HOME}"/.dotfiles/vcs/git "${ROOT_HOME}"/.git
    sudo rm -rf "${ROOT_HOME}"/.vcs/svn && ln -sd "${USER_HOME}"/.dotfiles/vcs/svn "${ROOT_HOME}"/.svn
    sudo rm -rf "${ROOT_HOME}"/.vcs/hg && ln -sd "${USER_HOME}"/.dotfiles/vcs/hg "${ROOT_HOME}"/.hg
    sudo rm -rf "${ROOT_HOME}"/.config/ranger && ln -sd "${USER_HOME}"/.dotfiles/ranger "${ROOT_HOME}"/.config/ranger
    sudo rm -rf "${ROOT_HOME}"/.config/nvim && ln -sd "${USER_HOME}"/.dotfiles/nvim "${ROOT_HOME}"/.config/nvim
    sudo rm -rf "${ROOT_HOME}"/.config/sublime-text-3 && ln -sd "${USER_HOME}"/.dotfiles/config/sublime-text-3 "${ROOT_HOME}"/.config

    for rcfile in "${USER_HOME}"/.zprezto/runcoms/^README.md(.N); do
    sudo ln -sf "$rcfile" "${ROOT_HOME}/.${rcfile:t}"
    done

    for rcfile in "${USER_HOME}"/.git/^README.md(.N); do
    sudo ln -sf "$rcfile" "${ROOT_HOME}/.${rcfile:t}"
    done

    for rcfile in "${USER_HOME}"/.svn/^README.md(.N); do
    sudo ln -sf "$rcfile" "${ROOT_HOME}/.${rcfile:t}"
    done

    for rcfile in "${USER_HOME}"/.hg/^README.md(.N); do
    sudo ln -sf "$rcfile" "${ROOT_HOME}/.${rcfile:t}"
    done

    for rcfile in "${USER_HOME}"/.misc/^dircolors(.N); do
    sudo ln -sf "$rcfile" "${ROOT_HOME}/.${rcfile:t}"

    sudo rm -rf "$ROOT_HOME"/.zprezto && sudo ln -sd "$USER_HOME"/.dotfiles/prezto "$ROOT_HOME"/.zprezto
    sudo rm -rf "$ROOT_HOME"/.misc && sudo ln -sd "$USER_HOME"/.dotfiles/misc "$ROOT_HOME"/.misc
    sudo rm -rf "$ROOT_HOME"/.bash && sudo ln -sd "$USER_HOME"/.dotfiles/bash "$ROOT_HOME"/.bash
    sudo rm -rf "$ROOT_HOME"/.xorg && sudo ln -sd "$USER_HOME"/.dotfiles/xorg "$ROOT_HOME"/.xorg
    sudo rm -rf "$ROOT_HOME"/.scripts && sudo ln -sd "$USER_HOME"/.dotfiles/scripts "$ROOT_HOME"/.scripts
    sudo rm -rf "$ROOT_HOME"/.config/nvim && sudo ln -sd "$USER_HOME"/.dotfiles/nvim "$ROOT_HOME"/.config/nvim

    for rcfile in "$USER_HOME"/.zprezto/runcoms/^README.md(.N); do
    sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    for rcfile in "$USER_HOME"/.bash/^README.md(.N); do
    sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    for rcfile in "$USER_HOME"/.misc/^README.md(.N); do
    sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    for rcfile in "$USER_HOME"/.xorg/^README.md(.N); do
    sudo ln -sf "$rcfile" "$ROOT_HOME/.${rcfile:t}"
    done

    for rcfile in "$USER_HOME"/.dotfiles/config/^README.md(.N); do
    sudo ln -sf "$rcfile" "$ROOT_HOME/.config/${rcfile:t}"
    done

    sudo rm -f "${ROOT_HOME}"/.Xresources
    sudo ln -sf "${USER_HOME}"/.misc/dircolors "${ROOT_HOME}/.dir_colors"

    sudo rm -f "$ROOT_HOME"/.Xresources
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

    if [[ $OSTYPE == *darwin* ]]; then
    ln -sd "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/tools" "${ZDOTDIR:-$HOME}/.iterm2"
    ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/iterm2_shell_integration.zsh" "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh"
    ln -sf "${ZDOTDIR:-$HOME}/.dotfiles/macos/iterm/iterm2_shell_integration.bash" "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.bash"

    brew install "${ZDOTDIR:-$HOME}/.dotfiles/macos/homebrew/macdown.rb"
    fi

    rm -rf "${ZDOTDIR:-$HOME}"/.zprezto && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/prezto "${ZDOTDIR:-$HOME}"/.zprezto
    rm -rf "${ZDOTDIR:-$HOME}"/.misc && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/misc "${ZDOTDIR:-$HOME}"/.misc
    rm -rf "${ZDOTDIR:-$HOME}"/.bash && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/bash "${ZDOTDIR:-$HOME}"/.bash
    rm -rf "${ZDOTDIR:-$HOME}"/.xorg && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/xorg "${ZDOTDIR:-$HOME}"/.xorg
    rm -rf "${ZDOTDIR:-$HOME}"/.scripts && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/scripts "${ZDOTDIR:-$HOME}"/.scripts
    rm -rf "${ZDOTDIR:-$HOME}"/.vcs && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs "${ZDOTDIR:-$HOME}"/.vcs
    rm -rf "${ZDOTDIR:-$HOME}"/.vcs/git && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs/git "${ZDOTDIR:-$HOME}"/.git
    rm -rf "${ZDOTDIR:-$HOME}"/.vcs/svn && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs/svn "${ZDOTDIR:-$HOME}"/.svn
    rm -rf "${ZDOTDIR:-$HOME}"/.vcs/hg && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/vcs/hg "${ZDOTDIR:-$HOME}"/.hg
    rm -rf "${ZDOTDIR:-$HOME}"/.arch &&
    rm -rf "${ZDOTDIR:-$HOME}"/.config/ranger && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/ranger "${ZDOTDIR:-$HOME}"/.config/ranger
    rm -rf "${ZDOTDIR:-$HOME}"/.config/nvim && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/nvim "${ZDOTDIR:-$HOME}"/.config/nvim
    rm -rf "${ZDOTDIR:-$HOME}"/.config/sublime-text-3 && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/config/sublime-text-3 "${ZDOTDIR:-$HOME}"/.config
    rm -rf /var/lib/AccountsService && ln -sd "${ZDOTDIR:-$HOME}"/.dotfiles/arch "${ZDOTDIR:-$HOME}"/.arch


    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.git/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.svn/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.hg/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.misc/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.xorg/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done

    for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/config/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.config/${rcfile:t}"
    done

    rm -f "${ZDOTDIR:-$HOME}"/.Xresources
}

# Symlink config files
function link_config() {
    emulate -L zsh
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    link_user
    root_link_inquire
}

link_config "$@"
