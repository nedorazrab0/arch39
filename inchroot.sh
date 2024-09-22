#!/usr/bin/env bash
set -e
echo '- CHROOT'

locale-gen
ln -sf "/usr/share/zoneinfo/$3" /etc/localtime
hwclock -uw

useradd -mG wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable systemd-timesyncd bluetooth fstrim.timer reflector.timer systemd-resolved
bootctl install --esp-path=/boot
echo '- Exiting chroot'
exit
