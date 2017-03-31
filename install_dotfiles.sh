#!/bin/bash

main() {

}

function install_macos_dotfiles() {
  # Homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install GNU Packages
  install_gnu_macos

  # clone dotfiles repo
  cd "${HOME}" && git clone --recursive https://github.com/andrewbell8/dotfiles.git .dotfiles

  # link prezto
  ln -sfd "${HOME}/.dotfiles/zsh" "${HOME}/.zprezto"

  link_zsh
  link_bash

  # change default shell to zsh
  chsh -s /usr/local/bin/zsh

  # Update submodules
  cd ${HOME}/.dotfiles && git pull && git submodule update --init --recursive

  # iTerm Integration
  ln -sfd "${HOME}"/.dotfiles/macos/iterm "${HOME}"/.iTerm
  ln -sf "${HOME}"/.dotfiles/macos/iterm/iterm2_shell_integration.zsh "${HOME}"/.iterm2_shell_integration.zsh
  ln -sf "${HOME}"/.dotfiles/macos/iterm/iterm2_shell_integration.bash "${HOME}"/.iterm2_shell_integration.bash

  # Inputrc
  ln -sf "${HOME}"/.dotfiles/misc/inputrc "${HOME}"/.inputrc

  # TMux
  ln -sf "${HOME}"/.dotfiles/misc/tmux.conf "${HOME}"/.tmux.conf

  # CTags
  ln -sf "${HOME}"/.dotfiles/misc/ctags "${HOME}"/.ctags

  # Mercurial
  ln -sf "${HOME}"/.dotfiles/misc/hgrc "${HOME}"/.hgrc

  #
  # Fonts
  #
  pip install fonttools
  pip install font-line

  # Install Powerline Fonts
  "${HOME}"/.dotfiles/fonts/powerline-fonts/install.sh

  # link git config
  ln -sf "${HOME}"/.dotfiles/git/gitconfig.macos "${HOME}"/.gitconfig
  ln -sf "${HOME}"/.dotfiles/git/gitignore.macos "${HOME}"/.gitignore

  # link pyenv
  ln -sfd "${HOME}"/.dotfiles/pyenv "${HOME}"/.pyenv

  # link rbenv
  ln -sfd "${HOME}"/.dotfiles/rbenv "${HOME}"/.rbenv

  # link nodenv
  ln -sfd "${HOME}"/.dotfiles/nodenv "${HOME}"/.nodenv

  # ranger
  ln -sfd "${HOME}"/.dotfiles/ranger "${HOME}"/.config/ranger
}

function install_linux_dotfiles() {
  # linuxbrew {{{

    # dependencies
    sudo apt install build-essential curl git python-setuptools ruby
    sudo apt install zsh bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

    export HOMEBREW_BUILD_FROM_SOURCE=1

    # Add to .bashrc or .zshrc
    export PATH="${HOME}/.linuxbrew/bin:$PATH"
    export MANPATH="${HOME}/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="${HOME}/.linuxbrew/share/info:$INFOPATH"

  # end linuxbrew }}}

  # Inputrc
  ln -sf "${HOME}"/.dotfiles/misc/inputrc "${HOME}"/.inputrc

  # TMux
  ln -sf "${HOME}"/.dotfiles/misc/tmux.conf "${HOME}"/.tmux.conf

  # CTags
  ln -sf "${HOME}"/.dotfiles/misc/ctags "${HOME}"/.ctags

  #
  # Fonts
  #

  # FiraCode
  "${HOME}"/.dotfiles/fonts/FiraCode/release.sh
  cp "${HOME}/.dotfiles/fonts/FiraCode/distr/otf/*" "/usr/share/Fonts"
  
  # Hack
  cp -r "${HOME}/.dotfiles/fonts/Hack/*" "/usr/share/Fonts"
  
  # Hasklig
  cp -r "${HOME}/.dotfiles/fonts/Hasklig/*" "/usr/share/Fonts"

  # Install Nerd Fonts
  ${HOME}/.dotfiles/fonts/nerd-fonts/install.sh

  # Install Powerline Fonts
  ${HOME}/.dotfiles/fonts/powerline-fonts/install.sh
  ##=== end fonts ===##

  # git settings
  ln -sf "${HOME}/.dotfiles/git/gitconfig.linux" "${HOME}/.gitconfig"
  ln -sf "${HOME}/.dotfiles/git/gitignore.linux" "${HOME}/.gitignore"
}

function install_archlinux_dotfiles() {
  # linuxbrew {{{

    # dependencies
    sudo pacman -S base base-devel curl git python-setuptools ruby
    sudo pacman -S zsh bash
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"

    export HOMEBREW_BUILD_FROM_SOURCE=1

    # Add to .bashrc or .zshrc
    export PATH="${HOME}/.linuxbrew/bin:$PATH"
    export MANPATH="${HOME}/.linuxbrew/share/man:$MANPATH"
    export INFOPATH="${HOME}/.linuxbrew/share/info:$INFOPATH"

  # end linuxbrew }}}

  # Inputrc
  ln -sf "${HOME}"/.dotfiles/misc/inputrc "${HOME}"/.inputrc

  # TMux
  ln -sf "${HOME}"/.dotfiles/misc/tmux.conf "${HOME}"/.tmux.conf

  # CTags
  ln -sf "${HOME}"/.dotfiles/misc/ctags "${HOME}"/.ctags

  #
  # Fonts
  #

  # FiraCode
  "${HOME}"/.dotfiles/fonts/FiraCode/release.sh
  cp "${HOME}/.dotfiles/fonts/FiraCode/distr/otf/*" "/usr/share/Fonts"
  
  # Hack
  cp -r "${HOME}/.dotfiles/fonts/Hack/*" "/usr/share/Fonts"
  
  # Hasklig
  cp -r "${HOME}/.dotfiles/fonts/Hasklig/*" "/usr/share/Fonts"

  # Install Nerd Fonts
  ${HOME}/.dotfiles/fonts/nerd-fonts/install.sh

  # Install Powerline Fonts
  ${HOME}/.dotfiles/fonts/powerline-fonts/install.sh
  ##=== end fonts ===##

  # git settings
  ln -sf "${HOME}/.dotfiles/git/gitconfig.linux" "${HOME}/.gitconfig"
  ln -sf "${HOME}/.dotfiles/git/gitignore.linux" "${HOME}/.gitignore"
}

main "$@"