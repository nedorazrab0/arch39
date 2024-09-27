#!/usr/bin/env bash
set -e
echo '- CHROOT'

locale-gen
ln -sf "/usr/share/zoneinfo/$3" /etc/localtime
hwclock -uwv

useradd -mG wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable systemd-networkd systemd-resolved systemd-networkd-persistent-storage \
                 systemd-timesyncd fstrim.timer reflector.timer
bootctl install --esp-path=/boot
echo '- Exiting chroot'
