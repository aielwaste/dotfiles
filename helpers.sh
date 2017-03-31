#!/bin/bash

#GLOBALS
checklist=( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 )

echo "Checking system type..."
if [[ $(uname -o) == *darwin* ]]; then
  prefix=/Users/
  pkgmngr=brew
elif [[ $OSTYPE == *linux* ]]; then
  prefix=/home/
  if [[ $(uname -m) == * ]]; then 
  fi 
elif [[ $OSTYPE == *msys* ]]; then
  prefix=/c/Users/
else
  echo "Unknown System Type"
  break;
fi

#=====   Colors   =====
  Bold=$(tput bold)
  Underline=$(tput sgr 0 1)
  Reset=$(tput sgr0)
  # Regular Colors
  Red=$(tput setaf 1)
  Green=$(tput setaf 2)
  Yellow=$(tput setaf 3)
  Blue=$(tput setaf 4)
  Purple=$(tput setaf 5)
  Cyan=$(tput setaf 6)
  White=$(tput setaf 7)
  # Bold
  BRed=${Bold}$(tput setaf 1)
  BGreen=${Bold}$(tput setaf 2)
  BYellow=${Bold}$(tput setaf 3)
  BBlue=${Bold}$(tput setaf 4)
  BPurple=${Bold}$(tput setaf 5)
  BCyan=${Bold}$(tput setaf 6)
  BWhite=${Bold}$(tput setaf 7)
#===== End Colors =====


#=====  PROMPT    =====
  prompt1="Enter your option: "
  prompt2="Enter n° of options (ex: 1 2 3 or 1-3): "
  prompt3="You have to manually enter the following commands, then press ${BYellow}ctrl+d${Reset} or type ${BYellow}exit${Reset}:"
#===== End PROMPT =====

function print_info() {
  #Console width number
  T_COLS=`tput cols`
  echo -e "${Bold}$1${Reset}\n" | fold -sw $(( $T_COLS - 18 )) | sed 's/^/\t/'
}

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


# Install fira code fonts
# Options are:
# font-fira-code, font-fira-sans, font-fira-mono, font-firacode-nerd-font
# font-firacode-nerd-font-mono, font-firamono-nerd-font, font-fira-mono-for-powerline
# font-firacode-nerd-font-mono
function firacode_fonts_homebrew() {
  brew tap caskroom/fonts
  brew cask install font-fira-code
  brew cask install font-fira-sans
  brew cask install font-fira-mono
  brew cask install font-firacode-nerd-font
  brew cask install font-firacode-nerd-font-mono
}

# Install hasklig fonts
# Options are:
# font-hasklig font-hasklig-nerd-font font-hasklig-nerd-font-mono
function hasklig_fonts_homebrew() {
  local fontlist
  
  brew tap caskroom/fonts
  brew cask install font-hasklig
  brew cask install font-hasklig-nerd-font
  brew cask install font-hasklig-nerd-font-mono
}

function read_input() { 
    if [[ $AUTOMATIC_MODE -eq 1 ]]; then
      OPTION=$1
    else
      read -p "$prompt1" OPTION
    fi
  } 


function read_input_text() { 
  if [[ $AUTOMATIC_MODE -eq 1 ]]; then
    OPTION=$2
  else
    read -p "$1 [y/N]: " OPTION
    echo ""
  fi
  OPTION=`echo "$OPTION" | tr '[:upper:]' '[:lower:]'`
} 


