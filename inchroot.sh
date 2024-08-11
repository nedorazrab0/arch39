#!/usr/bin/env bash
echo '- CHROOT'

locale-gen
timedatectl set-timezone "$3"
sed -i -e 's/#NTP=/NTP=/' -e 's/#FallbackNTP/FallbackNTP=time.google.com/' /etc/systemd/timesync.conf
timedatectl set-ntp true
systemctl restart systemd-timesyncd
hwclock -w

useradd -mg users -G wheel "$1"
echo "$1:$2" | chpasswd

systemctl enable systemd-networkd wpa_supplicant gdm systemd-timesyncd fstrim fstrim.timer
systemctl disable avahi-daemon
systemctl mask avahi-daemon

bootctl install --esp-path=/boot
echo '- Exiting chroot'
exit
