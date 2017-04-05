#!/bin/sh
2
set -e
3
#
4
# Author: Andrew Bell andrewbell8@gmail.com
5
# Website: https://fr1v.github.io
6
#
7
​
8
#
9
# Packer
10
#
11
​
12
package="packer"
13
command="packer"
14
​
15
#checking if application is already installed or else install with aur helpers
16
if pacman -Qi $package &> /dev/null; then
17
        echo
18
        echo "$package is already installed"
19
        echo
20
else
21
        sudo pacman -S --noconfirm --needed base-dvel wget fakeroot grep sed bash curl pacman jshon expac
22
        [ -d /tmp/packer ] && rm -rf /tmp/packer
23
        mkdir /tmp/packer
24
        wget https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=packer
25
        mv PKGBUILD\?h\=packer /tmp/packer/PKGBUILD
26
        cd /tmp/packer
27
        makepkg -i /tmp/packer --noconfirm
28
        [ -d /tmp/packer ] && rm -rf /tmp/packer
29
​
30
        # Just checking if installation was successful
31
        if pacman -Qi $package &> /dev/null; then
32
        echo
33
        echo "$package has been installed"
34
        echo
35
        else
36
        echo
37
        echo "$package has NOT been installed"
38
        echo
39
        fi
40
​
41
fi
42