function read_input_options() { 
  local line
  local packages
  if [[ $AUTOMATIC_MODE -eq 1 ]]; then
    array=("$1")
  else
    read -p "$prompt2" OPTION
    array=("$OPTION")
  fi
  for line in ${array[@]/,/ }; do
    if [[ ${line/-/} != $line ]]; then
      for ((i=${line%-*}; i<=${line#*-}; i++)); do
        packages+=($i);
      done
    else
      packages+=($line)
    fi
  done
  OPTIONS=("${packages[@]}")
} 


function print_line() { 
  printf "%$(tput cols)s\n"|tr ' ' '-'
} 


function print_title() { 
  clear
  print_line
  echo -e "# ${Bold}$1${Reset}"
  print_line
  echo ""
} 


function print_info() { 
  #Console width number
  T_COLS=`tput cols`
  echo -e "${Bold}$1${Reset}\n" | fold -sw $(( $T_COLS - 18 )) | sed 's/^/\t/'
} 


function print_warning() { 
  T_COLS=`tput cols`
  echo -e "${BYellow}$1${Reset}\n" | fold -sw $(( $T_COLS - 1 ))
} 


function print_danger() { 
  T_COLS=`tput cols`
  echo -e "${BRed}$1${Reset}\n" | fold -sw $(( $T_COLS - 1 ))
} 


function start_module() { 
  modprobe $1
} 


function add_module() { 
  for module in $1; do
    #check if the name of the module can be the same of the module or the given name
    [[ $# -lt 2 ]] && local _module_name="$module" || local _module_name="$2"
    local _has_module=`cat /etc/modules-load.d/${_module_name}.conf 2>&1 | grep $module`
    [[ -z $_has_module ]] && echo "$module" >> /etc/modules-load.d/${_module_name}.conf
    start_module "$module"
  done
} 


function add_repository() { 
  local _repo=${1}
  local _url=${2}
  [[ -n ${3} ]] && local _siglevel="\nSigLevel = ${3}" || local _siglevel=""

  local _check_repo=`grep -F "${_repo}" /etc/pacman.conf`
  if [[ -z $_check_repo ]]; then
    echo -e "\n[${_repo}]${_siglevel}\nServer = ${_url}" >> /etc/pacman.conf
    system_update
  fi
} 


function check_multilib(){ 
  # this option will avoid any problem with packages install
  if [[ $ARCHI == x86_64 ]]; then
    local _has_multilib=`grep -n "\[multilib\]" /etc/pacman.conf | cut -f1 -d:`
    if [[ -z $_has_multilib ]]; then
      echo -e "\n[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
      echo -e '\nMultilib repository added into pacman.conf file'
    else
      sed -i "${_has_multilib}s/^#//" /etc/pacman.conf
      local _has_multilib=$(( ${_has_multilib} + 1 ))
      sed -i "${_has_multilib}s/^#//" /etc/pacman.conf
    fi
  fi
} 


function add_key() { 
  pacman-key -r $1
  pacman-key --lsign-key $1
} 


function pacman_key(){ 
  if [[ ! -d /etc/pacman.d/gnupg ]]; then
    print_title "PACMAN KEY - https://wiki.archlinux.org/index.php/pacman-key"
    print_info "Pacman uses GnuPG keys in a web of trust model to determine if packages are authentic."
    package_install "haveged"
    haveged -w 1024
    pacman-key --init
    pacman-key --populate archlinux
    pkill haveged
    package_remove "haveged"
  fi
} 


function add_line() { 
  local _add_line=${1}
  local _filepath=${2}

  local _has_line=`grep -ci "${_add_line}" ${_filepath} 2>&1`
  [[ $_has_line -eq 0 ]] && echo "${_add_line}" >> ${_filepath}
} 


function replace_line() { 
  local _search=${1}
  local _replace=${2}
  local _filepath=${3}
  local _filebase=`basename ${3}`

  sed -e "s/${_search}/${_replace}/" ${_filepath} > /tmp/${_filebase} 2>"$LOG"
  if [[ ${?} -eq 0 ]]; then
    mv /tmp/${_filebase} ${_filepath}
  else
    cecho "failed: ${_search} - ${_filepath}"
  fi
} 


function update_early_modules() { 
  local _new_module=${1}
  local _current_modules=`egrep ^MODULES= /etc/mkinitcpio.conf`

  if [[ -n ${_new_module} ]]; then
    # Determine if the new module is already listed.
    local _exists=`echo ${_current_modules} | grep ${_new_module}`
    if [ $? -eq 1 ]; then

      source /etc/mkinitcpio.conf
      if [[ -z ${MODULES} ]]; then
        _new_moduleS="${_new_module}"
      else
        _new_moduleS="${MODULES} ${_new_module}"
      fi
      replace_line "MODULES=\"${MODULES}\"" "MODULES=\"${_new_moduleS}\"" /etc/mkinitcpio.conf
      ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Rebuilding init "
      mkinitcpio -p linux >>"$LOG" 2>&1 &
      pid=$!;progress $pid
    fi
  fi
} 


function is_package_installed() { 
  #check if a package is already installed
  for PKG in $1; do
    pacman -Q $PKG &> /dev/null && return 0;
  done
  return 1
} 


function checkbox() { 
  #display [X] or [ ]
  [[ "$1" -eq 1 ]] && echo -e "${BBlue}[${Reset}${Bold}X${BBlue}]${Reset}" || echo -e "${BBlue}[ ${BBlue}]${Reset}";
} 


function checkbox_package() { 
  #check if [X] or [ ]
  is_package_installed "$1" && checkbox 1 || checkbox 0
} 


function function aui_download_packages() { 
  for PKG in $1; do
    #exec command as user instead of root
    su - ${username} -c "
      [[ ! -d aui_packages ]] && mkdir aui_packages
      cd aui_packages
      curl -o ${PKG}.tar.gz https://aur.archlinux.org/cgit/aur.git/snapshot/${PKG}.tar.gz
      tar zxvf ${PKG}.tar.gz
      rm ${PKG}.tar.gz
      cd ${PKG}
      makepkg -csi --noconfirm
    "
  done
} 


function aur_package_install() { 
  su - ${username} -c "sudo -v"
  #install package from aur
  for PKG in $1; do
    if ! is_package_installed "${PKG}" ; then
      if [[ $AUTOMATIC_MODE -eq 1 ]]; then
        ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Installing ${AUR} ${Bold}${PKG}${Reset} "
        su - ${username} -c "${AUR_PKG_MANAGER} --noconfirm -S ${PKG}" >>"$LOG" 2>&1 &
        pid=$!;progress $pid
      else
        su - ${username} -c "${AUR_PKG_MANAGER} -S ${PKG}"
      fi
    else
      if [[ $VERBOSE_MODE -eq 0 ]]; then
        cecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Installing ${AUR} ${Bold}${PKG}${Reset} success"
      else
        echo -e "Warning: ${PKG} is up to date --skipping"
      fi
    fi
  done
} 


function package_install() { 
  #install packages using pacman
  if [[ $AUTOMATIC_MODE -eq 1 || $VERBOSE_MODE -eq 0 ]]; then
    for PKG in ${1}; do
      local _pkg_repo=`pacman -Sp --print-format %r ${PKG} | uniq | sed '1!d'`
      case $_pkg_repo in
        "core")
          _pkg_repo="${BRed}${_pkg_repo}${Reset}"
          ;;
        "extra")
          _pkg_repo="${BYellow}${_pkg_repo}${Reset}"
          ;;
        "community")
          _pkg_repo="${BGreen}${_pkg_repo}${Reset}"
          ;;
        "multilib")
          _pkg_repo="${BCyan}${_pkg_repo}${Reset}"
          ;;
      esac
      if ! is_package_installed "${PKG}" ; then
        ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Installing (${_pkg_repo}) ${Bold}${PKG}${Reset} "
        pacman -S --noconfirm --needed ${PKG} >>"$LOG" 2>&1 &
        pid=$!;progress $pid
      else
        cecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Installing (${_pkg_repo}) ${Bold}${PKG}${Reset} exists "
      fi
    done
  else
    pacman -S --needed ${1}
  fi
} 


function package_remove() { 
  #remove package
  for PKG in ${1}; do
    if is_package_installed "${PKG}" ; then
      if [[ $AUTOMATIC_MODE -eq 1 || $VERBOSE_MODE -eq 0 ]]; then
        ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Removing ${Bold}${PKG}${Reset} "
        pacman -Rcsn --noconfirm ${PKG} >>"$LOG" 2>&1 &
        pid=$!;progress $pid
      else
       pacman -Rcsn ${PKG}
      fi
    fi
  done
} 


function system_update() { 
  pacman -Sy
} 


function contains_element() { 
  #check if an element exist in a string
  for e in "${@:2}"; do [[ $e == $1 ]] && break; done;
} 


function config_xinitrc() { 
  #create a xinitrc file in home user directory
  cp -fv /etc/X11/xinit/xinitrc /home/${username}/.xinitrc
  echo -e "exec $1" >> /home/${username}/.xinitrc
  chown -R ${username}:users /home/${username}/.xinitrc
} 


function invalid_option() { 
  print_line
  echo "Invalid option. Try another one."
  pause_function
} 


function pause_function() {
  print_line
  if [[ $AUTOMATIC_MODE -eq 0 ]]; then
    read -e -sn 1 -p "Press enter to continue..."
  fi
}


function menu_item() {
  #check if the number of arguments is less then 2
  [[ $# -lt 2 ]] && _package_name="$1" || _package_name="$2";
  #list of chars to remove from the package name
  local _chars=("Ttf-" "-bzr" "-hg" "-svn" "-git" "-stable" "-icon-theme" "Gnome-shell-theme-" "Gnome-shell-extension-");
  #remove chars from package name
  for char in ${_chars[@]}; do _package_name=`echo ${_package_name^} | sed 's/'$char'//'`; done
  #display checkbox and package name
  echo -e "$(checkbox_package "$1") ${Bold}${_package_name}${Reset}"
}


function mainmenu_item() {
  #if the task is done make sure we get the state
  if [ $1 == 1 -a "$3" != "" ]; then
    state="${BGreen}[${Reset}$3${BGreen}]${Reset}"
  fi
  echo -e "$(checkbox "$1") ${Bold}$2${Reset} ${state}"
}


function system_ctl() {
  local _action=${1}
  local _object=${2}
  ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} systemctl ${_action} ${_object} "
  systemctl ${_action} ${_object} >> "$LOG" 2>&1
  pid=$!;progress $pid
}


function arch_chroot() {
  arch-chroot $MOUNTPOINT /bin/bash -c "${1}"
}


function run_as_user() {
  sudo -H -u ${username} ${1}
}


function add_user_to_group() {
  local _user=${1}
  local _group=${2}

  if [[ -z ${_group} ]]; then
    error_msg "ERROR! 'add_user_to_group' was not given enough parameters."
  fi

  ncecho " ${BBlue}[${Reset}${Bold}X${BBlue}]${Reset} Adding ${Bold}${_user}${Reset} to ${Bold}${_group}${Reset} "
  groupadd ${_group} >>"$LOG" 2>&1 &
  gpasswd -a ${_user} ${_group} >>"$LOG" 2>&1 &
  pid=$!;progress $pid
}


function setlocale() {
  local _locale_list=(`cat /etc/locale.gen | grep UTF-8 | sed 's/\..*$//' | sed '/@/d' | awk '{print $1}' | uniq | sed 's/#//g'`);
  PS3="$prompt1"
  echo "Select locale:"
  select LOCALE in "${_locale_list[@]}"; do
    if contains_element "$LOCALE" "${_locale_list[@]}"; then
      LOCALE_UTF8="${LOCALE}.UTF-8"
      break
    else
      invalid_option
    fi
  done
}

# set timezone linux distros
function settimezone() {
  local _zones=(`timedatectl list-timezones | sed 's/\/.*$//' | uniq`)
  PS3="$prompt1"
  echo "Select zone:"
  select ZONE in "${_zones[@]}"; do
    if contains_element "$ZONE" "${_zones[@]}"; then
      local _subzones=(`timedatectl list-timezones | grep ${ZONE} | sed 's/^.*\///'`)
      PS3="$prompt1"
      echo "Select subzone:"
      select SUBZONE in "${_subzones[@]}"; do
        if contains_element "$SUBZONE" "${_subzones[@]}"; then
          break
        else
          invalid_option
        fi
      done
      break
    else
      invalid_option
    fi
  done

function install_zsh() {
  brew install zsh --HEAD
  brew install zsh-git-prompt --HEAD
  brew install zsh-syntax-highlighting --HEAD
  brew install zsh-history-substring-search --HEAD
  brew install zsh-autosuggestions --HEAD
  brew install zsh-lovers --HEAD
  brew install zsh-completions --HEAD                    
  brew install zsh-navigation-tools --HEAD
  brew install zshdb

  sudo sed -i '$a /usr/local/bin/zsh' /etc/SHELLS
}

function install_bash() {
  brew install git --HEAD
  brew install bash --HEAD
  brew install apm-bash-completion --HEAD
  brew install bash-git-prompt --HEAD
  brew install bashish --HEAD
  brew install bash-preexec --HEAD
  brew install calabash --HEAD
  brew install bash-completion --HEAD
  brew install bashdb --HEAD
  brew install checkbashisms

  sudo sed -i '$a /usr/local/bin/bash' /etc/SHELLS
}

# Symlink zsh files
function linkup() {

  emulate -L zsh

  setopt EXTENDED_GLOB

  ln -sfd "/Users/${USER}/.dotfiles/prezto" "/Users/${USER}"
  
  # link prezto (zsh) files to $HOME
  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

  # link bash files to $HOME
  for rcfile in "${HOME}"/.dotfiles/bash/^README.md(.N); do
    ln -sf "$rcfile" "${HOME}/.${rcfile:t}"
  done

  # Link config files in misc dir to home
  for rcfile in "${HOME}"/.dotfiles/misc/; do
    ln -sf "$rcfile" "${HOME}/.${rcfile:t}"
  done

  if [[ $OSTYPE == *darwin* ]]; then

    ln -sdf "${prefix}${USER}/.dotfiles/macos/iterm/iterm/tools" "${HOME}"/.iterm2

    if [[ $(echo "$SHELL") == *zsh* ]]; then
      if [[ -f "${prefix}${USER}/.dotfiles/macos/iterm/iterm2_shell_intgration.zsh" ]]; then
        ln -sf "${prefix}${USER}/.dotfiles/macos/iterm/iterm2_shell_intgration.zsh"
      fi
    elif [[ $(echo "$SHELL") == *bash* ]]; then
      if [[ -f "${prefix}${USER}/.dotfiles/macos/iterm/iterm2_shell_intgration.bash" ]]; then
        ln -sf "${prefix}${USER}/.dotfiles/macos/iterm/iterm2_shell_intgration.bash"
      fi
    fi
  fi
}