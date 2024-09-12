#!/usr/bin/env bash
set -e
echo '- CHROOT'

locale-gen
ln -sf "/usr/share/zoneinfo/$3" /etc/localtime
hwclock -uw

useradd -mG wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable NetworkManager gdm systemd-timesyncd bluetooth fstrim.timer reflector.timer
systemctl disable avahi-daemon
systemctl mask avahi-daemon

bootctl install --esp-path=/boot
echo '- Exiting chroot'
exit
