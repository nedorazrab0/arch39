#!/usr/bin/env bash
echo '- CHROOT'

locale-gen
ln -sf "/usr/share/zoneinfo/$3" /etc/localtime
hwclock --systohc
useradd -mg users -G wheel "$1"
echo "$2" | passwd --stdin "$1"
pacman -Syu --noconfirm
pacman -S android-tools android-udev opendoas networkmanager network-manager-applet git bash-completion flatpak zram-generator nano \
          vulkan-radeon libva-mesa-driver \
          gdm gnome grub efibootmgr ntp --noconfirm

pacman -R totem gnome-tour --noconfirm
systemctl enable NetworkManager gdm ntpd
systemctl disable avahi-daemon
systemctl mask avahi-daemon
grub-install --efi-directory=/boot/efi --target=x86_64-efi
grub-mkconfig -o /boot/grub/grub.cfg
