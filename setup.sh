#!/bin/sh

# Variables
bootpath=/boot
timezone=Asia/Kuala_Lumpur
cpuvendor=amd # get it from /proc/cpuinfo
arch=$(uname -m)
lang=en_US
hostname=archlinux
gitreponame=dotfiles

# Timezone
ln -sf /usr/share/zoneinfo/$timezone /etc/localtime
hwclock --systohc

# Locale
sed -n "s/^#\($lang\)/\1/" -i /etc/locale.gen
locale-gen
echo "LANG=$lang.UTF-8" > /etc/locale.conf

echo $hostname > /etc/hostname
mkinitcpio -P
passwd

# Grub
pacman -S $cpuvendor-ucode # either amd or intel
if [ -e "/sys/firmware/efi/efivars" ] then
  pacman -S efibootmgr
  grub-install --target=$arch-efi --efi-directory=$bootpath --bootloader-id=GRUB
else
  grub-install --target=i386-pc /dev/sda # where the main disk reside
fi
grub-mkconfig -o $bootpath/grub/grub.cfg

# Package initialisation
git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si
rm -rf paru
xargs -a install_aur.list paru
cd dot-config/ && stow -t $HOME/.config/ --adopt -v .
cd dot-local/bin && stow -t $HOME/.local/bin --adopt -v .
bat cache --build # to recognise themes store in $XDG_CONFIG_HOME/bat/themes/
sudo -u znc znc --makeconf

# System settings initialisation
cat $gitreponame/sysconf/fstab >> /etc/fstab
cp -r $gitreponame/sysconf/{modules-load.d,udev,X11} /etc

# systemd services setup
systemctl enable iwd.service dhcpcd.service bluetooth.service tlp.service dictd.service znc.service # dictd.service will be activated when downloading dict
systemctl enable --user gpg-agent.socket

# other default set-up
xdg-setting set default-web-browser firefox.desktop
