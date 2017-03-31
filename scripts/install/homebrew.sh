#!/bin/zsh

function brew-essentials() {
    brew install cloc
    brew install cmake
    brew install coreutils
    brew install ctags
    brew install cv
    brew install git
    brew install gotags
    brew install hr
    brew install httpie
    brew install icdiff
    brew install jq
    brew install lnav
    brew install mercurial
    brew install ncdu
    brew install node
    brew install p7zip
    brew install pstree
    brew install pyenv
    brew install ranger
    brew install rbenv
    brew install ruby-build
    brew install sqlite
    brew install ssh-copy-id
    brew install the_silver_searcher
    brew install tmux
    brew install vim
    brew install watch
    brew install zsh
}


function gnu_macos_install() {
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

    brew tap homebrew/dupes

    brew install coreutils
    brew install binutils
    brew install diffutils
    brew install ed --with-default-names
    brew install findutils --with-default-names
    brew install gawk
    brew install gnu-indent --with-default-names
    brew install gnu-sed --with-default-names
    brew install gnu-tar --with-default-names
    brew install gnu-which --with-default-names
    brew install gnutls
    brew install grep --with-default-names
    brew install gzip
    brew install screen
    brew install watch
    brew install wdiff --with-gettext
    brew install wget
    brew install bash
    brew install emacs
    brew install gdb
    brew install gpatch
    brew install less
    brew install m4
    brew install make
    brew install nano
    brew install file-formula
    brew install git
    brew install openssh
    brew install perl
    brew install python
    brew install rsync
    brew install svn
    brew install unzip
    brew install vim --override-system-vi
}

function vim_install_macos() {
    brew install vim --with-lua --with-luajit --with-override-system-vi --with-python3 --with-tcl --HEAD
    brew install neovim/neovim/neovim --HEAD
    brew install macvim-dev/macvim/macvim --with-properly-linked-python2-python3 --HEAD
}
