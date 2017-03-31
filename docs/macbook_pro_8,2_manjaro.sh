# Macbook Pro 8,2 Manjaro

# in grub boot menu hit 'e' then enter the following after
# set gfxpayload=keep

# Switch gmux to IGD
outb 0x728 1
outb 0x710 2
outb 0x740 2

# Power down ATI 
outb 0x750 0

# Furthermore, in the kernel line, add after „quiet splash“:
i915.lvds_channel_mode=2 i915.modeset=1 i915.lvds_use_ssc=0 

# After first boot set setting perminantly
sudo nano /etc/default/grub

# Change the line „GRUB_CMDLINE_LINUX_DEFAULT=“quiet splash“ to
„GRUB_CMDLINE_LINUX_DEFAULT=“quiet splash i915.lvds_channel_mode=2 i915.modeset=1 i915.lvds_use_ssc=0“

# Uncomment (remove the "#" before) the line "GRUB_TERMINAL=console".

sudo nano /etc/grub.d/10_linux
# Locate the line: 	echo "    insmod gzio" | sed "s/^/$submenu_indentation/"
enter the following right before before this
echo "    outb 0x728 1" | sed "s/^/$submenu_indentation/"
  echo "    outb 0x710 2" | sed "s/^/$submenu_indentation/"
  echo "    outb 0x740 2" | sed "s/^/$submenu_indentation/"
  echo "    outb 0x750 0" | sed "s/^/$submenu_indentation/"


# then run
sudo update-grub


nomodeset xdriver=vesa radeon.blacklist=yes amdgpu.blacklist=yes

sudo pacman-mirrors -g
sudo pacman -Syu
sudo mhwd -r pci video-intel
sudo mhwd -r pci video-amdgpu
sudo mhwd -r pci video-ati
sudo mhwd -r pci hybrid-intel-ati-bumblebee

sudo pacman -Sy xf86-video-intel xf86-video-ati

sudo mhwd -r pci video-hybrid-intel-nouveau-bumblebee?