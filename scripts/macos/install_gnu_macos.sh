function install_gnu_macos() {
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
    brew install coreutils
    brew tap homebrew/dupes
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
    brew install macvim --override-system-vim --custom-system-icons

    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gettext)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gettext)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
    export PATH="$(brew --prefix gawk)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gawk)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gnu-sed)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix mawk)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix mawk)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix findutils)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix findutils)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gnu-which)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gnu-which)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix grep)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix grep)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix binutils)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix binutils)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix diffutils)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix diffutils)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix ed)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix ed)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gnu-indent)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gnu-indent)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gnu-tar)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gnutls)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gnutls)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gzip)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gzip)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix screen)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix screen)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix watch)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix watch)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix wdiff)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix wdiff)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix wget)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix wget)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix less)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix less)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gdb)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gdb)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix gpatch)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix gpatch)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix make)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix make)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix nano)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix nano)/libexec/gnuman:/usr/local/share/man:$MANPATH"
    export PATH="$(brew --prefix m4)/libexec/gnubin:/usr/local/bin:$PATH"
    export MANPATH="$(brew --prefix m4)/libexec/gnuman:/usr/local/share/man:$MANPATH"
}

install_gnu_macos "$@"
