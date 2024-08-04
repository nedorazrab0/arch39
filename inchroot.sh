#!/usr/bin/env bash
echo '- CHROOT'

locale-gen
ln -sf "/usr/share/zoneinfo/$3" /etc/localtime
hwclock --systohc
useradd -mg users -G wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable systemd-networkd wpa_supplicant gdm ntpd
systemctl disable avahi-daemon
systemctl mask avahi-daemon

bootctl install --esp-path=/boot
echo '- Exiting chroot'
exit
