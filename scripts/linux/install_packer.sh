#!/bin/sh
set -e
# 
# Author: Andrew Bell andrewbell8@gmail.com
# Website: https://fr1v.github.io
#

#
# Packer
#

package="packer"
command="packer"

#checking if application is already installed or else install with aur helpers
if pacman -Qi $package &> /dev/null; then

	echo
	echo "$package is already installed"
	echo

else

	sudo pacman -S --noconfirm --needed base-dvel wget fakeroot grep sed bash curl pacman jshon expac
	[ -d /tmp/packer ] && rm -rf /tmp/packer
	mkdir /tmp/packer
	wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
	mv PKGBUILD\?h\=packer /tmp/packer/PKGBUILD
	cd /tmp/packer
	makepkg -i /tmp/packer --noconfirm
	[ -d /tmp/packer ] && rm -rf /tmp/packer

	# Just checking if installation was successful
	if pacman -Qi $package &> /dev/null; then
	
	echo
	echo "$package has been installed"
  echo

	else

	echo
	echo "$package has NOT been installed"
	echo

	fi

fi
